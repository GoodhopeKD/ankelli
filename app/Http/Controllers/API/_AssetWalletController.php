<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

use App\Models\_PrefItem;
use App\Models\_User;
use App\Models\_Asset;
use App\Models\_Transaction;
use App\Models\_AssetWalletAddress;

use App\Models\_AssetWallet;
use App\Http\Resources\_AssetWalletResource;
use App\Http\Resources\_AssetWalletResourceCollection;

class _AssetWalletController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    // tempFunction
    public function EthGetBalance()
    {
        return (new Tatum\Blockchain\EthereumController)->EthGetBalance(new Request(['address' => '0x0688af85d9fc2805151f5ffa66b7b505a59cc732']))->getData();
    }

    // tempFunction
    public function hvknk()
    {
        return (new Tatum\Blockchain\EthereumController)->EthGetBalance(new Request(['address' => '0x0688af85d9fc2805151f5ffa66b7b505a59cc732']))->getData();
    }

    // tempFunction
    public function ssdsf()
    {
        (new _AssetWalletController)->DeletePendingTransactionToSign();
        $transfer = false;
        $addresses = [];
        for ($i=36; $i <= 46; $i++) {
            $address = [];
            $address['xpub_index'] = $i;
            $address['address'] = (new Tatum\Blockchain\EthereumController)->EthGenerateAddress(new Request([
                'xpub' => 'xpub6ERKWaEy6mLBzYWoo5P19QTexUufpijY5qod5xaH2ksiYtekeFYAoT3JoK87XKULgG7g3yvvxKwsGEVdkTqcC3BFjthMtJendsN1WH9nHoX',
                'index' => $address['xpub_index'],
            ]))->getData()->address;
            $address['balance'] = (new Tatum\Blockchain\EthereumController)->EthGetBalance(new Request(['address' => $address['address']]))->getData()->balance;
            if ( $address['balance'] > 0 ) {
                $estimated_fee =  (new Tatum\FeeEstimation\EstimateEthereumTransactionFeeController)->EthEstimateGas(new Request([
                    'from' => $address['address'],
                    'to' => '0x0688af85d9fc2805151f5ffa66b7b505a59cc732',
                    'amount' => $address['balance'],
                ]))->getData();
                $address['estimated_fee'] = ['gasLimit' => $estimated_fee->gasLimit, 'gasPrice' => ((float)$estimated_fee->gasPrice / pow(10,9)).'' ];
                $address['transferrable'] = ($address['balance'] - (float)$address['estimated_fee']['gasLimit'] * ((float)$address['estimated_fee']['gasPrice']) / pow(10,9)).'';
                if ( $transfer )
                $address['transfer_signatureId'] = (new Tatum\Blockchain\EthereumController)->EthBlockchainTransfer(new Request([
                    'to' => '0x0688af85d9fc2805151f5ffa66b7b505a59cc732',
                    'currency' => 'ETH',
                    'amount' => $address['transferrable'].'',
                    'index' => $address['xpub_index'],
                    'fee' => $address['estimated_fee'],
                ]))->getData()->signatureId;
                array_push($addresses, $address);
            }
        }

        return $addresses;
    }

    // tempFunction
    public function EthBlockchainTransfer()
    {
        return (new Tatum\Blockchain\EthereumController)->EthBlockchainTransfer(new Request([
            'to' => '0xaaada23b6b5705e23e12f78d064a1f1e62fb6126',
            'currency' => 'ETH',
            'amount' => '0.05',
            'index' => 29,
            'signatureId' => '508e642c-f959-4e73-a07b-087e9215f26d',
        ]))->getData();
    }

    // tempFunction
    public function ReceivePendingTransactionsToSign()
    {
        return (new Tatum\Security\KMSController)->ReceivePendingTransactionsToSign(new Request(['chain' => 'ETH']))->getData();
    }

    // tempFunction
    public function DeletePendingTransactionsToSign()
    {
        foreach ((new Tatum\Security\KMSController)->ReceivePendingTransactionsToSign(new Request(['chain' => 'ETH']))->getData() as $txn) {
            (new Tatum\Security\KMSController)->DeletePendingTransactionToSign(new Request(['id' => $txn->id]));
        }
    }

    // tempFunction
    public function PrecalculateGasPumpAddresses()
    {
        return (new Tatum\SmartContracts\GasPumpController)->PrecalculateGasPumpAddresses(new Request([
            'chain' => 'ETH',
            'owner' => '0x4e9470217400b27ccdb64237e6776abcda535956',
            'from' => 0,
            'to' => 15,
        ]));
    }

    // tempFunction
    public function ActivateGasPumpAddresses()
    {
        return (new Tatum\SmartContracts\GasPumpController)->ActivateGasPumpAddresses(new Request([
            'chain' => 'ETH',
            'owner' => '0x4e9470217400b27ccdb64237e6776abcda535956',
            'from' => 16,
            'to' => 16,
        ]));
    }

    // tempFunction
    public function GasPumpAddressesActivatedOrNot()
    {
        return (new Tatum\SmartContracts\GasPumpController)->GasPumpAddressesActivatedOrNot(new Request([
            'chain' => 'ETH',
            'owner' => '0x4e9470217400b27ccdb64237e6776abcda535956',
            'index' => 16,
        ]));
    }

    // tempFunction
    public function assignAddress()
    {
        return (new Tatum\VirtualAccounts\BCAddressController)->assignAddress(new Request(['id' => '6343de9567b043ee14be9970', 'address' => '0x02A2e5E52755Cc77Da42658bC55686494F051155']));
    }

    // tempFunction
    public function removeAddress()
    {
        return (new Tatum\VirtualAccounts\BCAddressController)->removeAddress(new Request(['id' => '6343de9567b043ee14be9970', 'address' => '0x010b6ab0abeeb921964161cd2e23c50250e546bf']));
    }

    // tempFunction
    public function CustodialGetWallet()
    {
        return (new Tatum\Security\CustodialManagedWalletController)->CustodialGetWallet(new Request(['id' => "7dc19c98-a3f5-44f6-8ca1-10ae57af6832", 'export' => 'true']));
    }

    // tempFunction
    public function addressExists()
    {
        return (new Tatum\VirtualAccounts\BCAddressController)->addressExists(new Request(['currency' => 'ETH', 'address' => '0x010b6ab0abeeb921964161cd2e23c50250e546bf']));
    }

    // tempFunction
    public function CustodialGetWallets()
    {
        return (new Tatum\Security\CustodialManagedWalletController)->CustodialGetWallets(new Request());
    }

    public function findAllCustomers()
    {
        return (new Tatum\VirtualAccounts\CustomerController)->findAllCustomers(new Request())->getData();
    }

    // tempFunction
    public function getCustomerByExternalOrInternalId()
    {
        return (new Tatum\VirtualAccounts\CustomerController)->getCustomerByExternalOrInternalId(new Request(['id' => 'busops']))->getData();
    }

    public function getAccounts()
    {
        return (new Tatum\VirtualAccounts\AccountController)->getAccounts(new Request())->getData();
    }

    // tempFunction
    public function getAccountsByCustomerId()
    {
        return (new Tatum\VirtualAccounts\AccountController)->getAccountsByCustomerId(new Request(['id' => '63207c7291626c6cd5860a21']))->getData();
    }

    // tempFunction
    public function getAllDepositAddresses()
    {
        return (new Tatum\VirtualAccounts\BCAddressController)->getAllDepositAddresses(new Request(['id' => '6343de9567b043ee14be9970']))->getData();
    }

    // tempFunction
    public function get_vacc_transactions()
    {
        return (new Tatum\VirtualAccounts\TransactionController)->getTransactionsByAccountId(new Request(['id' => '63296ef838931796fa9e5aed', 'currency' => 'ETH']))->getData();
    }

    // tempFunction
    public function getTransactions()
    {
        $transactions = [];
        $offset = 0;
        while (count((new Tatum\VirtualAccounts\TransactionController)->getTransactions(new Request(['offset' => $offset]))->getData())) {
            $transactions = array_merge( $transactions, ((new Tatum\VirtualAccounts\TransactionController)->getTransactions(new Request(['offset' => $offset]))->getData() ) );
            $offset += 50;
        }
        return $transactions;
    }

    // tempFunction
    public function getSubscriptions()
    {
        return (new Tatum\Subscriptions\NotificationSubscriptionController)->getSubscriptions(new Request())->getData();
    }

    // tempFunction
    public function tempFunction()
    {
        return (new Tatum\Subscriptions\NotificationSubscriptionController)->getAllWebhooks(new Request())->getData();
    }

    public function redo_tatum_txn_recon_transactions()
    {
        foreach (_AssetWallet::get() as $asset_wallet) {
            $asset_wallet->update(['usable_balance_asset_value' => 0, 'total_balance_asset_value' => 0]);
        }
        _Transaction::truncate();
        $fetched_transactions = [];
        $offset = 0;
        while (count((new Tatum\VirtualAccounts\TransactionController)->getTransactions(new Request(['offset' => $offset]))->getData())) {
            $fetched_transactions = array_merge( $fetched_transactions, ((new Tatum\VirtualAccounts\TransactionController)->getTransactions(new Request(['offset' => $offset]))->getData() ) );
            $offset += 50;
        }
        /*$transactions = [];
        foreach ($fetched_transactions as $transaction) {
            if (!( ($transaction->transactionType == 'DEBIT_WITHDRAWAL' && count(array_filter($fetched_transactions, function($item) use ($transaction) {
                return ($item->reference == $transaction->reference && $item->transactionType == 'CANCEL_WITHDRAWAL');
            }))) || ($transaction->transactionType == 'CANCEL_WITHDRAWAL' && count(array_filter($fetched_transactions, function($item) use ($transaction) {
                return ($item->reference == $transaction->reference && $item->transactionType == 'DEBIT_WITHDRAWAL');
            })))) ) {
                array_push($transactions, $transaction);
            }
        }*/
        foreach ( array_reverse( $fetched_transactions ) as $transaction) {
            (new _TransactionController)->ttm_txn_recon(new Request( json_decode(json_encode($transaction), true) ));
            usleep(500);
        }
    }

    public function redo_tatum_subscription_webhook_txn_recon_requests()
    {
        foreach ( array_reverse((new Tatum\Subscriptions\NotificationSubscriptionController)->getAllWebhooks(new Request())->getData()) as $request) {
            if (!isset($request->retryCount)){
                (new _TransactionController)->ttm_recon_for_incoming_bc_txn(new Request( json_decode(json_encode($request->data), true) ));
                usleep(500);
            }
        }
    }

    private $ETH_USDT_FCTR = 1000;

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validated_data = $request->validate([
            'user_username' => ['required', 'string', 'exists:__users,username'],
            'asset_code' => ['required', 'string', 'exists:__assets,code'],
            '_status' => ['sometimes', 'string', Rule::in(['active', 'frozen'])],
        ]);

        if (_AssetWallet::where(['user_username' => $validated_data['user_username'], 'asset_code' => $validated_data['asset_code']])->exists()){
            return abort(422, 'Account with given params already exists');
        }

        $validated_data['asset_chain'] = _Asset::firstWhere(['code' => $validated_data['asset_code']])->chain;

        $validated_data['usable_balance_asset_value'] = 0;
        $validated_data['total_balance_asset_value'] = 0;

        if ( _PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f() ){
            $asset = _Asset::firstWhere(['code' => $validated_data['asset_code']]);
            $ttm_element = null;
            try {
                $ttm_customer = (new Tatum\VirtualAccounts\CustomerController)->getCustomerByExternalOrInternalId(new Request(['id' => $validated_data['user_username']]))->getData();
                $ttm_customer_virt_accts = (new Tatum\VirtualAccounts\AccountController)->getAccountsByCustomerId(new Request(['id' => $ttm_customer->id]))->getData();
                if (count($ttm_customer_virt_accts)){
                    foreach ($ttm_customer_virt_accts as $ttm_customer_virt_acct) {
                        if ($ttm_customer_virt_acct->currency == $validated_data['asset_code']){ $ttm_element = $ttm_customer_virt_acct; break; }
                    }
                }
            } catch (\Throwable $th) {}
            $ttm_element = $ttm_element ?? (new Tatum\VirtualAccounts\AccountController)->createAccount(new Request([
                'currency' => $validated_data['asset_code'],
                'externalId' => $validated_data['user_username'],
                'xpub' => _Asset::firstWhere(['code' => $validated_data['asset_code']])->makeVisible(['xpub'])->xpub,
                'accountingCurrency' => 'USD',
            ]))->getData();

            $validated_data['ttm_virtual_account_id'] = $ttm_element->id;
            $validated_data['usable_balance_asset_value'] = $ttm_element->balance->availableBalance;
            $validated_data['total_balance_asset_value'] = $ttm_element->balance->accountBalance;
            if ($asset->fe_asset_code === 'USDT'){
                $validated_data['usable_balance_asset_value'] *= $this->ETH_USDT_FCTR;
                $validated_data['total_balance_asset_value'] *= $this->ETH_USDT_FCTR;
            }
            if ($validated_data['total_balance_asset_value'] !== $validated_data['usable_balance_asset_value']){
                (new Tatum\VirtualAccounts\AccountController)->deleteAllBlockAmount(new Request(['id' => $ttm_element->id]));
                $validated_data['usable_balance_asset_value'] = $validated_data['total_balance_asset_value'];
            }
            
            $user = _User::firstWhere('username', $validated_data['user_username']);
            if (!$user->ttm_customer_id){
                (new _UserController)->update(new Request(['ttm_customer_id' => $ttm_element->customerId]), $validated_data['user_username']);
            }

            try {
                $ttm_element = (new Tatum\Subscriptions\NotificationSubscriptionController)->createSubscription(new Request([
                    'type' => 'ACCOUNT_INCOMING_BLOCKCHAIN_TRANSACTION',
                    'attr' => [
                        'id' => $validated_data['ttm_virtual_account_id'],
                        'url' => "https://api.ankelli.com/webhooks/tatum/nofitications/incoming-blockchain-transaction",
                    ],
                ]))->getData();
                $validated_data['ttm_subscription_id'] = $ttm_element->id;
            } catch (\Throwable $th) {}
        }

        $element = _AssetWallet::create($validated_data);

        if ( _PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f() ){
            $ttm_elements = (new Tatum\VirtualAccounts\BCAddressController)->getAllDepositAddresses(new Request(['id' => $validated_data['ttm_virtual_account_id']]))->getData();
            if (count($ttm_elements)){
                foreach ($ttm_elements as $ttm_element) {
                    $asset_wallet_address_params = [
                        'user_username' => $validated_data['user_username'],
                        'asset_code' => $validated_data['asset_code'],
                        'bc_address' => strtolower( $ttm_element->address ),
                        'ttm_derivation_key' => $ttm_element->derivationKey,
                    ];
                    if ( !_AssetWalletAddress::where($asset_wallet_address_params)->exists() ){
                        (new _AssetWalletAddressController)->store(new Request($asset_wallet_address_params));
                    }
                }
            } else {
                (new _AssetWalletAddressController)->store(new Request(['asset_code' => $validated_data['asset_code'], 'user_username' => $validated_data['user_username']]));
            }
        }
        
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _AssetWallet entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        if ($request->expectsJson()) return response()->json( new _AssetWalletResource( $element ) );
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(int $id)
    {
        $element = _AssetWallet::find($id);
        if (!$element) return abort(404, 'Asset account with specified id not found');
        return response()->json( new _AssetWalletResource( $element ) );
    }
    
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function blockAssetValue(Request $request, int $id)
    {
        $validated_data = $request->validate([
            'asset_value' => ['required', 'numeric', 'min:0'],
            'blockage_type_slug' => ['required', 'string'],
        ]);
        $element = _AssetWallet::findOrFail($id);
        $update = (new _AssetWalletController)->update( new Request([
            'action_note' => 'Block an asset value',
            'usable_balance_asset_value' => $element->usable_balance_asset_value - $validated_data['asset_value'],
        ]), $id );
        if ( _PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f() ){
            $asset = _Asset::firstWhere('code', $element->asset_code);
            if ( $asset->fe_asset_code === 'USDT' ) $validated_data['asset_value'] /= $this->ETH_USDT_FCTR;
            return (new Tatum\VirtualAccounts\AccountController)->blockAmount(new Request([
                'id' => $element->ttm_virtual_account_id,
                'amount' => $validated_data['asset_value'].'',
                'type' => $validated_data['blockage_type_slug'],
            ]));
        } else {
            return $update;
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function unblockAssetValue(Request $request, int $id)
    {
        $use_ttm_api = _PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f();
        $validated_data = $request->validate([
            'asset_value' => ['required', 'numeric', 'min:0'],
            'ttm_amount_blockage_id' => [ ($use_ttm_api ? 'required' : 'nullable'), 'string'],
        ]);
        $element = _AssetWallet::findOrFail($id);
        $update = (new _AssetWalletController)->update( new Request([
            'action_note' => 'Unblock an asset value',
            'usable_balance_asset_value' => $element->usable_balance_asset_value + $validated_data['asset_value'],
        ]), $id );
        if ( $use_ttm_api ){
            return (new Tatum\VirtualAccounts\AccountController)->deleteBlockAmount(new Request([ 'id' => $validated_data['ttm_amount_blockage_id'] ]));
        } else {
            return $update;
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, int $id)
    {
        $validated_data = $request->validate([
            'usable_balance_asset_value' => ['sometimes', 'numeric', 'min:0'],
            'total_balance_asset_value' => ['sometimes', 'numeric', 'min:0'],
            '_status' => ['sometimes', 'string', Rule::in(['active', 'frozen'])],
        ]);

        $element = _AssetWallet::findOrFail($id);

        // Handle _Log
        $log_entry_update_result = [];
        foreach ( $validated_data as $key => $value ) {
            if ( in_array( $key, $element->getFillable() ) && $element->{$key} != $value ){
                array_push( $log_entry_update_result, [
                    'field_name' => $key,
                    'old_value' => $element->{$key},
                    'new_value' => $value,
                ]);
            }
        }
        if (!count($log_entry_update_result)) return abort(422, 'No values were updated');
        (new _LogController)->store( new Request([
            'action_note' => 'Updating of _AssetWallet entry in database.',
            'action_type' => 'entry_update',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
            'entry_update_result'=> $log_entry_update_result,
        ]));
        // End _Log Handling
        $element->update($validated_data);
        if ($request->expectsJson()) return response()->json( new _AssetWalletResource( $element ) );
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(int $id)
    {
        //
    }

    public function asset_wallets_totals(Request $request)
    {
        $validated_data = $request->validate([
            'asset_code' => ['required', 'string', 'exists:__assets,code'],
        ]);
        return response()->json([
            'users' => _AssetWallet::where('asset_code', $validated_data['asset_code'])->whereNotIn('user_username',['busops', 'reserves'])->sum('total_balance_asset_value'),
            'busops' => _AssetWallet::firstWhere(['asset_code' => $validated_data['asset_code'], 'user_username' => 'busops'])->total_balance_asset_value,
            'reserves' => _AssetWallet::firstWhere(['asset_code' => $validated_data['asset_code'], 'user_username' => 'reserves'])->total_balance_asset_value,
        ]);
    }
}
