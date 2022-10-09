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
    public function getBlockchainWalletBalance()
    {
        return (new Tatum\Blockchain\EthereumController)->EthGetBalance(new Request(['address' => '0x4e9470217400b27ccdb64237e6776abcda535956']))->getData();
    }

    public function ReceivePendingTransactionsToSign()
    {
        return (new Tatum\Security\KMSController)->ReceivePendingTransactionsToSign(new Request(['chain' => 'ETH']))->getData();
    }

    public function DeletePendingTransactionToSign()
    {
        foreach ((new Tatum\Security\KMSController)->ReceivePendingTransactionsToSign(new Request(['chain' => 'ETH']))->getData() as $txn) {
            (new Tatum\Security\KMSController)->DeletePendingTransactionToSign(new Request(['id' => $txn->id]));
        }
    }

    public function PrecalculateGasPumpAddresses()
    {
        return (new Tatum\SmartContracts\GasPumpController)->PrecalculateGasPumpAddresses(new Request([
            'chain' => 'ETH',
            'owner' => '0x4e9470217400b27ccdb64237e6776abcda535956',
            'from' => 0,
            'to' => 15,
        ]));
    }

    public function ActivateGasPumpAddresses()
    {
        return (new Tatum\SmartContracts\GasPumpController)->ActivateGasPumpAddresses(new Request([
            'chain' => 'ETH',
            'owner' => '0x4e9470217400b27ccdb64237e6776abcda535956',
            'from' => 0,
            'to' => 15,
        ]));
    }

    public function ActivatedNotActivatedGasPumpAddresses()
    {
        return (new Tatum\SmartContracts\GasPumpController)->ActivatedNotActivatedGasPumpAddresses(new Request([
            'chain' => 'ETH',
            'owner' => '0x4e9470217400b27ccdb64237e6776abcda535956',
            'index' => 15,
        ]));
    }

    public function CustodialGetWallets()
    {
        return (new Tatum\Security\CustodialManagedWalletController)->CustodialGetWallets(new Request());
    }

    public function findAllCustomers()
    {
        return (new Tatum\VirtualAccounts\CustomerController)->findAllCustomers(new Request())->getData();
    }

    public function getCustomerByExternalOrInternalId()
    {
        return (new Tatum\VirtualAccounts\CustomerController)->getCustomerByExternalOrInternalId(new Request(['id' => 'busops']))->getData();
    }

    public function updateCustomer()
    {
        return (new Tatum\VirtualAccounts\CustomerController)->updateCustomer(new Request(['id' => '63207c7291626c6cd5860a21', 'externalId' => 'john_doe']))->getData();
    }

    public function getAccounts()
    {
        return (new Tatum\VirtualAccounts\AccountController)->getAccounts(new Request())->getData();
    }

    public function getAccountsByCustomerId()
    {
        return (new Tatum\VirtualAccounts\AccountController)->getAccountsByCustomerId(new Request(['id' => '6321ec61d5f2885b44f1bda0']))->getData();
    }

    public function get_addresses()
    {
        return (new Tatum\VirtualAccounts\BCAddressController)->getAllDepositAddresses(new Request(['id' => '63296ef838931796fa9e5aed']))->getData();
    }

    public function get_vacc_transactions()
    {
        return (new Tatum\VirtualAccounts\TransactionController)->getTransactionsByAccountId(new Request(['id' => '63296ef838931796fa9e5aed', 'currency' => 'ETH']))->getData();
    }

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

    public function getSubscriptions()
    {
        return (new Tatum\Subscriptions\NotificationSubscriptionController)->getSubscriptions(new Request())->getData();
    }

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
                        if ($ttm_customer_virt_acct->currency == $asset->ttm_currency){ $ttm_element = $ttm_customer_virt_acct; break; }
                    }
                }
            } catch (\Throwable $th) {}
            $ttm_element = $ttm_element ?? (new Tatum\VirtualAccounts\AccountController)->createAccount(new Request([
                'one_of' => 'createAccountXpub',
                'currency' => $asset->ttm_currency,
                'externalId' => $validated_data['user_username'],
                'xpub' => $asset->ttm_xpub,
                'accountingCurrency' => 'USD',
            ]))->getData();

            $validated_data['ttm_virtual_account_id'] = $ttm_element->id;
            $validated_data['usable_balance_asset_value'] = $ttm_element->balance->availableBalance;
            $validated_data['total_balance_asset_value'] = $ttm_element->balance->accountBalance;
            if ($validated_data['total_balance_asset_value'] !== $validated_data['usable_balance_asset_value']){
                (new Tatum\VirtualAccounts\AccountController)->deleteAllBlockAmount(new Request(['id' => $ttm_element->id]));
                $validated_data['usable_balance_asset_value'] = $validated_data['total_balance_asset_value'];
            }
            
            $user = _User::firstWhere('username', $validated_data['user_username']);
            if (!$user->ttm_customer_id){
                (new _UserController)->update(new Request(['ttm_customer_id' => $ttm_element->customerId]), $validated_data['user_username']);
            }

            $ttm_element = (new Tatum\Subscriptions\NotificationSubscriptionController)->createSubscription(new Request([
                'type' => 'ACCOUNT_INCOMING_BLOCKCHAIN_TRANSACTION',
                'attr' => [
                    'id' => $validated_data['ttm_virtual_account_id'],
                    'url' => "https://api.ankelli.com/webhooks/tatum/nofitications/incoming-blockchain-transaction",
                ],
            ]))->getData();
            $validated_data['ttm_subscription_id'] = $ttm_element->id;
        }

        $element = _AssetWallet::create($validated_data);

        if ( _PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f() ){
            $ttm_elements = (new Tatum\VirtualAccounts\BCAddressController)->getAllDepositAddresses(new Request(['id' => $validated_data['ttm_virtual_account_id']]))->getData();
            if (count($ttm_elements)){
                foreach ($ttm_elements as $ttm_element) {
                    $asset_wallet_address_params = [
                        'asset_wallet_id' => $element->id, 
                        'user_username' => $validated_data['user_username'],
                        'blockchain_address' => $ttm_element->address,
                        'ttm_derivation_key' => $ttm_element->derivationKey,
                    ];
                    if ( !_AssetWalletAddress::where($asset_wallet_address_params)->exists() ){
                        (new _AssetWalletAddressController)->store(new Request($asset_wallet_address_params));
                    }
                }
            } else {
                (new _AssetWalletAddressController)->store(new Request(['asset_wallet_id' => $element->id, 'user_username' => $validated_data['user_username']]));
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
}
