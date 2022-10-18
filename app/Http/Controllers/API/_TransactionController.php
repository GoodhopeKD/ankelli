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
            'ttm_reference' => ['sometimes', 'string', 'unique:__transactions,ttm_reference'],
            'ttm_bc_txn_signature_id' => ['nullable', 'string', 'unique:__transactions,ttm_bc_txn_signature_id'],
            //'ttm_centralization_factor' => ['nullable', 'numeric', 'between:1,2'],
            'ttm_amount_blockage_id' => ['nullable', 'string', 'unique:__transactions,ttm_amount_blockage_id'],
            'asset_value_escrowed' => ['nullable', 'numeric', 'min:0'],
            'bc_txn_id' => ['nullable', 'string', 'unique:__transactions,bc_txn_id'],

            'operation_slug' => ['required', 'string'],
            '_status' => ['required', 'string', Rule::in(['pending', 'failed', 'completed'])],

            'sender_bc_address' => ['sometimes', 'string', 'between:13,128'],
            'sender_username' => ['sometimes', 'string', 'exists:__users,username'],
            'sender_note' => ['sometimes', 'string', 'max:255'],

            'recipient_bc_address' => ['sometimes', 'string', 'between:13,128'],
            'recipient_username' => ['sometimes', 'string', 'exists:__users,username'],
            'recipient_note' => ['sometimes', 'string', 'max:255'],

            'asset_code' => ['required', 'string', 'exists:__assets,code'],
            'asset_value' => ['required', 'numeric', 'min:0'],
            
            'transfer_result' => ['sometimes', 'array'],
            'transfer_datetime' => ['sometimes', 'date:Y-m-d H:i:s'],
        ]);

        $validated_data['ref_code'] = random_int(100000, 199999).strtoupper(substr(md5(microtime()),rand(0,9),7));
        $validated_data['session_token'] = session()->get('active_session_token');

        if (isset($validated_data['sender_username'])){
            if ( isset($validated_data['recipient_username']) && $validated_data['sender_username'] == $validated_data['recipient_username']){
                return abort(422, 'Cannot transact to self.');
            }
            $sender_asset_wallet = _AssetWallet::firstWhere([
                'user_username' => $validated_data['sender_username'], 
                'asset_code' => $validated_data['asset_code']
            ]);

            if ( $sender_asset_wallet->_status == 'frozen' ){ return abort(422, 'Selected asset wallet is frozen.'); }
            if ( !$sender_asset_wallet ){ return abort(422, 'Current '.$validated_data['asset_code'].' balance insufficient for transaction.'); }
            
            $old_usable_balance_asset_value = $sender_asset_wallet->usable_balance_asset_value;
            $new_usable_balance_asset_value = $old_usable_balance_asset_value - $validated_data['asset_value'];

            if ( $new_usable_balance_asset_value < 0 ){ return abort(422, 'Current '.$validated_data['asset_code'].' balance insufficient for transaction.'); }
        }

        if (isset($validated_data['recipient_username'])){
            $recipient_asset_wallet = _AssetWallet::firstWhere([
                'user_username' => $validated_data['recipient_username'], 
                'asset_code' => $validated_data['asset_code']
            ]);
            if (!$recipient_asset_wallet){
                (new _AssetWalletController)->store( new Request([
                    'user_username' => $validated_data['recipient_username'], 
                    'asset_code' => $validated_data['asset_code'],
                    'asset_chain' => _Asset::firstWhere(['code' => $validated_data['asset_code']])->chain,
                ]));
                usleep(500);
            }
        }

        $element = _Transaction::create($validated_data);
        return response()->json( [ 'ref_code' => $element->ref_code ] );
    }

    /**
     * Display the specified resource.
     *
     * @param  string $ref_code
     * @return \Illuminate\Http\Response
     */
    public function show(string $ref_code)
    {
        $element = _Transaction::find($ref_code);
        if (!$element) return abort(404, 'Transaction with specified reference code not found');
        return response()->json( new _TransactionResource( $element ) );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  string $ref_code
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, string $ref_code)
    {
        $validated_data = $request->validate([
            'ttm_bc_txn_signature_id' => ['nullable', 'string', 'unique:__transactions,ttm_bc_txn_signature_id'],
            'ttm_amount_blockage_id' => ['nullable', 'string', 'unique:__transactions,ttm_amount_blockage_id'],
            //'ttm_centralization_factor' => ['nullable', 'numeric', 'between:1,2'],
            'bc_txn_id' => ['sometimes', 'string', 'unique:__transactions,bc_txn_id'],    
            '_status' => ['sometimes', 'string', Rule::in(['pending', 'failed', 'completed'])],
            'transfer_result' => ['sometimes', 'array'],
        ]);
        $element = _Transaction::findOrFail($ref_code);
        $element->update($validated_data);
        return response()->json( [ 'ref_code' => $element->ref_code ] );
    }

    public function update_local_wallets(string $ref_code)
    {
        $element = _Transaction::findOrFail($ref_code);

        if ($element->transfer_result){
            return response()->json( [ 'ref_code' => $element->ref_code ] );
        }

        $validated_data['transfer_result'] = [];
        if (isset($element->sender_username)){
            if ( isset($element->recipient_username) && $element->sender_username == $element->recipient_username){
                return abort(422, 'Cannot transact to self.');
            }
            $sender_asset_wallet = _AssetWallet::firstWhere([
                'user_username' => $element->sender_username, 
                'asset_code' => $element->asset_code
            ]);

            if ( $sender_asset_wallet->_status == 'frozen' ){ return abort(422, 'Selected asset is frozen.'); }
            if ( !$sender_asset_wallet ){ return abort(422, 'Current '.$element->asset_code.' balance insufficient for transaction.'); }
            
            $old_usable_balance_asset_value = $sender_asset_wallet->usable_balance_asset_value;
            $new_usable_balance_asset_value = $old_usable_balance_asset_value - $element->asset_value;

            if ( $new_usable_balance_asset_value < 0 ){ return abort(422, 'Current '.$element->asset_code.' balance insufficient for transaction.'); }

            $old_total_balance_asset_value = $sender_asset_wallet->total_balance_asset_value;
            $new_total_balance_asset_value = $old_total_balance_asset_value - $element->asset_value;

            array_push( $validated_data['transfer_result'], [
                'user_username' => $element->sender_username,
                'old_usable_balance_asset_value' => $old_usable_balance_asset_value,
                'new_usable_balance_asset_value' => $new_usable_balance_asset_value,
                'old_total_balance_asset_value' => $old_total_balance_asset_value,
                'new_total_balance_asset_value' => $new_total_balance_asset_value,
            ]);

            (new _AssetWalletController)->update( new Request([
                'usable_balance_asset_value' => $new_usable_balance_asset_value,
                'total_balance_asset_value' => $new_total_balance_asset_value,
            ]), $sender_asset_wallet->id );

            if ( !in_array($element->sender_username, ['busops', 'reserves']) ){
                // Create notification
                (new _NotificationController)->store( new Request([
                    'user_username' => $element->sender_username,
                    'content' => [
                        'title' => 'Debit Transaction',
                        'subtitle' => $element->asset_value.' '.$element->asset_code.' has been debited from your account.',
                        'body' => $element->asset_value." ".$element->asset_code." has been debited from your account.\nTxn ref: ".$element->ref_code.".\nDescription: ".$element->sender_note."\nNew balances: Usable : ".$new_usable_balance_asset_value ." ".$element->asset_code.", Total : ".$new_total_balance_asset_value ." ".$element->asset_code,
                    ],
                ]));
                // End Create notification
            }
        }

        if (isset($element->recipient_username)){
            $recipient_asset_wallet = _AssetWallet::firstWhere([
                'user_username' => $element->recipient_username, 
                'asset_code' => $element->asset_code,
            ]);

            $old_usable_balance_asset_value = $recipient_asset_wallet->usable_balance_asset_value;
            $new_usable_balance_asset_value = $old_usable_balance_asset_value + $element->asset_value;

            $old_total_balance_asset_value = $recipient_asset_wallet->total_balance_asset_value;
            $new_total_balance_asset_value = $old_total_balance_asset_value + $element->asset_value;

            array_push( $validated_data['transfer_result'], [
                'user_username' => $element->recipient_username,
                'old_usable_balance_asset_value' => $old_usable_balance_asset_value,
                'new_usable_balance_asset_value' => $new_usable_balance_asset_value,
                'old_total_balance_asset_value' => $old_total_balance_asset_value,
                'new_total_balance_asset_value' => $new_total_balance_asset_value,
            ]);

            (new _AssetWalletController)->update( new Request([
                'usable_balance_asset_value' => $new_usable_balance_asset_value,
                'total_balance_asset_value' => $new_total_balance_asset_value,
            ]), $recipient_asset_wallet->id );

            if ( !in_array($element->recipient_username, ['busops', 'reserves']) ){
                // Create notification
                (new _NotificationController)->store( new Request([
                    'user_username' => $element->recipient_username,
                    'content' => [
                        'title' => 'Credit Transaction',
                        'subtitle' => $element->asset_value.' '.$element->asset_code.' has been credited into your account.',
                        'body' => $element->asset_value." ".$element->asset_code." has been credited into your account.\nTxn ref: ".$element->ref_code.".\nDescription: ".$element->recipient_note."\nNew balances: Usable : ".$new_usable_balance_asset_value ." ".$element->asset_code.", Total : ".$new_total_balance_asset_value ." ".$element->asset_code,
                    ],
                ]));
                // End Create notification
            }
        }

        (new _TransactionController)->update( new Request($validated_data), $ref_code );
        return response()->json( [ 'ref_code' => $element->ref_code ] );
    }

    public function centralize_assets_xpub(string $ref_code)
    {
        $element = _Transaction::findOrFail($ref_code);

        if ($element->recipient_username == 'reserves'){
            return response()->json( [ 'ref_code' => $element->ref_code ] );
        }

        $validated_data = [];

        $reserves_addresses = _AssetWalletAddress::where(['user_username' => 'reserves', 'asset_code' => $element->asset_code])->inRandomOrder()->get();
        $reserves_address = null;
        $lowest_balance = null;
        foreach ($reserves_addresses as $_reserves_address) {
            $balance = (new Tatum\Blockchain\EthereumController)->EthGetBalance(new Request(['address' => $_reserves_address->bc_address]))->getData()->balance;
            if ($lowest_balance === null) $lowest_balance = $balance;
            if ($balance <= $lowest_balance){
                $reserves_address = $_reserves_address;
            }
        }

        $focused_address = _AssetWalletAddress::firstWhere(['user_username' => $element->recipient_username, 'asset_code' => $element->asset_code]);

        switch ($element->asset_code) {
            case 'ETH':
                $balance = (new Tatum\Blockchain\EthereumController)->EthGetBalance(new Request(['address' => $focused_address->bc_address]))->getData()->balance;
                if ( $balance > 0 ) {
                    $estimated_fee =  (new Tatum\FeeEstimation\EstimateEthereumTransactionFeeController)->EthEstimateGas(new Request([
                        'from' => $focused_address->bc_address,
                        'to' => $reserves_address->bc_address,
                        'amount' => $balance,
                    ]))->getData();
                    $transferrable = ($balance - $element->ttm_centralization_factor*((float)$estimated_fee->gasLimit * ((float)$estimated_fee->gasPrice) / pow(10,18)));
                    $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\Blockchain\EthereumController)->EthBlockchainTransfer(new Request([
                        'to' => $reserves_address->bc_address,
                        'currency' => 'ETH',
                        'amount' => $transferrable.'',
                        'index' => $focused_address->ttm_derivation_key,
                        'fee' => ['gasLimit' => $estimated_fee->gasLimit, 'gasPrice' => ((float)$estimated_fee->gasPrice / pow(10,9)).'' ],
                    ]))->getData()->signatureId;
                    (new _TransactionController)->update( new Request($validated_data), $ref_code );
                }
                return response()->json( [ 'ref_code' => $element->ref_code ] );

            case 'TRON':
                $balance = (new Tatum\Blockchain\TronController)->TronGetAccount(new Request(['address' => $focused_address->bc_address]))->getData()->balance/1000000;
                if ( $balance > 0 ) {
                    $transferrable = ($balance - $element->ttm_centralization_factor*0.002);
                    $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\Blockchain\TronController)->TronTransfer(new Request([
                        'from' => $focused_address->bc_address,
                        'to' => $reserves_address->bc_address,
                        'amount' => $transferrable.'',
                        'index' => $focused_address->ttm_derivation_key,
                    ]))->getData()->signatureId;
                    (new _TransactionController)->update( new Request($validated_data), $ref_code );
                }
                return response()->json( [ 'ref_code' => $element->ref_code ] );

            case 'USDT_TRON':
                $tron_acct = (new Tatum\Blockchain\TronController)->TronGetAccount(new Request(['address' => $focused_address->bc_address]))->getData();
                $balance = 0;
                if (count($tron_acct->trc20) && isset($tron_acct->trc20[env('TRON_USDT_TOKEN_ADDRESS')])) $balance = $tron_acct->trc20[env('TRON_USDT_TOKEN_ADDRESS')];
                if ( $balance > 0 ) {
                    $feeLimit = $element->ttm_centralization_factor*0.002;
                    $transferrable = ($balance - $feeLimit);
                    $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\Blockchain\TronController)->TronTransferTrc20(new Request([
                        'from' => $focused_address->bc_address,
                        'to' => $reserves_address->bc_address,
                        'tokenAddress' => env('TRON_USDT_TOKEN_ADDRESS'),
                        'amount' => $transferrable.'', // in TRX
                        'feeLimit' => $feeLimit.'', // in TRX
                        'index' => $focused_address->ttm_derivation_key,
                    ]))->getData()->signatureId;
                    (new _TransactionController)->update( new Request($validated_data), $ref_code );
                }
                return response()->json( [ 'ref_code' => $element->ref_code ] );
        }
    }

    public function centralize_assets(string $ref_code)
    {
        $element = _Transaction::findOrFail($ref_code);

        if ($element->recipient_username == 'reserves'){
            return response()->json( [ 'ref_code' => $element->ref_code ] );
        }

        $validated_data = [];

        $asset = _Asset::firstWhere('code', $element->asset_code );

        $reserves_addresses = _AssetWalletAddress::where(['user_username' => 'reserves', 'asset_code' => $element->asset_code])->inRandomOrder()->get();
        $reserves_address = null;
        $lowest_balance = null;
        $focused_address = _AssetWalletAddress::firstWhere(['user_username' => $element->recipient_username, 'asset_code' => $element->asset_code]);

        switch ($element->asset_code) {
            case 'ETH':
                foreach ($reserves_addresses as $_reserves_address) {
                    $balance = (new Tatum\Blockchain\EthereumController)->EthGetBalance(new Request(['address' => $_reserves_address->bc_address]))->getData()->balance;
                    if ($lowest_balance === null) $lowest_balance = $balance;
                    if ($balance <= $lowest_balance){
                        $reserves_address = $_reserves_address;
                    }
                }
                $balance = (new Tatum\Blockchain\EthereumController)->EthGetBalance(new Request(['address' => $focused_address->bc_address]))->getData()->balance;
                if ( $balance > 0 ) {
                    $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\SmartContracts\GasPumpController)->TransferCustodialWallet(new Request([
                        'chain' => 'ETH',
                        'custodialAddress' => $focused_address->bc_address,
                        'recipient' => $reserves_address->bc_address,
                        'contractType' => 3,
                        'amount' => $balance.'',
                    ]))->getData()->signatureId;
                    (new _TransactionController)->update( new Request($validated_data), $ref_code );
                }
                return response()->json( [ 'ref_code' => $element->ref_code ] );

            case 'USDT':
                $reserves_address = $reserves_addresses[0];
                $balance = $element->asset_value;
                if ( $balance > 0 ) {
                    $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\SmartContracts\GasPumpController)->TransferCustodialWallet(new Request([
                        'chain' => 'ETH',
                        'custodialAddress' => $focused_address->bc_address,
                        'recipient' => $reserves_address->bc_address,
                        'contractType' => 0,
                        'tokenAddress' => env('ETH_USDT_TOKEN_ADDRESS'),
                        'amount' => $balance.'', // in ETH
                    ]))->getData()->signatureId;
                    (new _TransactionController)->update( new Request($validated_data), $ref_code );
                }
                return response()->json( [ 'ref_code' => $element->ref_code ] );

            case 'TRON':
                foreach ($reserves_addresses as $_reserves_address) {
                    $balance = (new Tatum\Blockchain\TronController)->TronGetAccount(new Request(['address' => $_reserves_address->bc_address]))->getData()->balance/1000000;
                    if ($lowest_balance === null) $lowest_balance = $balance;
                    if ($balance <= $lowest_balance){
                        $reserves_address = $_reserves_address;
                    }
                }
                $balance = (new Tatum\Blockchain\TronController)->TronGetAccount(new Request(['address' => $focused_address->bc_address]))->getData()->balance/1000000;
                if ( $balance > 0 ) {
                    $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\SmartContracts\GasPumpController)->TransferCustodialWallet(new Request([
                        'chain' => 'TRON',
                        'custodialAddress' => $focused_address->bc_address,
                        'from' => $focused_address->bc_address,
                        'recipient' => $reserves_address->bc_address,
                        'contractType' => 3,
                        'amount' => $balance.'',
                        'feeLimit' => $asset->usd_asset_exchange_rate / 5,
                    ]))->getData()->signatureId;
                    (new _TransactionController)->update( new Request($validated_data), $ref_code );
                }
                return response()->json( [ 'ref_code' => $element->ref_code ] );

            case 'USDT_TRON':
                foreach ($reserves_addresses as $_reserves_address) {
                    $balance = 0;
                    $tron_acct = (new Tatum\Blockchain\TronController)->TronGetAccount(new Request(['address' => $focused_address->bc_address]))->getData();
                    if (count($tron_acct->trc20) && isset($tron_acct->trc20[env('TRON_USDT_TOKEN_ADDRESS')])) $balance = $tron_acct->trc20[env('TRON_USDT_TOKEN_ADDRESS')];
                    if ($lowest_balance === null) $lowest_balance = $balance;
                    if ($balance <= $lowest_balance){
                        $reserves_address = $_reserves_address;
                    }
                }
                $balance = 0;
                $tron_acct = (new Tatum\Blockchain\TronController)->TronGetAccount(new Request(['address' => $focused_address->bc_address]))->getData();
                if (count($tron_acct->trc20) && isset($tron_acct->trc20[env('TRON_USDT_TOKEN_ADDRESS')])) $balance = $tron_acct->trc20[env('TRON_USDT_TOKEN_ADDRESS')];
                if ( $balance > 0 ) {
                    $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\SmartContracts\GasPumpController)->TransferCustodialWallet(new Request([
                        'chain' => 'TRON',
                        'custodialAddress' => $focused_address->bc_address,
                        'from' => $focused_address->bc_address,
                        'recipient' => $reserves_address->bc_address,
                        'contractType' => 0,
                        'tokenAddress' => env('TRON_USDT_TOKEN_ADDRESS'),
                        'amount' => $balance.'',
                        'feeLimit' => $asset->usd_asset_exchange_rate / 5, // in TRX
                    ]))->getData()->signatureId;
                    (new _TransactionController)->update( new Request($validated_data), $ref_code );
                }
                return response()->json( [ 'ref_code' => $element->ref_code ] );
        }
    }

    public function centralize_assets_completed(string $ref_code)
    {
        $element = _Transaction::findOrFail($ref_code);
        $validated_data = [
            'ttm_bc_txn_signature_id' => null,
            //'ttm_centralization_factor' => null,
        ];
        (new _TransactionController)->update( new Request($validated_data), $ref_code );
        return response()->json( [ 'ref_code' => $element->ref_code ] );
    }

    public function centralize_assets_failed(string $ref_code)
    {
        $element = _Transaction::findOrFail($ref_code);
        (new Tatum\Security\KMSController)->DeletePendingTransactionToSign(new Request(['id' => $element->ttm_bc_txn_signature_id]));
        $validated_data = [
            'ttm_bc_txn_signature_id' => null,
            //'ttm_centralization_factor' => $element->ttm_centralization_factor + 0.005,
        ];
        (new _TransactionController)->update( new Request($validated_data), $ref_code );
        (new _TransactionController)->centralize_assets( $ref_code );
        return response()->json( [ 'ref_code' => $element->ref_code ] );
    }

    private $ETH_USDT_FCTR = 1000;
    private $TRX_USDT_FCTR = 10;

    public function transfer_account_to_account($request)
    {
        $validated_data = $request->validate([
            'asset_code' => ['required', 'string', 'exists:__assets,code'],
            'asset_value' => ['required', 'numeric', 'min:0'],
            'recipient_username' => ['required', 'nullable', 'string', 'exists:__users,username'],
            'recipient_note' => ['required', 'string', 'max:255'],
            'sender_username' => ['required', 'nullable', 'string', 'exists:__users,username'],
            'sender_note' => ['required', 'string', 'max:255'],
        ]);
        if ( !_PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f() ){
            return response()->json( [ 'reference' => 'placeholder_'.random_int(100000, 199999).strtoupper(substr(md5(microtime()),rand(0,9),7)) ] );
        }
        $asset = _Asset::firstWhere('code', $validated_data['asset_code']);
        if ( $asset->chain === 'ETH' && $asset->code === 'ETH' && $asset->unit === 'USDT' ) $validated_data['asset_value'] = $validated_data['asset_value'] / $this->ETH_USDT_FCTR;
        if ( $asset->chain === 'TRON' && $asset->code === 'TRON' && $asset->unit === 'USDT' ) $validated_data['asset_value'] = $validated_data['asset_value'] / $this->TRX_USDT_FCTR;
        $ttm_request_object = [
            'curency' => $validated_data['asset_code'],
            'amount' => $validated_data['asset_value'].'',
            'recipientAccountId' => _AssetWallet::firstWhere(['user_username' => $validated_data['recipient_username'], 'asset_code' => $validated_data['asset_code']])->ttm_virtual_account_id,
            'recipientNote' => $validated_data['recipient_note'],
            'senderAccountId' => _AssetWallet::firstWhere(['user_username' => $validated_data['sender_username'], 'asset_code' => $validated_data['asset_code']])->ttm_virtual_account_id,
            'senderNote' => $validated_data['sender_note'],
        ];
        return (new Tatum\VirtualAccounts\TransactionController)->sendTransaction(new Request($ttm_request_object));
    }

    public function process_platform_charge(Request $request, $ref_code)
    {
        $validated_data = $request->validate([
            'asset_value' => ['required', 'numeric', 'min:0'],
        ]);

        $element = _Transaction::findOrFail($ref_code);

        if (!in_array($element->operation_slug,['PAYMENT', 'WITHDRAWAL', 'TRADE_ASSET_RELEASE'])){
            return response()->json( [ 'ref_code' => $element->ref_code ] );
        }

        $validated_data['operation_slug'] = 'TRANSACTION_CHARGE';
        $validated_data['asset_code'] = $element->asset_code;
        $validated_data['recipient_username'] = 'busops';
        $validated_data['recipient_note'] = 'Platform fee for transaction '.$ref_code;
        $validated_data['sender_username'] = $element->sender_username;
        $validated_data['sender_note'] = 'Platform fee for transaction '.$ref_code;
        $validated_data['ttm_reference'] = (new _TransactionController)->transfer_account_to_account(new Request($validated_data))->getData()->reference;
        $validated_data['_status'] = 'completed';

        $element = (new _TransactionController)->store( new Request($validated_data), $ref_code )->getData();
        (new _TransactionController)->update_local_wallets( $element->ref_code );
        return response()->json( [ 'ref_code' => $element->ref_code ] );
    }

    public function process_token_deposit(Request $request)
    {
        $validated_data = $request->validate([
            'deposit_token' => ['required', 'string', 'exists:__deposit_tokens,token'],
            'recipient_username' => ['required', 'string', 'exists:__users,username'],
            'asset_code' => ['required', 'string', 'exists:__assets,code'],
            'asset_value' => ['required', 'numeric', 'min:0'],
        ]);

        $validated_data['operation_slug'] = 'DEPOSIT_TOKEN_TOPUP';
        $validated_data['sender_username'] = 'busops';
        $validated_data['recipient_note'] = 'Wallet topup using deposit token '.$validated_data['deposit_token'];
        $validated_data['sender_note'] = $validated_data['recipient_note'];
        $validated_data['_status'] = 'pending';
        $element = (new _TransactionController)->store( new Request($validated_data) )->getData();
        $validated_data['ttm_reference'] = (new _TransactionController)->transfer_account_to_account(new Request($validated_data))->getData()->reference;
        $validated_data['_status'] = 'completed';
        (new _TransactionController)->update( new Request($validated_data), $element->ref_code );;
        (new _TransactionController)->update_local_wallets( $element->ref_code );
        return response()->json( [ 'ref_code' => $element->ref_code ] );
    }

    public function process_trade_asset_release(Request $request)
    {
        $validated_data = $request->validate([
            'trade_ref_code' => ['required', 'string', 'exists:__trades,ref_code'],
            'sender_username' => ['required', 'string', 'exists:__users,username'],
            'sender_password' => ['required', 'string', 'between:8,32'],
            'recipient_username' => ['required', 'string', 'exists:__users,username'],
            'asset_code' => ['required', 'string', 'exists:__assets,code'],
            'asset_value' => ['required', 'numeric', 'min:0'],
            'txn_fee_asset_value' => ['required', 'numeric', 'min:0'],
        ]);

        if (!Hash::check($validated_data['sender_password'], _User::firstWhere('username', $validated_data['sender_username'])->makeVisible(['password'])->password)) {
            return abort(422, 'Sender password incorrect');
        }

        $validated_data['operation_slug'] = 'TRADE_ASSET_RELEASE';
        $validated_data['recipient_note'] = 'Inbound asset release for trade '.$validated_data['trade_ref_code'];
        $validated_data['sender_note'] = 'Outbound asset release for trade '.$validated_data['trade_ref_code'];
        $validated_data['_status'] = 'pending';
        $element = (new _TransactionController)->store( new Request($validated_data) )->getData();
        $validated_data['ttm_reference'] = (new _TransactionController)->transfer_account_to_account(new Request($validated_data))->getData()->reference;
        $validated_data['_status'] = 'completed';
        (new _TransactionController)->update( new Request($validated_data), $element->ref_code );
        (new _TransactionController)->update_local_wallets( $element->ref_code );
        usleep(500);
        (new _TransactionController)->process_platform_charge(new Request([ 'asset_value' => $validated_data['txn_fee_asset_value']]), $element->ref_code);
        return response()->json( [ 'ref_code' => $element->ref_code ] );
    }

    public function process_payment(Request $request)
    {
        $validated_data = $request->validate([
            'asset_code' => ['required', 'string', 'exists:__assets,code'],
            'asset_value' => ['required', 'numeric', 'min:0'],
            'recipient_user_tag' => ['required', 'string', Rule::in(['username', 'email_address', 'ankelli_pay_id'])],
            'recipient_username' => ['required_if:recipient_user_tag,=,username', 'nullable', 'string', 'exists:__users,username'],
            'recipient_email_address' => ['required_if:recipient_user_tag,=,email_address', 'nullable', 'string', 'exists:__email_addresses,email_address'],
            'recipient_ankelli_pay_id' => ['required_if:recipient_user_tag,=,ankelli_pay_id', 'nullable', 'string', 'exists:__users,ankelli_pay_id'],
            'recipient_note' => ['required', 'string', 'max:255'],
            'sender_password' => ['required', 'string', 'between:8,32'],
            'sender_note' => ['required', 'string', 'max:255'],
        ]);

        $validated_data['sender_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );
        if (!Hash::check($validated_data['sender_password'], _User::firstWhere('username', $validated_data['sender_username'])->makeVisible(['password'])->password)) {
            return abort(422, 'Sender password incorrect');
        }

        switch ($validated_data['recipient_user_tag']) {
            case 'email_address':
                $validated_data['recipient_username'] = _EmailAddress::firstWhere(['email_address' => $validated_data['recipient_email_address']])->user_username;
                break;
            case 'ankelli_pay_id':
                $validated_data['recipient_username'] = _User::firstWhere(['ankelli_pay_id' => $validated_data['recipient_ankelli_pay_id']])->username;
                break;
        }
        $validated_data['operation_slug'] = 'PAYMENT';
        $validated_data['_status'] = 'pending';
        $element = (new _TransactionController)->store( new Request($validated_data) )->getData();
        $validated_data['ttm_reference'] = (new _TransactionController)->transfer_account_to_account(new Request($validated_data))->getData()->reference;
        $validated_data['_status'] = 'completed';
        (new _TransactionController)->update( new Request($validated_data), $element->ref_code );;
        (new _TransactionController)->update_local_wallets( $element->ref_code );
        usleep(500);
        $asset = _Asset::firstWhere('code', $validated_data['asset_code']);
        (new _TransactionController)->process_platform_charge(new Request([ 'asset_value' => $validated_data['asset_value'] * _PrefItem::firstWhere('key_slug', 'pymt_txn_fee_fctr')->value_f() ]), $element->ref_code);

        return response()->json( [ 'ref_code' => $element->ref_code ] );
    }

    /**
     * Process a withdrawal from user wallet to blockchain address
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function process_withdrawal_xpub(Request $request)
    {
        $validated_data = $request->validate([
            'asset_code' => ['required', 'string', 'exists:__assets,code'],
            'asset_value' => ['required', 'numeric', 'min:0'],
            'recipient_bc_address' => ['required', 'string', 'between:13,128'],
            'sender_password' => ['required', 'string', 'between:8,32'],
            'sender_note' => ['required', 'string', 'max:255'],
        ]);

        $validated_data['sender_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );
        if (!Hash::check($validated_data['sender_password'], _User::firstWhere('username', $validated_data['sender_username'])->makeVisible(['password'])->password)) {
            return abort(422, 'Sender password incorrect');
        }

        $validated_data['_status'] = 'pending';
        $validated_data['operation_slug'] = 'WITHDRAWAL';

        $asset = _Asset::firstWhere('code', $validated_data['asset_code']);
        $validated_data['asset_value_escrowed'] = $validated_data['asset_value'] + $asset->usd_asset_exchange_rate * $asset->withdrawal_txn_fee_usd_fctr;
        $validated_data['ttm_amount_blockage_id'] = (new _AssetWalletController)->blockAssetValue( new Request([
            'asset_value' => $validated_data['asset_value_escrowed'],
            'blockage_type_slug' => 'withdrawal_escrow',
        ]), _AssetWallet::firstWhere(['user_username' => $validated_data['sender_username'], 'asset_code' => $validated_data['asset_code']])->id )->getData()->id;

        $reserves_wallet = _AssetWallet::firstWhere(['user_username' => 'reserves', 'asset_code' => $validated_data['asset_code']]);
        $reserves_addresses = _AssetWalletAddress::where(['user_username' => 'reserves', 'asset_code' => $validated_data['asset_code']])->inRandomOrder()->get();

    
        switch ($asset->chain) {
            case 'ETH':
                $mainnet = false;
                if ( $mainnet ){
                    $reserves_address = null;
                    if ($asset->code === 'ETH'){
                        foreach ($reserves_addresses as $_reserves_address) {
                            $balance = (new Tatum\Blockchain\EthereumController)->EthGetBalance(new Request(['address' => $_reserves_address->bc_address]))->getData()->balance;
                            if ($balance > $validated_data['asset_value']){
                                $reserves_address = $_reserves_address;
                                break;
                            }
                        }
                    } else {
                        $reserves_address = $reserves_addresses[0];
                    }
                    if ($reserves_address === null){
                        return abort(422, "We're currently experiencing traffic issues, please try again after a short while or contact support if the problem persists");
                    }
                    $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\Blockchain\EthereumController)->EthBlockchainTransfer(new Request([
                        'to' => $validated_data['recipient_bc_address'],
                        'currency' => $asset->code,
                        'amount' => $validated_data['asset_value'].'',
                        'index' => $reserves_address->ttm_derivation_key,
                    ]))->getData()->signatureId;
                } else {
                    switch ($asset->unit) {
                        case 'ETH':
                            $reserves_address = null;                
                            foreach ($reserves_addresses as $_reserves_address) {
                                $balance = (new Tatum\Blockchain\EthereumController)->EthGetBalance(new Request(['address' => $_reserves_address->bc_address]))->getData()->balance;
                                if ($balance > $validated_data['asset_value']){
                                    $reserves_address = $_reserves_address;
                                    break;
                                }
                            }
                            if ($reserves_address === null){
                                return abort(422, "We're currently experiencing traffic issues, please try again after a short while or contact support if the problem persists");
                            }
                            $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\Blockchain\EthereumController)->EthBlockchainTransfer(new Request([
                                'to' => $validated_data['recipient_bc_address'],
                                'currency' => 'ETH',
                                'amount' => $validated_data['asset_value'].'',
                                'index' => $reserves_address->ttm_derivation_key,
                            ]))->getData()->signatureId;
                            break;
            
                        case 'USDT':
                            $reserves_address = null;                
                            foreach ($reserves_addresses as $_reserves_address) {
                                $balance = (new Tatum\Blockchain\EthereumController)->EthGetBalance(new Request(['address' => $_reserves_address->bc_address]))->getData()->balance;
                                if ($balance > ($validated_data['asset_value'] / $this->ETH_USDT_FCTR)){
                                    $reserves_address = $_reserves_address;
                                    break;
                                }
                            }
                            if ($reserves_address === null){
                                return abort(422, "We're currently experiencing traffic issues, please try again after a short while or contact support if the problem persists");
                            }
                            $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\Blockchain\EthereumController)->EthBlockchainTransfer(new Request([
                                'to' => $validated_data['recipient_bc_address'],
                                'currency' => 'ETH',
                                'amount' => ($validated_data['asset_value'] / $this->ETH_USDT_FCTR).'',
                                'index' => $reserves_address->ttm_derivation_key,
                            ]))->getData()->signatureId;
                            break;
                    }
                }
                break;

            case 'TRON':
                $mainnet = false;
                if ( $mainnet ){
                    $reserves_address = null;                
                    foreach ($reserves_addresses as $_reserves_address) {
                        $tron_acct = (new Tatum\Blockchain\TronController)->TronGetAccount(new Request(['address' => $_reserves_address->bc_address]))->getData();
                        $balance = 0;
                        if ($asset->code === 'TRON') $balance = $tron_acct->balance/1000000;
                        if ($asset->code === 'USDT_TRON' && count($tron_acct->trc20) && isset($tron_acct->trc20[env('TRON_USDT_TOKEN_ADDRESS')])) $balance = $tron_acct->trc20[env('TRON_USDT_TOKEN_ADDRESS')];
                        if ($balance > $validated_data['asset_value']){
                            $reserves_address = $_reserves_address;
                            break;
                        }
                    }
                    if ($reserves_address === null){
                        return abort(422, "We're currently experiencing traffic issues, please try again after a short while or contact support if the problem persists");
                    }
                    switch ($asset->code) {
                        case 'TRON':
                            $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\Blockchain\TronController)->TronTransfer(new Request([
                                'from' => $reserves_address->bc_address,
                                'to' => $validated_data['recipient_bc_address'],
                                'amount' => $validated_data['asset_value'].'',
                                'index' => $reserves_address->ttm_derivation_key,
                            ]))->getData()->signatureId;
                            break;

                        case 'USDT_TRON':
                            $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\Blockchain\TronController)->TronTransferTrc20(new Request([
                                'from' => $reserves_address->bc_address,
                                'to' => $validated_data['recipient_bc_address'],
                                'tokenAddress' => env('TRON_USDT_TOKEN_ADDRESS'),
                                'amount' => ($validated_data['asset_value'] * $asset->usd_asset_exchange_rate).'', // in TRX
                                'feeLimit' => $asset->usd_asset_exchange_rate / 5, // in TRX
                                'index' => $reserves_address->ttm_derivation_key,
                            ]))->getData()->signatureId;
                            break;
                    }
                } else {
                    switch ($asset->unit) {
                        case 'TRX':
                            $reserves_address = null;                
                            foreach ($reserves_addresses as $_reserves_address) {
                                $balance = (new Tatum\Blockchain\TronController)->TronGetAccount(new Request(['address' => $_reserves_address->bc_address]))->getData()->balance/1000000;
                                if ($balance > $validated_data['asset_value']){
                                    $reserves_address = $_reserves_address;
                                    break;
                                }
                            }
                            if ($reserves_address === null){
                                return abort(422, "We're currently experiencing traffic issues, please try again after a short while or contact support if the problem persists");
                            }
                            $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\Blockchain\TronController)->TronTransfer(new Request([
                                'from' => $reserves_address->bc_address,
                                'to' => $validated_data['recipient_bc_address'],
                                'amount' => $validated_data['asset_value'].'',
                                'index' => $reserves_address->ttm_derivation_key,
                            ]))->getData()->signatureId;
                            break;
            
                        case 'USDT':
                            $reserves_address = null;                
                            foreach ($reserves_addresses as $_reserves_address) {
                                $balance = (new Tatum\Blockchain\TronController)->TronGetAccount(new Request(['address' => $_reserves_address->bc_address]))->getData()->balance/1000000;
                                if ($balance > ($validated_data['asset_value'] / $this->TRX_USDT_FCTR)){
                                    $reserves_address = $_reserves_address;
                                    break;
                                }
                            }
                            if ($reserves_address === null){
                                return abort(422, "We're currently experiencing traffic issues, please try again after a short while or contact support if the problem persists");
                            }
                            $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\Blockchain\TronController)->TronTransfer(new Request([
                                'from' => $reserves_address->bc_address,
                                'to' => $validated_data['recipient_bc_address'],
                                'amount' => ($validated_data['asset_value'] / $this->TRX_USDT_FCTR).'',
                                'index' => $reserves_address->ttm_derivation_key,
                            ]))->getData()->signatureId;
                            break;
                    }
                }
                break;
        }

        $element = (new _TransactionController)->store( new Request($validated_data) )->getData();
        return response()->json( [ 'ref_code' => $element->ref_code ] );
    }

    /**
     * Process a withdrawal from user wallet to blockchain address
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function process_withdrawal(Request $request)
    {
        $validated_data = $request->validate([
            'asset_code' => ['required', 'string', 'exists:__assets,code'],
            'asset_value' => ['required', 'numeric', 'min:0'],
            'recipient_bc_address' => ['required', 'string', 'between:13,128'],
            'sender_password' => ['required', 'string', 'between:8,32'],
            'sender_note' => ['required', 'string', 'max:255'],
        ]);

        $validated_data['sender_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );
        if (!Hash::check($validated_data['sender_password'], _User::firstWhere('username', $validated_data['sender_username'])->makeVisible(['password'])->password)) {
            return abort(422, 'Sender password incorrect');
        }

        $validated_data['_status'] = 'pending';
        $validated_data['operation_slug'] = 'WITHDRAWAL';

        $asset = _Asset::firstWhere('code', $validated_data['asset_code']);
        $validated_data['asset_value_escrowed'] = $validated_data['asset_value'] + $asset->usd_asset_exchange_rate * $asset->withdrawal_txn_fee_usd_fctr;
        $validated_data['ttm_amount_blockage_id'] = (new _AssetWalletController)->blockAssetValue( new Request([
            'asset_value' => $validated_data['asset_value_escrowed'],
            'blockage_type_slug' => 'withdrawal_escrow',
        ]), _AssetWallet::firstWhere(['user_username' => $validated_data['sender_username'], 'asset_code' => $validated_data['asset_code']])->id )->getData()->id;

        $reserves_wallet = _AssetWallet::firstWhere(['user_username' => 'reserves', 'asset_code' => $validated_data['asset_code']]);
        $reserves_addresses = _AssetWalletAddress::where(['user_username' => 'reserves', 'asset_code' => $validated_data['asset_code']])->inRandomOrder()->get();

    
        switch ($asset->chain) {
            case 'ETH':
                $mainnet = false;
                if ( $mainnet ){
                    $reserves_address = null;
                    if ($asset->code === 'ETH'){
                        foreach ($reserves_addresses as $_reserves_address) {
                            $balance = (new Tatum\Blockchain\EthereumController)->EthGetBalance(new Request(['address' => $_reserves_address->bc_address]))->getData()->balance;
                            if ($balance > $validated_data['asset_value']){
                                $reserves_address = $_reserves_address;
                                break;
                            }
                        }
                    } else {
                        $reserves_address = $reserves_addresses[0];
                    }
                    if ($reserves_address === null){
                        return abort(422, "We're currently experiencing traffic issues, please try again after a short while or contact support if the problem persists");
                    }
                    $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\SmartContracts\GasPumpController)->TransferCustodialWallet(new Request(array_filter([
                        'chain' => 'ETH',
                        'custodialAddress' => $reserves_address->bc_address,
                        'recipient' => $validated_data['recipient_bc_address'],
                        'contractType' => ($asset->chain === $asset->code ? 3 : 0),
                        'tokenAddress' => ($asset->chain === $asset->code ? null : env('ETH_USDT_TOKEN_ADDRESS')),
                        'amount' => $validated_data['asset_value'].'',
                    ], static function($var){ return $var !== null; } )))->getData()->signatureId;
                } else {
                    switch ($asset->unit) {
                        case 'ETH':
                            $reserves_address = null;                
                            foreach ($reserves_addresses as $_reserves_address) {
                                $balance = (new Tatum\Blockchain\EthereumController)->EthGetBalance(new Request(['address' => $_reserves_address->bc_address]))->getData()->balance;
                                if ($balance > $validated_data['asset_value']){
                                    $reserves_address = $_reserves_address;
                                    break;
                                }
                            }
                            if ($reserves_address === null){
                                return abort(422, "We're currently experiencing traffic issues, please try again after a short while or contact support if the problem persists");
                            }
                            $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\SmartContracts\GasPumpController)->TransferCustodialWallet(new Request([
                                'chain' => 'ETH',
                                'custodialAddress' => $reserves_address->bc_address,
                                'recipient' => $validated_data['recipient_bc_address'],
                                'contractType' => 3,
                                'amount' => $validated_data['asset_value'].'',
                            ]))->getData()->signatureId;
                            break;
            
                        case 'USDT':
                            $reserves_address = null;                
                            foreach ($reserves_addresses as $_reserves_address) {
                                $balance = (new Tatum\Blockchain\EthereumController)->EthGetBalance(new Request(['address' => $_reserves_address->bc_address]))->getData()->balance;
                                if ($balance > ($validated_data['asset_value'] / $this->ETH_USDT_FCTR)){
                                    $reserves_address = $_reserves_address;
                                    break;
                                }
                            }
                            if ($reserves_address === null){
                                return abort(422, "We're currently experiencing traffic issues, please try again after a short while or contact support if the problem persists");
                            }
                            $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\SmartContracts\GasPumpController)->TransferCustodialWallet(new Request([
                                'chain' => 'ETH',
                                'custodialAddress' => $reserves_address->bc_address,
                                'recipient' => $validated_data['recipient_bc_address'],
                                'contractType' => 3,
                                'amount' => ($validated_data['asset_value'] / $this->ETH_USDT_FCTR).'',
                            ]))->getData()->signatureId;
                            break;
                    }
                }
                break;

            case 'TRON':
                $mainnet = false;
                if ( $mainnet ){
                    $reserves_address = null;                
                    foreach ($reserves_addresses as $_reserves_address) {
                        $tron_acct = (new Tatum\Blockchain\TronController)->TronGetAccount(new Request(['address' => $_reserves_address->bc_address]))->getData();
                        $balance = 0;
                        if ($asset->code === 'TRON') $balance = $tron_acct->balance/1000000;
                        if ($asset->code === 'USDT_TRON' && count($tron_acct->trc20) && isset($tron_acct->trc20[env('TRON_USDT_TOKEN_ADDRESS')])) $balance = $tron_acct->trc20[env('TRON_USDT_TOKEN_ADDRESS')];
                        if ($balance > $validated_data['asset_value']){
                            $reserves_address = $_reserves_address;
                            break;
                        }
                    }
                    if ($reserves_address === null){
                        return abort(422, "We're currently experiencing traffic issues, please try again after a short while or contact support if the problem persists");
                    }
                    switch ($asset->code) {
                        case 'TRON':
                            $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\SmartContracts\GasPumpController)->TransferCustodialWallet(new Request([
                                'chain' => 'TRON',
                                'custodialAddress' => $reserves_address->bc_address,
                                'from' => $reserves_address->bc_address,
                                'recipient' => $validated_data['recipient_bc_address'],
                                'contractType' => 3,
                                'amount' => $validated_data['asset_value'].'',
                                'feeLimit' => $asset->usd_asset_exchange_rate / 5,
                            ]))->getData()->signatureId;
                            break;

                        case 'USDT_TRON':
                            $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\SmartContracts\GasPumpController)->TransferCustodialWallet(new Request([
                                'chain' => 'TRON',
                                'custodialAddress' => $reserves_address->bc_address,
                                'from' => $reserves_address->bc_address,
                                'recipient' => $validated_data['recipient_bc_address'],
                                'contractType' => 0,
                                'tokenAddress' => env('TRON_USDT_TOKEN_ADDRESS'),
                                'amount' => $validated_data['asset_value'].'',
                                'feeLimit' => $asset->usd_asset_exchange_rate / 5, // in TRX
                            ]))->getData()->signatureId;
                            break;
                    }
                } else {
                    switch ($asset->unit) {
                        case 'TRX':
                            $reserves_address = null;                
                            foreach ($reserves_addresses as $_reserves_address) {
                                $balance = (new Tatum\Blockchain\TronController)->TronGetAccount(new Request(['address' => $_reserves_address->bc_address]))->getData()->balance/1000000;
                                if ($balance > $validated_data['asset_value']){
                                    $reserves_address = $_reserves_address;
                                    break;
                                }
                            }
                            if ($reserves_address === null){
                                return abort(422, "We're currently experiencing traffic issues, please try again after a short while or contact support if the problem persists");
                            }
                            $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\SmartContracts\GasPumpController)->TransferCustodialWallet(new Request([
                                'chain' => 'TRON',
                                'custodialAddress' => $reserves_address->bc_address,
                                'from' => $reserves_address->bc_address,
                                'recipient' => $validated_data['recipient_bc_address'],
                                'contractType' => 3,
                                'amount' => $validated_data['asset_value'].'',
                                'feeLimit' => $asset->usd_asset_exchange_rate / 5,
                            ]))->getData()->signatureId;
                            break;
            
                        case 'USDT':
                            $reserves_address = null;                
                            foreach ($reserves_addresses as $_reserves_address) {
                                $balance = (new Tatum\Blockchain\TronController)->TronGetAccount(new Request(['address' => $_reserves_address->bc_address]))->getData()->balance/1000000;
                                if ($balance > ($validated_data['asset_value'] / $this->TRX_USDT_FCTR)){
                                    $reserves_address = $_reserves_address;
                                    break;
                                }
                            }
                            if ($reserves_address === null){
                                return abort(422, "We're currently experiencing traffic issues, please try again after a short while or contact support if the problem persists");
                            }
                            $validated_data['ttm_bc_txn_signature_id'] = (new Tatum\SmartContracts\GasPumpController)->TransferCustodialWallet(new Request([
                                'chain' => 'TRON',
                                'custodialAddress' => $reserves_address->bc_address,
                                'from' => $reserves_address->bc_address,
                                'recipient' => $validated_data['recipient_bc_address'],
                                'contractType' => 3,
                                'amount' => ($validated_data['asset_value'] / $this->TRX_USDT_FCTR).'',
                                'feeLimit' => $asset->usd_asset_exchange_rate / 5,
                            ]))->getData()->signatureId;
                            break;
                    }
                }
                break;
        }

        $element = (new _TransactionController)->store( new Request($validated_data) )->getData();
        return response()->json( [ 'ref_code' => $element->ref_code ] );
    }


    public function process_withdrawal_completed(string $ref_code, string $bc_txn_id)
    {
        $element = _Transaction::findOrFail($ref_code);
        $validated_data = [
            'bc_txn_id' => $bc_txn_id,
            'ttm_bc_txn_signature_id' => null,
            'ttm_amount_blockage_id' => null,
            '_status' => 'completed',
        ];
        (new _AssetWalletController)->unblockAssetValue( new Request([
            'asset_value' => $element->asset_value_escrowed,
            'ttm_amount_blockage_id' => $element->ttm_amount_blockage_id,
        ]), _AssetWallet::firstWhere(['user_username' => $element->sender_username, 'asset_code' => $element->asset_code])->id );
        (new _TransactionController)->transfer_account_to_account(new Request([
            'asset_code' => $element->asset_code,
            'asset_value' => $element->asset_value,
            'recipient_username' => 'reserves',
            'recipient_note' => 'Transfer for processing of withdrawal '.$element->ref_code,
            'sender_username' => $element->sender_username,
            'sender_note' => 'Transfer for processing of withdrawal '.$element->ref_code,
        ]));
        (new _TransactionController)->update( new Request($validated_data), $element->ref_code );
        (new _TransactionController)->update_local_wallets( $element->ref_code );
        usleep(500);
        (new _TransactionController)->process_platform_charge(new Request([ 'asset_value' => $element->asset_value_escrowed - $element->asset_value]), $element->ref_code);
        return response()->json( [ 'ref_code' => $element->ref_code ] );
    }

    public function process_withdrawal_failed(string $ref_code, string $failure_note)
    {
        $element = _Transaction::findOrFail($ref_code);
        (new Tatum\Security\KMSController)->DeletePendingTransactionToSign(new Request(['id' => $element->ttm_bc_txn_signature_id]));
        $validated_data = [
            'ttm_bc_txn_signature_id' => null,
            'ttm_amount_blockage_id' => null,
            '_status' => 'failed',
            'failure_note' => $failure_note,
        ];
        (new _AssetWalletController)->unblockAssetValue( new Request([
            'asset_value' => $element->asset_value_escrowed,
            'ttm_amount_blockage_id' => $element->ttm_amount_blockage_id,
        ]), _AssetWallet::firstWhere(['user_username' => $element->sender_username, 'asset_code' => $element->asset_code])->id );
        (new _TransactionController)->update( new Request($validated_data), $ref_code );
        return response()->json( [ 'ref_code' => $element->ref_code ] );
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
            'txId' => ['required', 'string', 'unique:__transactions,bc_txn_id'],
            'reference' => ['sometimes', 'string'],
            'blockHeight' => ['sometimes', 'numeric', 'min:0'],
            'blockHash' => ['sometimes', 'string'],
            'from' => ['sometimes', 'string', 'between:13,128'],
            'to' => ['required', 'string', 'between:13,128'],
            'date' => ['required'],
        ]);

        $transactions = (new Tatum\VirtualAccounts\TransactionController)->getTransactionsByAccountId(new Request(['id' => $validated_data['accountId'], 'currency' => $validated_data['currency']]))->getData();
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
        $asset = _Asset::firstWhere('code', $recipient_asset_wallet->asset_code);

        $validated_data['amount'] *= ( ($asset->chain === 'ETH' && $asset->code === 'ETH' && $asset->unit === 'USDT') ? $this->ETH_USDT_FCTR : 1 );
        $validated_data['amount'] *= ( ($asset->chain === 'TRON' && $asset->code === 'TRON' && $asset->unit === 'USDT') ? $this->TRX_USDT_FCTR : 1 );

        $txn_recon_data = [
            //'ttm_centralization_factor' => 1,
            '_status' => 'completed',
            'operation_slug' => 'DEPOSIT',
            'sender_bc_address' => $validated_data['from'],
            'recipient_username' => $recipient_asset_wallet->user_username,
            'recipient_note' => isset($validated_data['recipient_note']) ? $validated_data['recipient_note'] : 'Transfer from external wallet to Ankelli wallet',
            'recipient_bc_address' => $validated_data['to'],
            'asset_code' => $recipient_asset_wallet->asset_code,
            'asset_value' => $validated_data['amount'],
            'bc_txn_id' => $validated_data['txId'],
            'ttm_reference' => $validated_data['reference'],
            'transfer_datetime' => date('Y-m-d H:i:s', $validated_data['date'] / 1000)
        ];

        $element = (new _TransactionController)->store(new Request($txn_recon_data))->getData();
        (new _TransactionController)->update_local_wallets( $element->ref_code );
        return (new _TransactionController)->centralize_assets( $element->ref_code );
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
            'txId' => ['required', 'string', 'unique:__transactions,bc_txn_id'],
            'signatureId' => ['required', 'string', 'exists:__transactions,ttm_bc_txn_signature_id'],
        ]);

        $element = _Transaction::firstWhere(['ttm_bc_txn_signature_id' => $validated_data['signatureId']]);

        switch ($element->operation_slug) {
            case 'DEPOSIT':
                return (new _TransactionController)->centralize_assets_completed( $element->ref_code );
            case 'WITHDRAWAL':
                return (new _TransactionController)->process_withdrawal_completed( $element->ref_code, $validated_data['txId'] );
            default:
                return response()->json( [ 'ref_code' => $element->ref_code ] );
        }
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
            'error' => ['sometimes', 'string'],
            'signatureId' => ['required', 'string', 'exists:__transactions,ttm_bc_txn_signature_id'],
        ]);

        $element = _Transaction::firstWhere(['ttm_bc_txn_signature_id' => $validated_data['signatureId']]);

        switch ($element->operation_slug) {
            case 'DEPOSIT':
                return (new _TransactionController)->centralize_assets_failed( $element->ref_code );
            case 'WITHDRAWAL':
                return (new _TransactionController)->process_withdrawal_failed( $element->ref_code, $validated_data['error'] );
            default:
                return response()->json( [ 'ref_code' => $element->ref_code ] );
        }
    }

    public function test_transfer(Request $request)
    {
        $validated_data = $request->validate([
            'asset_code' => ['required', 'string', 'exists:__assets,code'],
            'asset_value' => ['required', 'numeric', 'min:0'],
            'recipient_username' => ['required', 'string', 'exists:__users,username'],
            'recipient_note' => ['required', 'string', 'max:255'],
        ]);
        $validated_data['_status'] = 'completed';
        $validated_data['operation_slug'] = 'DEPOSIT';
        $element = (new _TransactionController)->store(new Request($validated_data))->getData();
        (new _TransactionController)->update_local_wallets( $element->ref_code );
        return response()->json( [ 'ref_code' => $element->ref_code ] );
    }
}
