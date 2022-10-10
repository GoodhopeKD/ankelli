<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Hash;

use App\Models\_Asset;
use App\Models\_AssetWallet;
use App\Models\_AssetWalletAddress;
use App\Models\_PrefItem;
use App\Models\_User;
use App\Models\_EmailAddress;

use App\Models\_Transaction;
use App\Http\Resources\_TransactionResource;
use App\Http\Resources\_TransactionResourceCollection;

class _TransactionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $result = null;

        if ( $result === null && request()->get_as_addon_prop && request()->get_as_addon_prop == true ){
            $result = _Transaction::where(['_status'=>'active'])
            ->orderByDesc('transfer_datetime')->paginate(request()->per_page)->withQueryString(); 
        }
        
        if ( $result === null ){
            $simple_query_args = [];

            if ( request()->sender_username ){ $simple_query_args = array_merge( $simple_query_args, [ 'sender_username' => request()->sender_username ]); }
            if ( request()->recipient_username ){ $simple_query_args = array_merge( $simple_query_args, [ 'recipient_username' => request()->recipient_username ]); }

            $eloquent_query = _Transaction::where($simple_query_args);

            if ( request()->user_username && is_string( request()->user_username ) ){
                $eloquent_query = $eloquent_query
                ->where(['sender_username' => request()->user_username ])
                ->orWhere(function($query) { $query->where(['recipient_username' => request()->user_username ]); });
            }
            
            $result = $eloquent_query->orderByDesc('transfer_datetime')->paginate(request()->per_page)->withQueryString();
        }

        return $result ? ( request()->get_with_meta && request()->get_with_meta == true ? _TransactionResource::collection( $result ) : new _TransactionResourceCollection( $result ) ) : null;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validated_data = $request->validate([
            'txn_context' => ['required', 'string', Rule::in(['onchain', 'offchain'])],
            'operation_slug' => ['required', 'string'],
            'sender_username' => ['sometimes', 'string', 'exists:__users,username'],
            'sender_password' => ['sometimes', 'string', 'between:8,32'],
            'sender_note' => ['required_if:txn_context,==,offchain', 'string', 'max:255'],
            'recipient_username' => ['sometimes', 'string', 'exists:__users,username'],
            'recipient_note' => ['required_if:txn_context,==,offchain', 'string', 'max:255'],
            'source_blockchain_address' => ['sometimes', 'string', 'between:13,128'],
            'destination_blockchain_address' => ['sometimes', 'string', 'between:13,128'],
            'asset_code' => ['required', 'string', 'exists:__assets,code'],
            'xfer_asset_value' => ['required', 'numeric', 'min:0'],
            'txn_fee_fctr' => ['nullable', 'numeric', 'min:0'],
            'txn_fee_asset_value' => ['nullable', 'numeric', 'min:0'],
            'is_recon' => ['sometimes', 'boolean'],
            'ttm_reference' => ['sometimes', 'string'],
            'blockchain_txn_id' => ['nullable', 'string', 'unique:__transactions,blockchain_txn_id'],
            'transfer_datetime' => ['required_if:is_recon,==,true', 'date:Y-m-d H:i:s'],
        ]);

        $is_recon = isset($validated_data['is_recon']) && $validated_data['is_recon'];

        if (!$is_recon && isset($validated_data['sender_username']) && !in_array($validated_data['sender_username'], ['busops']) ){
            if (isset($validated_data['sender_password'])){
                if (!Hash::check($validated_data['sender_password'], _User::firstWhere('username', session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null ))->makeVisible(['password'])->password)) {
                    return abort(422, 'Password incorrect');
                }
            } else {
                return abort(403, 'Source user password required to authorize transaction');
            }
        }

        $sender_new_total = 0;
        $sender_new_usable = 0;
        $sender_asset_wallet_id = 0;
        $should_update_sender = false;

        $recipient_new_total = 0;
        $recipient_new_usable = 0;
        $recipient_asset_wallet_id = 0;
        $should_update_recipient = false;

        // Create uid
        $validated_data['ref_code'] = random_int(100000, 199999).strtoupper(substr(md5(microtime()),rand(0,9),7));
        $validated_data['session_token'] = session()->get('active_session_token');
        $validated_data['action_user_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );
        $validated_data['transfer_result'] = [];

        $validated_data['txn_fee_asset_value'] = $validated_data['txn_fee_asset_value'] ?? ( $validated_data['xfer_asset_value'] * ( $validated_data['txn_fee_fctr'] ?? 0) );

        if (isset($validated_data['sender_username'])){
            if ( isset($validated_data['recipient_username']) && $validated_data['sender_username'] == $validated_data['recipient_username']){
                return abort(422, 'Cannot transact to self.');
            }
            $sender_asset_wallet = _AssetWallet::firstWhere([
                'user_username' => $validated_data['sender_username'], 
                'asset_code' => $validated_data['asset_code']
            ]);

            if ( $sender_asset_wallet->_status == 'frozen' ){ return abort(422, 'Selected asset is frozen.'); }
            if ( !$sender_asset_wallet ){ return abort(422, 'Current '.$validated_data['asset_code'].' balance insufficient for transaction.'); }
            
            $old_usable_balance_asset_value = $sender_asset_wallet->usable_balance_asset_value;
            $new_usable_balance_asset_value = $old_usable_balance_asset_value - $validated_data['xfer_asset_value'];

            if ( $new_usable_balance_asset_value < 0 ){ return abort(422, 'Current '.$validated_data['asset_code'].' balance insufficient for transaction.'); }

            $old_total_balance_asset_value = $sender_asset_wallet->total_balance_asset_value;
            $new_total_balance_asset_value = $old_total_balance_asset_value - $validated_data['xfer_asset_value'];

            array_push( $validated_data['transfer_result'], [
                'user_username' => $validated_data['sender_username'],
                'old_usable_balance_asset_value' => $old_usable_balance_asset_value,
                'new_usable_balance_asset_value' => $new_usable_balance_asset_value,
                'old_total_balance_asset_value' => $old_total_balance_asset_value,
                'new_total_balance_asset_value' => $new_total_balance_asset_value,
            ]);

            $sender_new_total = $new_total_balance_asset_value;
            $sender_new_usable = $new_usable_balance_asset_value;

            $sender_asset_wallet_id = $sender_asset_wallet->id;
            $should_update_sender = true;
        }

        if (isset($validated_data['recipient_username'])){
            //$recipient = _User::where('username', $validated_data['recipient_username']);
            $recipient_asset_wallet = _AssetWallet::firstWhere([
                'user_username' => $validated_data['recipient_username'], 
                'asset_code' => $validated_data['asset_code']
            ]);
            if (!$recipient_asset_wallet){
                $recipient_asset_wallet = (new _AssetWalletController)->store( Request::create('','',[
                    'user_username' => $validated_data['recipient_username'], 
                    'asset_code' => $validated_data['asset_code'],
                    'asset_chain' => _Asset::firstWhere(['code' => $validated_data['asset_code']])->chain,
                ],[],[],['HTTP_accept'=>'application/json']))->getData();
            }

            $old_usable_balance_asset_value = $recipient_asset_wallet->usable_balance_asset_value;
            $new_usable_balance_asset_value = $old_usable_balance_asset_value + $validated_data['xfer_asset_value'];

            $old_total_balance_asset_value = $recipient_asset_wallet->total_balance_asset_value;
            $new_total_balance_asset_value = $old_total_balance_asset_value + $validated_data['xfer_asset_value'];

            array_push( $validated_data['transfer_result'], [
                'user_username' => $validated_data['recipient_username'],
                'old_usable_balance_asset_value' => $old_usable_balance_asset_value,
                'new_usable_balance_asset_value' => $new_usable_balance_asset_value,
                'old_total_balance_asset_value' => $old_total_balance_asset_value,
                'new_total_balance_asset_value' => $new_total_balance_asset_value,
            ]);

            $recipient_new_total = $new_total_balance_asset_value;
            $recipient_new_usable = $new_usable_balance_asset_value;

            $recipient_asset_wallet_id = $recipient_asset_wallet->id;
            $should_update_recipient = true;
        }

        if ( _PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f() ){
            $ttm_request_object = [
                'asset_code' => $validated_data['asset_code'],
                'senderAccountId' => isset($sender_asset_wallet) ? $sender_asset_wallet->ttm_virtual_account_id : null,
                'recipientAccountId' => isset($recipient_asset_wallet) ? $recipient_asset_wallet->ttm_virtual_account_id : null,
                'recipientNote' => isset($validated_data['recipient_note']) ? $validated_data['recipient_note'] : null,
                'senderNote' => isset($validated_data['sender_note']) ? $validated_data['sender_note'] : null,
                'amount' => $validated_data['xfer_asset_value'].'',
            ];
            if ($validated_data['txn_context'] == 'onchain') {
                if ($ttm_request_object['senderAccountId']){
                    $ttm_request_object['address'] = strtolower( $validated_data['destination_blockchain_address'] );
                    //$ttm_request_object['index'] = _AssetWalletAddress::firstWhere(['user_username' => $validated_data['sender_username']])->ttm_derivation_key;
                    if (!$is_recon){
                        $transferer = null;
                        switch ($validated_data['asset_code']) {
                            case 'BTC':
                                $transferer = 'EthTransfer';
                                break;
                            case 'ETH':
                                $transferer = 'EthTransfer';
                                break;
                            case 'USDT':
                                $transferer = 'EthTransferErc20';
                                $ttm_request_object['currency'] = 'USDT';
                                break;
                            case 'TRON':
                                $transferer = 'TronTransferOffchain';
                                $ttm_request_object['from'] = _AssetWalletAddress::firstWhere(['user_username' => $validated_data['sender_username']])->blockchain_address;
                                break;
                        }
                        $ttm_element = (new Tatum\VirtualAccounts\BCOperationController)->EthTransfer(new Request($ttm_request_object))->getData();
                        if (isset($ttm_element->txId)) $validated_data['blockchain_txn_id'] = $ttm_element->txId;
                        if (isset($ttm_element->signatureId)) $validated_data['tatum_unsigned_txn_signature_id'] = $ttm_element->signatureId;
                    }
                }
            } else {
                if (!$is_recon){
                    $ttm_element = (new Tatum\VirtualAccounts\TransactionController)->sendTransaction(new Request($ttm_request_object))->getData();
                    $validated_data['ttm_reference'] = $ttm_element->reference;
                }
            }
        }

        if ( $should_update_sender ){
            (new _AssetWalletController)->update( new Request([
                'usable_balance_asset_value' => $sender_new_usable,
                'total_balance_asset_value' => $sender_new_total,
            ]), $sender_asset_wallet_id );
        }
        if ( $should_update_recipient ){
            (new _AssetWalletController)->update( new Request([
                'usable_balance_asset_value' => $recipient_new_usable,
                'total_balance_asset_value' => $recipient_new_total,
            ]), $recipient_asset_wallet_id );
        }
        $element = _Transaction::create($validated_data);

        if ( isset($validated_data['sender_username']) && !in_array($validated_data['sender_username'], ['busops']) ){
            // Create notification
            (new _NotificationController)->store( new Request([
                'user_username' => $validated_data['sender_username'],
                'content' => [
                    'title' => 'Debit Transaction',
                    'subtitle' => $validated_data['xfer_asset_value'].' '.$validated_data['asset_code'].' has been debited from your account.',
                    'body' => $validated_data['xfer_asset_value']." ".$validated_data["asset_code"]." has been debited from your account.\nTxn ref: ".$element->ref_code.".\nDescription: ".$validated_data["sender_note"]."\nNew balances: Usable : ".$sender_new_usable ." ".$validated_data["asset_code"].", Total : ".$sender_new_total ." ".$validated_data["asset_code"],
                ],
            ]));
            // End Create notification
        }

        if ( isset($validated_data['recipient_username']) && !in_array($validated_data['recipient_username'], ['busops']) ){
            // Create notification
            (new _NotificationController)->store( new Request([
                'user_username' => $validated_data['recipient_username'],
                'content' => [
                    'title' => 'Credit Transaction',
                    'subtitle' => $validated_data['xfer_asset_value'].' '.$validated_data['asset_code'].' has been credited into your account.',
                    'body' => $validated_data['xfer_asset_value']." ".$validated_data["asset_code"]." has been credited into your account.\nTxn ref: ".$element->ref_code.".\nDescription: ".$validated_data["recipient_note"]."\nNew balances: Usable : ".$recipient_new_usable ." ".$validated_data["asset_code"].", Total : ".$recipient_new_total ." ".$validated_data["asset_code"],
                ],
            ]));
            // End Create notification
        }

        if ( $validated_data['txn_fee_asset_value'] > 0 ){
            usleep(500);
            (new _TransactionController)->store( new Request([
                'txn_context' => 'offchain',
                'operation_slug' => 'TRANSACTION_CHARGE',
                'sender_username' => $validated_data['sender_username'],
                'sender_password' => $validated_data['sender_password'],
                'sender_note' => 'Outbound platform charge fee for transaction '.$element->ref_code,
                'recipient_username' => 'busops',
                'recipient_note' => 'Platform charge fee for transaction '.$element->ref_code,
                'asset_code' => $validated_data['asset_code'],
                'xfer_asset_value' => $validated_data['txn_fee_asset_value'],
            ]));
        }

        return response()->json( [ 'ref_code' => $element->ref_code ] );
        //return response()->json( new _TransactionResource( $element ) );
    }

    
    /**
     * Webhook to reconcile items from subscription
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function ttm_recon_for_incoming_bc_txn_notification(Request $request)
    {
        session()->put('active_session_token', 'TATUM_NOTIFS_SSN');

        $validated_data = $request->validate([
            'subscriptionType' => ['required', 'string', Rule::in(['ACCOUNT_INCOMING_BLOCKCHAIN_TRANSACTION'])],
            'accountId' => ['required', 'string', 'exists:__asset_wallets,ttm_virtual_account_id', 'size:24'],
            'amount' => ['required', 'numeric'], // positive and negative values
            'currency' => ['sometimes', 'string', 'exists:__assets,code'],
            'txId' => ['required', 'string', 'unique:__transactions,blockchain_txn_id'],
            'reference' => ['sometimes', 'string'],
            'blockHeight' => ['sometimes', 'numeric', 'min:0'],
            'blockHash' => ['sometimes', 'string'],
            'from' => ['sometimes', 'string', 'between:13,128'],
            'to' => ['required', 'string', 'between:13,128'],
            'date' => ['required'],
        ]);

        $recipient_asset_wallet = _AssetWallet::firstWhere(['ttm_virtual_account_id' => $validated_data['accountId']]);
        $recipient_asset_wallet_address = _AssetWalletAddress::firstWhere(['blockchain_address' => strtolower( $validated_data['to'] )]);
        
        if ( $recipient_asset_wallet->user_username !== $recipient_asset_wallet_address->user_username ){
            return abort( 422, 'accountId and destination address not belonging to the same user');
        }

        $transactions = (new Tatum\VirtualAccounts\TransactionController)->getTransactionsByAccountId(new Request(['virtual_account_id' => $validated_data['accountId'], 'currency' => $validated_data['currency']]))->getData();
        $actual_transaction = null;
        if ( count($transactions) ){
            $found_key = array_search( $validated_data['txId'], array_column($transactions, 'txId') );
            $actual_transaction = is_numeric( $found_key ) ? $transactions[$found_key] : null;
        }

        if ($actual_transaction){
            $validated_data['date'] = $actual_transaction->created;
            $validated_data['recipient_note'] = $actual_transaction->marketValue && $actual_transaction->marketValue->source ? 'Transfer from '.$actual_transaction->marketValue->source.' wallet to Ankelli wallet' : null;
            $validated_data['reference'] = $actual_transaction->reference;
            $validated_data['to'] = $actual_transaction->address;
        } else {
            return abort( 404, 'Actual transaction not found');
        }

        $recipient_asset_wallet = _AssetWallet::firstWhere(['ttm_virtual_account_id' => $validated_data['accountId']]);

        $txn_recon_data = [
            'txn_context' => 'onchain',
            'operation_slug' => 'deposit',
            'source_blockchain_address' => strtolower( $validated_data['from'] ),
            'recipient_username' => $recipient_asset_wallet->user_username,
            'recipient_note' => isset($validated_data['recipient_note']) ? $validated_data['recipient_note'] : 'Transfer from external wallet to Ankelli wallet',
            'destination_blockchain_address' => strtolower( $validated_data['to'] ),
            'asset_code' => $recipient_asset_wallet->asset_code,
            'xfer_asset_value' => $validated_data['amount'],
            'is_recon' => true,
            'blockchain_txn_id' => $validated_data['txId'],
            'ttm_reference' => $validated_data['reference'],
            'transfer_datetime' => date('Y-m-d H:i:s', $validated_data['date'] / 1000)
        ];

        $used_destination_asset_wallet_address = _AssetWalletAddress::firstWhere(['blockchain_address' => strtolower( $txn_recon_data['destination_blockchain_address'] )]);
        if ($used_destination_asset_wallet_address)
        $used_destination_asset_wallet_address->update(['onchain_txn_count' => $used_destination_asset_wallet_address->onchain_txn_count + 1, 'last_active_datetime' => $txn_recon_data['transfer_datetime']]);

        return (new _TransactionController)->store(new Request($txn_recon_data));
    }

    
    /**
     * Webhook to reconcile items from subscription
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function ttm_recon_for_completed_kms_txn_notification(Request $request)
    {
        session()->put('active_session_token', 'TATUM_NOTIFS_SSN');

        $validated_data = $request->validate([
            'subscriptionType' => ['required', 'string', Rule::in(['KMS_COMPLETED_TX'])],
            'txId' => ['required', 'string', 'unique:__transactions,blockchain_txn_id'],
            'signatureId' => ['required', 'string', 'exists:__transactions,tatum_unsigned_txn_signature_id'],
        ]);

        $transaction = _Transaction::firstWhere(['tatum_unsigned_txn_signature_id' => $validated_data['signatureId']]);
        $transaction->update(['blockchain_txn_id' => $validated_data['txId']]);
    }
    
    /**
     * Webhook to reconcile items from subscription
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function ttm_recon_for_failed_kms_txn_notification(Request $request)
    {
        session()->put('active_session_token', 'TATUM_NOTIFS_SSN');

        $validated_data = $request->validate([
            'subscriptionType' => ['required', 'string', Rule::in(['KMS_FAILED_TX'])],
            'error' => ['sometimes'],
            'signatureId' => ['required', 'string', 'exists:__transactions,tatum_unsigned_txn_signature_id'],
        ]);

        $transaction = _Transaction::firstWhere(['tatum_unsigned_txn_signature_id' => $validated_data['signatureId']]);
        
        // Notify user of a rollback
        (new _NotificationController)->store( new Request([
            'user_username' => $transaction->sender_username,
            'content' => [
                'title' => 'Transaction Rollback',
                'subtitle' => 'A transaction you made has been rolled back.',
                'body' => "A transaction you made has been rolled for the following reason:\n".(isset($validated_data['error']) ? $validated_data['error'] : 'Unknown reason'),
            ],
        ]));

        // Delete to prevent retry
        $asset = _Asset::firstWhere(['code' => $transaction->asset_code]);
        foreach ((new Tatum\Security\KMSController)->ReceivePendingTransactionsToSign(new Request(['chain' => $asset->chain]))->getData() as $unsigned_transaction) {
            if ($unsigned_transaction->id == $validated_data['signatureId']){
                (new Tatum\Security\KMSController)->DeletePendingTransactionToSign(new Request(['id' => $unsigned_transaction->id]));
                break;
            }
        }
        // Rollback the withdrawal transaction
        $txn_recon_data = [
            'txn_context' => 'onchain',
            'is_recon' => true,
            'asset_code' => $transaction->asset_code,
            'xfer_asset_value' => $transaction->xfer_asset_value,
            'recipient_username' => $transaction->sender_username,
            'recipient_note' => 'Rollback for: '.$transaction->sender_note,
            'source_blockchain_address' => strtolower( $transaction->destination_blockchain_address ),
            'operation_slug' => 'WITHDRAWAL_ROLLBACK',
            'transfer_datetime' => now()->toDateTimeString(),
        ];
        (new _TransactionController)->store(new Request($txn_recon_data));

        // Rollback transaction charge transaction
        $transaction = _Transaction::firstWhere(['sender_note' => 'Outbound platform charge fee for transaction '.$transaction->ref_code]);
        if ($transaction){
            $txn_recon_data = [
                'txn_context' => 'offchain',
                'is_recon' => true,
                'asset_code' => $transaction->asset_code,
                'xfer_asset_value' => $transaction->xfer_asset_value,
                'recipient_username' => $transaction->sender_username,
                'recipient_note' => 'Rollback for: '.$transaction->sender_note,
                'sender_username' => $transaction->recipient_username,
                'sender_note' => 'Rollback for: '.$transaction->recipient_note,
                'operation_slug' => 'TRANSACTION_CHARGE_ROLLBACK',
                'transfer_datetime' => now()->toDateTimeString(),
            ];
            (new _TransactionController)->store(new Request($txn_recon_data));
        }
    }
    
    /**
     * Reconcile tatum transaction
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function ttm_txn_recon(Request $request)
    {
        $validated_data = $request->validate([
            'amount' => ['required', 'numeric'], // positive and negative values
            'operationType' => ['required', 'string'],
            'currency' => ['required', 'string', 'exists:__assets,code'],
            'transactionType' => ['required', 'string'],
            'accountId' => ['required', 'string', 'size:24', 'exists:__asset_wallets,ttm_virtual_account_id'],
            'reference' => ['required', 'string'],
            'txId' => ['nullable', 'string', 'unique:__transactions,blockchain_txn_id'],
            'address' => ['sometimes', 'string', 'between:13,128'],
            'marketValue' => ['required', 'array'],
            'created' => ['required'],
            'counterAccountId' => ['sometimes', 'string'],
            'senderNote' => ['nullable', 'string'],
            'recipientNote' => ['nullable', 'string'],
        ]);

        $focused_asset_wallet = _AssetWallet::firstWhere(['ttm_virtual_account_id' => $validated_data['accountId']]);

        $txn_recon_data = [
            'is_recon' => true,
            'ttm_reference' => $validated_data['reference'],
            'transfer_datetime' => date('Y-m-d H:i:s', $validated_data['created'] / 1000),
            'asset_code' => $focused_asset_wallet->asset_code,
            'xfer_asset_value' => abs($validated_data['amount']),
        ];

        if ( in_array($validated_data['transactionType'] , ['DEBIT_WITHDRAWAL'] )){
            $txn_recon_data['sender_username'] = $focused_asset_wallet->user_username;
        } else {
            $txn_recon_data['recipient_username'] = $focused_asset_wallet->user_username;
        }

        if ($validated_data['operationType'] === 'PAYMENT'){
            if ($validated_data['transactionType'] === 'CREDIT_PAYMENT'){
                $sender_asset_wallet = _AssetWallet::firstWhere(['ttm_virtual_account_id' => $validated_data['counterAccountId']]);
                if( session()->get('temp_ttm_reference') == $validated_data['reference']){
                    $validated_data['senderNote'] = session()->get('temp_senderNote');
                    session()->forget('temp_ttm_reference');
                    session()->forget('temp_senderNote');
                }
                $txn_recon_data['txn_context'] = 'offchain';
                $txn_recon_data['sender_username'] = $sender_asset_wallet->user_username;
                $txn_recon_data['sender_note'] = $validated_data['senderNote'] ?? 'Reconciled payment';
                $txn_recon_data['recipient_note'] = $validated_data['recipientNote'] ?? 'Reconciled payment';
                $txn_recon_data['operation_slug'] = 'PAYMENT_RECONCILIATION';
            }
            if ($validated_data['transactionType'] === 'DEBIT_PAYMENT'){
                $transaction = _Transaction::firstWhere(['ttm_reference' => $validated_data['reference']]);
                if ($transaction){
                    $transaction->update(['sender_note' => $validated_data['senderNote']]);
                    session()->forget('temp_ttm_reference');
                    session()->forget('temp_senderNote');
                } else {
                    session()->put('temp_ttm_reference', $validated_data['reference']);
                    session()->put('temp_senderNote', $validated_data['senderNote']);
                }
                return response()->json();
            }
        }

        if ($validated_data['operationType'] === 'DEPOSIT' && $validated_data['transactionType'] === 'CREDIT_DEPOSIT'){
            $txn_recon_data['txn_context'] = 'onchain';
            $txn_recon_data['recipient_note'] = $validated_data['marketValue'] && $validated_data['marketValue']['source'] ? 'Transfer from '.$validated_data['marketValue']['source'].' wallet to Ankelli wallet' : '';
            $txn_recon_data['operation_slug'] = 'DEPOSIT';
            $txn_recon_data['destination_blockchain_address'] = strtolower( $validated_data['address'] );
            $txn_recon_data['blockchain_txn_id'] = $validated_data['txId'];
        }

        if ($validated_data['operationType'] === 'WITHDRAWAL'){
            $txn_recon_data['txn_context'] = 'onchain';
            if ($validated_data['transactionType'] === 'DEBIT_WITHDRAWAL'){
                $txn_recon_data['sender_note'] = $validated_data['senderNote'] ?? $validated_data['marketValue'] && $validated_data['marketValue']['source'] ? 'Transfer from Ankelli wallet to '.$validated_data['marketValue']['source'] : '';
                $txn_recon_data['operation_slug'] = 'WITHDRAWAL';
                $txn_recon_data['destination_blockchain_address'] = strtolower( $validated_data['counterAccountId'] );
                $txn_recon_data['blockchain_txn_id'] = isset($validated_data['txId']) ? $validated_data['txId'] : null;
            }
            if ($validated_data['transactionType'] === 'CANCEL_WITHDRAWAL'){
                $txn_recon_data['recipient_note'] = 'Rollback for: '.($validated_data['senderNote'] ?? $validated_data['marketValue'] && $validated_data['marketValue']['source'] ? 'Transfer from Ankelli wallet to '.$validated_data['marketValue']['source'] : '');
                $txn_recon_data['operation_slug'] = 'WITHDRAWAL_ROLLBACK';
                $txn_recon_data['source_blockchain_address'] = strtolower( $validated_data['counterAccountId'] );
            }
        }

        if (isset($txn_recon_data['destination_blockchain_address'])){
            $used_destination_asset_wallet_address = _AssetWalletAddress::firstWhere(['blockchain_address' => strtolower( $txn_recon_data['destination_blockchain_address'] )]);
            if ($used_destination_asset_wallet_address)
            $used_destination_asset_wallet_address->update(['onchain_txn_count' => $used_destination_asset_wallet_address->onchain_txn_count + 1, 'last_active_datetime' => $txn_recon_data['transfer_datetime']]);
        }

        return (new _TransactionController)->store(new Request($txn_recon_data));
    }

    /**
     * Address transaction notification
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function ttm_address_txn_notification(Request $request)
    {
        // use only for custodial wallets
    }

    /**
     * Process a payment transaction
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function process_payment(Request $request)
    {
        $validated_data = $request->validate([
            'asset_code' => ['required', 'string', 'exists:__assets,code'],
            'asset_value' => ['required', 'numeric', 'min:0'],
            'recipient_user_tag' => ['required', 'string', Rule::in(['username', 'email_address', 'ankelli_pay_id'])],
            'recipient_username' => ['required_if:recipient_user_tag,=,username', 'nullable', 'string', 'exists:__users,username'],
            'recipient_email_address' => ['required_if:recipient_user_tag,=,email_address', 'nullable', 'string', 'exists:__email_addresses,email_address'],
            'recipient_ankelli_pay_id' => ['required_if:recipient_user_tag,=,ankelli_pay_id', 'nullable', 'string', 'exists:__users,ankelli_pay_id'],
            'recipient_note' => ['required', 'string', 'max:32'],
            'sender_password' => ['required', 'string', 'between:8,32'],
            'sender_note' => ['required', 'string', 'max:32'],
        ]);
        switch ($validated_data['recipient_user_tag']) {
            case 'email_address':
                $validated_data['recipient_username'] = _EmailAddress::firstWhere(['email_address' => $validated_data['recipient_email_address']])->user_username;
                break;
            case 'ankelli_pay_id':
                $validated_data['recipient_username'] = _User::firstWhere(['ankelli_pay_id' => $validated_data['recipient_ankelli_pay_id']])->username;
                break;
        }
        $validated_data['sender_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );
        $validated_data['txn_context'] = 'offchain';
        $validated_data['operation_slug'] = 'PAYMENT';
        $asset = _Asset::firstWhere('code', $validated_data['asset_code']);
        $validated_data['txn_fee_asset_value'] = $asset->usd_asset_exchange_rate * $asset->payment_txn_fee_usd_fctr;
        $validated_data['xfer_asset_value'] = $validated_data['asset_value'];
        return (new _TransactionController)->store(new Request($validated_data));
    }
    
    /**
     * Process a direct transfer transaction
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function process_withdrawal(Request $request)
    {
        $validated_data = $request->validate([
            'asset_code' => ['required', 'string', 'exists:__assets,code'],
            'asset_value' => ['required', 'numeric', 'min:0'],
            'destination_blockchain_address' => ['required', 'string', 'between:13,128'],
            'sender_password' => ['required', 'string', 'between:8,32'],
            'sender_note' => ['required', 'string', 'max:32'],
        ]);

        $validated_data['sender_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );

        if ( isset($validated_data['destination_blockchain_address']) && _AssetWalletAddress::where(['blockchain_address' => strtolower( $validated_data['destination_blockchain_address'] )])->exists()){
            return abort(422, 'Provided address belongs to a user on this platform. Send payment instead');
        }
        
        $validated_data['txn_context'] = 'onchain';
        $validated_data['operation_slug'] = 'WITHDRAWAL';
        $asset = _Asset::firstWhere('code', $validated_data['asset_code']);
        $validated_data['txn_fee_asset_value'] = $asset->usd_asset_exchange_rate * $asset->withdrawal_txn_fee_usd_fctr;

        $validated_data['xfer_asset_value'] = $validated_data['asset_value'];

        return (new _TransactionController)->store(new Request($validated_data));
    }

    /**
     * Display the specified resource.
     *
     * @param  string $ref_code
     * @return \Illuminate\Http\Response
     */
    public function show(string $ref_code)
    {
        //
    }
}
