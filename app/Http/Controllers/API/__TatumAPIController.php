<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\_Asset;

class __TatumAPIController extends Controller
{
    private $testnet_api_key = '18f7cff7-3990-4ce7-b504-d67143bc9832';
    private $mainnet_api_key = '3eb010e4-b965-487c-b875-7dab48ec3e6e';

    private $x_api_key = '18f7cff7-3990-4ce7-b504-d67143bc9832';

    private $supported_assets = [
        'USDT' => [
            'base_chain' => 'ETH',
            'api_code' => 'USDT',

            'mnemonic' => 'again gospel obtain verify purchase insane hazard invest chicken lemon mother spring move tackle meat novel silk attack desk item anger scatter beef talent',
            'xpub' => 'xpub6ERKWaEy6mLBzYWoo5P19QTexUufpijY5qod5xaH2ksiYtekeFYAoT3JoK87XKULgG7g3yvvxKwsGEVdkTqcC3BFjthMtJendsN1WH9nHoX',

            'blockchain_wallet_generate_url'    => 'https://api-eu1.tatum.io/v3/ethereum/wallet?type=testnet',
            'blockchain_transfer_to_url'        => 'https://api-eu1.tatum.io/v3/offchain/ethereum/erc20/transfer?type=testnet',
        ],
    ];

    public $saved_customer_ids = [
        'reserves' => '6321ec61d5f2885b44f1bda0',
        'guddaz' => '632970417b09c5d6322bc226',
        'paywyze' => '63298faa64858e37282c6267',
        'sekuru' => '63207c7291626c6cd5860a21',
    ];

    private function call_tail($curl)
    {
        $response = curl_exec($curl);
        $error = curl_error($curl);

        $error_code = 422;
        if ($error) $error_code = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        $error_code = $error_code !== 0 ? $error_code : 422;

        curl_close($curl);

        if ($error) {
            return abort($error_code, $error);
        } else {
            $decoded_response = json_decode($response);
            if ( isset($decoded_response->statusCode) && $decoded_response->statusCode !== 200 )
                return abort($decoded_response->statusCode, $decoded_response->message);
            return response()->json( $decoded_response );
        }
    }

