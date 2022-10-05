<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Hash;

use App\Models\_AssetWallet;
use App\Models\_AssetWalletAddress;
use App\Models\_PrefItem;
use App\Models\_User;

use App\Models\_Transaction;
use App\Http\Resources\_TransactionResource;
use App\Http\Resources\_TransactionResourceCollection;

class _TransactionController extends Controller
{
    private $ETHER_USDT_TEST_FACTOR = 2000;

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
            'sender_password' => ['sometimes', 'string', 'min:8', 'max:32'],
            'sender_note' => ['required_if:txn_context,==,offchain', 'string', 'max:255'],
            'recipient_username' => ['sometimes', 'string', 'exists:__users,username'],
            'recipient_note' => ['required_if:txn_context,==,offchain', 'string', 'max:255'],
            'source_blockchain_address' => ['sometimes', 'string'],
            'destination_blockchain_address' => ['sometimes', 'string', 'exists:__asset_wallet_addresses,blockchain_address'],
            'asset_code' => ['required', 'exists:__assets,code', 'string'],
            'xfer_asset_value' => ['required', 'numeric'],
            'txn_fee_fctr' => ['sometimes', 'numeric'],
            'is_recon' => ['sometimes', 'boolean'],
            'tatum_reference' => ['sometimes', 'string', 'unique:__transactions,tatum_reference'],
            'blockchain_txn_id' => ['sometimes', 'string', 'unique:__transactions,blockchain_txn_id'],
            'transfer_datetime' => ['required_if:is_recon,==,true', 'date:Y-m-d H:i:s'],
        ]);

        $is_recon = isset($validated_data['is_recon']) && $validated_data['is_recon'];

        if (!$is_recon && isset($validated_data['sender_username']) && !in_array($validated_data['sender_username'], ['reserves']) ){
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
        $recipient_new_total = 0;
        $recipient_new_usable = 0;

        // Create uid
        $validated_data['ref_code'] = random_int(100000, 199999).strtoupper(substr(md5(microtime()),rand(0,9),7));
        $validated_data['session_token'] = session()->get('active_session_token');
        $validated_data['action_user_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );
        $validated_data['transfer_result'] = [];

        $txn_fee_fctr = isset($validated_data['txn_fee_fctr']) ? $validated_data['txn_fee_fctr'] : 0;
        $validated_data['txn_fee_asset_value'] = (!isset($validated_data['sender_username']) || in_array($validated_data['recipient_username'], ['reserves']) || in_array($validated_data['sender_username'], ['reserves']) ) ? 0 : $validated_data['xfer_asset_value'] * $txn_fee_fctr;

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

            if ( $new_usable_balance_asset_value < 0 ){ return abort(422, 'Current '.$validated_data['asset_code'].' balance for '.$validated_data['sender_username'].' insufficient for transaction.'); }

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

            (new _AssetWalletController)->update( new Request([
                'usable_balance_asset_value' => $new_usable_balance_asset_value,
                'total_balance_asset_value' => $new_total_balance_asset_value,
            ]), $sender_asset_wallet->id );
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
                    'asset_code' => $validated_data['asset_code']
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

            (new _AssetWalletController)->update( new Request([
                'usable_balance_asset_value' => $new_usable_balance_asset_value,
                'total_balance_asset_value' => $new_total_balance_asset_value,
            ]), $recipient_asset_wallet->id );
        }

        if ( _PrefItem::firstWhere('key_slug', 'use_tatum_api')->value_f() ){
            $tatum_request_object = [
                'asset_code' => $validated_data['asset_code'],
                'senderAccountId' => isset($sender_asset_wallet) ? $sender_asset_wallet->tatum_virtual_account_id : null,
                'recipientAccountId' => isset($recipient_asset_wallet) ? $recipient_asset_wallet->tatum_virtual_account_id : null,
                'recipientNote' => isset($validated_data['recipient_note']) ? $validated_data['recipient_note'] : null,
                'senderNote' => isset($validated_data['sender_note']) ? $validated_data['sender_note'] : null,
                'amount' => ($validated_data['xfer_asset_value'] / $this->ETHER_USDT_TEST_FACTOR).'',
            ];
            if ($validated_data['txn_context'] == 'onchain') {
                if ($tatum_request_object['senderAccountId']){
                    $tatum_request_object['index'] = $sender_asset_wallet->tatum_derivation_key;
                    $tatum_request_object['address'] = $validated_data['destination_blockchain_address'];
                    if (!$is_recon){
                        $tatum_element = (new __TatumAPIController)->transferAssetValueFromVirtualAccountToBlockchain(new Request($tatum_request_object))->getData();
                        $validated_data['blockchain_txn_id'] = $tatum_element->txId;
                    }
                }
            } else {
                if (!$is_recon){
                    $tatum_element = (new __TatumAPIController)->transferAssetValueOffchain(new Request($tatum_request_object))->getData();
                    $validated_data['tatum_reference'] = $tatum_element->reference;
                }
            }
        }
        $element = _Transaction::create($validated_data);

        if ( isset($validated_data['sender_username']) && !in_array($validated_data['sender_username'], ['reserves']) ){
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

        if ( isset($validated_data['recipient_username']) && !in_array($validated_data['recipient_username'], ['reserves']) ){
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

        if ( isset($validated_data['sender_username']) && $validated_data['txn_fee_asset_value'] ){
            usleep(500);
            (new _TransactionController)->store( new Request([
                'txn_context' => 'offchain',
                'operation_slug' => 'transaction_fee_charge',
                'sender_username' => $validated_data['sender_username'],
                'sender_password' => $validated_data['sender_password'],
                'sender_note' => 'Outbound platform charge fee for transaction '.$element->ref_code,
                'recipient_username' => 'reserves',
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
    public function tatum_subscription_webhook_txrecon(Request $request)
    {
        session()->put('active_session_token', 'TATUM_NOTIFS_SSN');

        $validated_data = $request->validate([
            'accountId' => ['required', 'exists:__asset_wallets,tatum_virtual_account_id', 'string'],
            'subscriptionType' => ['required', 'string', Rule::in(['ACCOUNT_INCOMING_BLOCKCHAIN_TRANSACTION'])],
            'amount' => ['required', 'numeric'],
            'currency' => ['sometimes', 'string', 'exists:__assets,tatum_currency'],
            'txId' => ['required', 'string', 'unique:__transactions,blockchain_txn_id'],
            'reference' => ['sometimes', 'string'],
            'blockHeight' => ['sometimes', 'numeric'],
            'blockHash' => ['sometimes', 'string'],
            'from' => ['sometimes', 'string'],
            'to' => ['required', 'string', 'exists:__asset_wallet_addresses,blockchain_address'],
            'date' => ['required'],
        ]);

        $recipient_asset_wallet = _AssetWallet::firstWhere(['tatum_virtual_account_id' => $validated_data['accountId']]);
        $recipient_asset_wallet_address = _AssetWalletAddress::firstWhere(['blockchain_address' => $validated_data['to']]);
        
        if ( $recipient_asset_wallet->user_username !== $recipient_asset_wallet_address->user_username ){
            return abort( 422, 'accountId and destination address not belonging to the same user');
        }

        $transactions = (new __TatumAPIController)->getVirtualAccountTransactions(new Request(['virtual_account_id' => $validated_data['accountId'], 'currency' => $validated_data['currency']]))->getData();
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

        $recipient_asset_wallet = _AssetWallet::firstWhere(['tatum_virtual_account_id' => $validated_data['accountId']]);

        $txrecon_data = [
            'txn_context' => 'onchain',
            'operation_slug' => 'inbound_direct_transfer',
            'source_blockchain_address' => $validated_data['from'],
            'recipient_username' => $recipient_asset_wallet->user_username,
            'recipient_note' => isset($validated_data['recipient_note']) ? $validated_data['recipient_note'] : 'Transfer from external wallet to Ankelli wallet',
            'destination_blockchain_address' => $validated_data['to'],
            'asset_code' => $recipient_asset_wallet->asset_code,
            'xfer_asset_value' => $validated_data['amount'] * $this->ETHER_USDT_TEST_FACTOR,
            'is_recon' => true,
            'blockchain_txn_id' => $validated_data['txId'],
            'tatum_reference' => $validated_data['reference'],
            'transfer_datetime' => date('Y-m-d H:i:s', $validated_data['date'] / 1000)
        ];

        $used_destination_asset_wallet_address = _AssetWalletAddress::firstWhere(['blockchain_address' => $txrecon_data['destination_blockchain_address']]);
        $used_destination_asset_wallet_address->update(['onchain_txn_count' => $used_destination_asset_wallet_address->onchain_txn_count + 1, 'last_active_datetime' => $txrecon_data['transfer_datetime']]);

        return (new _TransactionController)->store(new Request($txrecon_data));
    }

    
    /**
     * Reconcile tatum transaction
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function tatum_txrecon(Request $request)
    {
        $validated_data = $request->validate([
            'amount' => ['required', 'numeric'],
            'operationType' => ['required', 'string'],
            'currency' => ['required', 'string', 'exists:__assets,tatum_currency'],
            'transactionType' => ['required', 'string'],
            'accountId' => ['required', 'string', 'exists:__asset_wallets,tatum_virtual_account_id'],
            'reference' => ['required', 'string'/*, 'unique:__transactions,tatum_reference'*/],
            'txId' => ['sometimes', 'string', 'unique:__transactions,blockchain_txn_id'],
            'address' => ['sometimes', 'string', 'exists:__asset_wallet_addresses,blockchain_address'],
            'marketValue' => ['required', 'array'],
            'created' => ['required'],
            'counterAccountId' => ['sometimes', 'exists:__asset_wallets,tatum_virtual_account_id', 'string'],
            'senderNote' => ['nullable', 'string'],
            'recipientNote' => ['nullable', 'string'],
        ]);

        $recipient_asset_wallet = _AssetWallet::firstWhere(['tatum_virtual_account_id' => $validated_data['accountId']]);

        $txrecon_data = [
            'is_recon' => true,
            'tatum_reference' => $validated_data['reference'],
            'transfer_datetime' => date('Y-m-d H:i:s', $validated_data['created'] / 1000),
            'asset_code' => $recipient_asset_wallet->asset_code,
            'xfer_asset_value' => $validated_data['amount'] * $this->ETHER_USDT_TEST_FACTOR,
            'recipient_username' => $recipient_asset_wallet->user_username,
        ];

        if ($validated_data['operationType'] === 'PAYMENT'){
            if ($validated_data['transactionType'] === 'CREDIT_PAYMENT'){
                $sender_asset_wallet = _AssetWallet::firstWhere(['tatum_virtual_account_id' => $validated_data['counterAccountId']]);
                if( session()->get('temp_tatum_reference') == $validated_data['reference']){
                    $validated_data['senderNote'] = session()->get('temp_senderNote');
                    session()->forget('temp_tatum_reference');
                    session()->forget('temp_senderNote');
                }
                $txrecon_data['txn_context'] = 'offchain';
                $txrecon_data['sender_username'] = $sender_asset_wallet->user_username;
                $txrecon_data['sender_note'] = isset($validated_data['senderNote']) ? $validated_data['senderNote'] : 'Reconciled payment';
                $txrecon_data['recipient_note'] = isset($validated_data['recipientNote']) ? $validated_data['recipientNote'] : 'Reconciled payment';
                $txrecon_data['operation_slug'] = 'payment_reconciliation';
            }
            if ($validated_data['transactionType'] === 'DEBIT_PAYMENT'){
                $transaction = _Transaction::firstWhere(['tatum_reference' => $validated_data['reference']]);
                if ($transaction){
                    $transaction->update(['sender_note' => $validated_data['senderNote']]);
                    session()->forget('temp_tatum_reference');
                    session()->forget('temp_senderNote');
                } else {
                    session()->put('temp_tatum_reference', $validated_data['reference']);
                    session()->put('temp_senderNote', $validated_data['senderNote']);
                }
                return response()->json();
            }
        }

        if ($validated_data['operationType'] === 'DEPOSIT' && $validated_data['transactionType'] === 'CREDIT_DEPOSIT'){
            $txrecon_data['txn_context'] = 'onchain';
            $txrecon_data['recipient_note'] = $validated_data['marketValue'] && $validated_data['marketValue']['source'] ? 'Transfer from '.$validated_data['marketValue']['source'].' wallet to Ankelli wallet' : null;
            $txrecon_data['operation_slug'] = 'inbound_direct_transfer';
            $txrecon_data['destination_blockchain_address'] = $validated_data['address'];
            $txrecon_data['blockchain_txn_id'] = $validated_data['txId'];
        }

        if (isset($txrecon_data['destination_blockchain_address'])){
            $used_destination_asset_wallet_address = _AssetWalletAddress::firstWhere(['blockchain_address' => $txrecon_data['destination_blockchain_address']]);
            $used_destination_asset_wallet_address->update(['onchain_txn_count' => $used_destination_asset_wallet_address->onchain_txn_count + 1, 'last_active_datetime' => $txrecon_data['transfer_datetime']]);
        }

        return (new _TransactionController)->store(new Request($txrecon_data));
    }

    /**
     * Process a payment transaction
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function process_payment(Request $request)
    {

    }
    
    /**
     * Process a direct transfer transaction
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function process_direct_transfer(Request $request)
    {
        $validated_data = $request->validate([
            'send_to' => ['required', 'string', Rule::in(['platform_username', 'blockchain_address'])],
            'asset_code' => ['required', 'exists:__assets,code', 'string'],
            'asset_value' => ['required', 'numeric'],
            'recipient_username' => ['required_if:send_to,==,platform_username', 'string', 'exists:__users,username'],
            'recipient_note' => ['required_if:send_to,==,platform_username', 'string', 'max:32'],
            'destination_blockchain_address' => ['required_if:send_to,==,blockchain_address', 'string'],
            'sender_password' => ['required', 'string', 'min:8', 'max:32'],
            'sender_note' => ['required', 'string', 'max:32'],
        ]);

        $validated_data['sender_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );

        if ( isset($validated_data['destination_blockchain_address']) && _AssetWalletAddress::where(['blockchain_address' => $validated_data['destination_blockchain_address']])->exists()){
            return abort(422, 'Provided address belongs to a user on this platform. Use their username instead');
        }
        
        if (isset($validated_data['recipient_username'])){
            $validated_data['txn_context'] = 'offchain';
            $validated_data['operation_slug'] = 'direct_transfer';
            $validated_data['txn_fee_fctr'] = _PrefItem::firstWhere('key_slug', 'drct_xfer_offchain_txn_fee_fctr')->value_f();
        } else {
            $validated_data['txn_context'] = 'onchain';
            $validated_data['operation_slug'] = 'outbound_direct_transfer';
            $validated_data['txn_fee_fctr'] = _PrefItem::firstWhere('key_slug', 'drct_xfer_onchain_txn_fee_fctr')->value_f();
        }

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

    /**
     * Remove the specified resource from storage.
     *
     * @param  string $ref_code
     * @return \Illuminate\Http\Response
     */
    public function destroy(string $ref_code)
    {
        $element = _Transaction::findOrFail($ref_code);
        if ( in_array( $element->operation_slug, ['escrow_asset_lock', 'escrow_asset_unlock'] )){
            $element->delete();
            return response()->json(['success' => 'success'], 200);
        } else {
            return abort(422, 'Transaction cannot be deleted');
        }
    }
}