    /**
     * Generate Ethereum wallet
     * https://apidoc.tatum.io/tag/Ethereum
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function getOrCreateBlockchainWallet(Request $request)
    {
        $validated_data = $request->validate([
            'asset_code' => ['required', 'string', 'max:64'],
        ]);

        if (!in_array($validated_data['asset_code'], array_keys($this->supported_assets))){
            return abort(422, 'Asset code not yet supported');
        }

        $wallet_config = $this->supported_assets[$validated_data['asset_code']];
        
        if ( isset( $wallet_config['mnemonic'] ) && strlen( $wallet_config['mnemonic'] ) && isset( $wallet_config['xpub'] ) && strlen( $wallet_config['xpub'] ) )
        {
            $response = json_encode([
                'mnemonic' => $wallet_config['mnemonic'],
                'xpub' => $wallet_config['xpub'],
            ]);
            $error = null;
        } else {
            $curl = curl_init();

            curl_setopt_array($curl, [
                CURLOPT_HTTPHEADER => [
                    "x-api-key: " . $this->x_api_key,
                ],
                CURLOPT_URL => $wallet_config['blockchain_wallet_generate_url'],
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_CUSTOMREQUEST => "GET",
            ]);

            $response = curl_exec($curl);
            $error = curl_error($curl);

            $error_code = 422;
            if ($error) $error_code = curl_getinfo($curl, CURLINFO_HTTP_CODE);
            $error_code = $error_code !== 0 ? $error_code : 422;

            curl_close($curl);
        }

        if ($error) {
            return abort($error_code, $error);
        } else {
            $decoded_response = json_decode($response);
            if ( isset($decoded_response->statusCode) && $decoded_response->statusCode !== 200 )
                return abort($decoded_response->statusCode, $decoded_response->message);
            return response()->json( $decoded_response );
        }
    }


    /**
     * List all accounts
     * https://apidoc.tatum.io/tag/Account#operation/getAccounts
     * 
     * List all customer accounts
     * https://apidoc.tatum.io/tag/Account#operation/getAccountsByCustomerId
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function getCustomers(Request $request)
    {
        $validated_data = $request->validate([
            'customer_id' => ['sometimes', 'string'],
        ]);
       
        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: " . $this->x_api_key,
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/customer?" . http_build_query(['type' => 'testnet', 'pageSize' => 50]),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);

        return $this->call_tail($curl);
    }


    /**
     * List all accounts
     * https://apidoc.tatum.io/tag/Account#operation/getAccounts
     * 
     * List all customer accounts
     * https://apidoc.tatum.io/tag/Account#operation/getAccountsByCustomerId
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function getVirtualAccounts(Request $request)
    {
        $validated_data = $request->validate([
            'externalId' => ['sometimes', 'string', 'exists:__users,username'],
            'customerId' => ['sometimes', 'string'],
            'asset_code' => ['sometimes', 'exists:__assets,code', 'string'],
        ]);

        if (isset($validated_data['externalId']) && isset($this->saved_customer_ids[$validated_data['externalId']])){
            $validated_data['customerId'] = $this->saved_customer_ids[$validated_data['externalId']];
        }

        if (isset($validated_data['asset_code'])){
            $validated_data['currency'] = $this->supported_assets[$validated_data['asset_code']]['base_chain'];
        }

        $curl = null;

        if (isset($validated_data['externalId']) || isset($validated_data['customerId'])){
            if (!isset($validated_data['customerId'])){
                return abort(422, 'No customer id saved for selected user');
            }
            $curl = curl_init();
            curl_setopt_array($curl, [
                CURLOPT_HTTPHEADER => [
                    "Content-Type: application/json",
                    "x-api-key: " . $this->x_api_key,
                ],
                CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/account/customer/" . $validated_data['customerId'] . "?" . http_build_query(['type' => 'testnet', 'currency' => isset($validated_data['currency']) ? $validated_data['currency'] : null, 'pageSize' => 50]),
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_CUSTOMREQUEST => "GET",
            ]);
        } else {
            $curl = curl_init();
            curl_setopt_array($curl, [
                CURLOPT_HTTPHEADER => [
                    "x-api-key: " . $this->x_api_key,
                ],
                CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/account?" . http_build_query(['type' => 'testnet', 'currency' => isset($validated_data['currency']) ? $validated_data['currency'] : null]),
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_CUSTOMREQUEST => "GET",
            ]);
        }

        $response = curl_exec($curl);
        $error = curl_error($curl);

        $error_code = 422;
        if ($error) $error_code = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        $error_code = $error_code !== 0 ? $error_code : 422;

        curl_close($curl);

        if ($error) {
            return abort($error_code, $error);
        } else {
            $decoded_response = json_decode($response);
            if ( isset($decoded_response->statusCode) && $decoded_response->statusCode !== 200 )
                return abort($decoded_response->statusCode, $decoded_response->message);

            if ((isset($validated_data['customerId'])) && isset($validated_data['asset_code']) && is_array($decoded_response) && count($decoded_response)){
                $decoded_response = array_filter($decoded_response, function($item) use($validated_data){
                    return $item->currency = $this->supported_assets[$validated_data['asset_code']]['base_chain'];
                });
            }
            return response()->json( $decoded_response );
        }
    }


    /**
     * Create a new asset wallet on the tatum platform.
     * https://apidoc.tatum.io/tag/Account#operation/createAccount
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function createVirtualAccountXpub(Request $request)
    {
        $validated_data = $request->validate([
            'user_username' => ['required', 'exists:__users,username', 'string'],
            'asset_code' => ['required', 'exists:__assets,code', 'string'],
        ]);

        $asset = _Asset::firstWhere('code',$validated_data['asset_code'])->makeVisible(['tatum_xpub']);

        $payload = [
            "currency" => $this->supported_assets[$validated_data['asset_code']]['base_chain'],
            "xpub" => $asset->tatum_xpub,
            "customer" => [
                "externalId" => $validated_data['user_username'],
                "accountingCurrency" => "USD",
            ],
            "accountingCurrency" => "USD",
        ];

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: " . $this->x_api_key,
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/account?type=testnet",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->call_tail($curl);
    }


    /**
     * Deactivate account
     * https://apidoc.tatum.io/tag/Account#operation/deactivateAccount
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function deactivateVirtualAccount(Request $request)
    {
        $validated_data = $request->validate([
            'virtual_account_id' => ['required', 'string'],
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: " . $this->x_api_key,
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/account/" . $validated_data['virtual_account_id'] . "/deactivate",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "PUT",
        ]);

        return $this->call_tail($curl);
    }


    /**
     * Block an amount in an account
     * https://apidoc.tatum.io/tag/Account#operation/blockAmount
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function blockAmountInAccount(Request $request)
    {
        $validated_data = $request->validate([
            'virtual_account_id' => ['required', 'string'],
            'amount' => ['required', 'numeric'],
            'type' => ['required', 'string'],
        ]);

        $payload = [
            'amount' => $validated_data['amount'],
            'type' => $validated_data['type'],
        ];

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: " . $this->x_api_key,
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/account/block/" . $validated_data['virtual_account_id'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->call_tail($curl);
    }

    /**
     * Unblock a blocked amount in an account
     * https://apidoc.tatum.io/tag/Account#operation/deleteBlockAmount
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function unblockAmountInAccount(Request $request)
    {
        $validated_data = $request->validate([
            'block_id' => ['required', 'string'],
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: " . $this->x_api_key,
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/account/block/" . $validated_data['block_id'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "DELETE",
        ]);

        return $this->call_tail($curl);
    }

    /**
     * Create a deposit address for a virtual account.
     * https://apidoc.tatum.io/tag/Blockchain-addresses#operation/generateDepositAddress
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function getVirtualAccountDepositAddresses(Request $request)
    {
        $validated_data = $request->validate([
            'virtual_account_id' => ['required', 'string']
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: " . $this->x_api_key,
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/offchain/account/" . $validated_data['virtual_account_id'] . "/address?type=testnet",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);

        return $this->call_tail($curl);
    }

    /**
     * Create a deposit address for a virtual account.
     * https://apidoc.tatum.io/tag/Blockchain-addresses#operation/generateDepositAddress
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function createVirtualAccountDepositAddress(Request $request)
    {
        $validated_data = $request->validate([
            'virtual_account_id' => ['required', 'string']
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: " . $this->x_api_key,
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/offchain/account/" . $validated_data['virtual_account_id'] . "/address?type=testnet",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->call_tail($curl);
    }


    /**
     * Send ETH from a virtual account to the blockchain
     * https://apidoc.tatum.io/tag/Blockchain-operations#operation/EthTransfer
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function transferAssetValueFromVirtualAccountToBlockchain(Request $request)
    {
        $validated_data = $request->validate([
            'asset_code' => ['required', 'exists:__assets,code', 'string'],
            'address' => ['required', 'string'],
            'amount' => ['required', 'string'],
            'index' => ['required', 'integer'],
            'senderAccountId' => ['required', 'string'],
        ]);

        $wallet_config = $this->supported_assets[$validated_data['asset_code']];
        $asset = _Asset::firstWhere('code',$validated_data['asset_code'])->makeVisible(['tatum_mnemonic']);

        $payload = [
            "currency" => $this->supported_assets[$validated_data['asset_code']]['currency'],
            "address" => $validated_data['address'],
            "amount" => $validated_data['amount'],
            "index" => $validated_data['index'],
            "mnemonic" => $asset->tatum_mnemonic,
            "senderAccountId" => $validated_data['senderAccountId']
        ];
        
        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: " . $this->x_api_key,
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => $wallet_config['blockchain_transfer_to_url'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->call_tail($curl);
    }


    /**
     * Send payment
     * https://apidoc.tatum.io/tag/Transaction#operation/sendTransaction
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function transferAssetValueOffchain(Request $request)
    {
        $validated_data = $request->validate([
            'senderAccountId' => ['required', 'string'],
            'recipientAccountId' => ['required', 'string'],
            'amount' => ['required', 'string'],
        ]);

        $payload = $validated_data;
        
        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: " . $this->x_api_key,
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/transaction?type=testnet",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->call_tail($curl);
    }

    /**
     * Send payment
     * https://apidoc.tatum.io/tag/Transaction#operation/sendTransaction
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function getVirtualAccountTransactions(Request $request)
    {
        $validated_data = $request->validate([
            'virtual_account_id' => ['required', 'string'],
            //'currency' => ['required', 'string'],
        ]);

        $payload = [
            'id' => $validated_data['virtual_account_id'],
            //'currency' => $validated_data['currency'],
        ];
        
        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: " . $this->x_api_key,
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/transaction/account?" . http_build_query(['type' => 'testnet', 'currency' => isset($validated_data['currency']) ? $validated_data['currency'] : null, 'pageSize'=>50]),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->call_tail($curl);
    }
}
