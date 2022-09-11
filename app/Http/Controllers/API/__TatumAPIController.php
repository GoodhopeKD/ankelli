<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class __TatumAPIController extends Controller
{
    private $testnet_api_key = '18f7cff7-3990-4ce7-b504-d67143bc9832';
    private $mainnet_api_key = '3eb010e4-b965-487c-b875-7dab48ec3e6e';

    private $x_api_key = '18f7cff7-3990-4ce7-b504-d67143bc9832';

    private $supported_assets = [
        'USDT' => [
            'asset_generate_url' => 'https://api-eu1.tatum.io/v3/ethereum/wallet',
            'private_key_generate_url' => 'https://api-eu1.tatum.io/v3/ethereum/wallet/priv',
            'transaction_url' => 'https://api-eu1.tatum.io/v3/ethereum/transaction',
        ],
    ];

    /**
     * Create a new asset on the tatum platform.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function createAsset(Request $request)
    {
        $validated_data = $request->validate([
            'code' => ['required', 'string', 'max:64'],
        ]);

        if (!in_array($validated_data['code'], array_keys($this->supported_assets))){
            return abort(422, 'Asset code not yet supported');
        }

        $curl = curl_init();

        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: " . $this->x_api_key,
            ],
            CURLOPT_URL => $this->supported_assets[$validated_data['code']]['asset_generate_url'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);

        $response = curl_exec($curl);
        $error = curl_error($curl);

        curl_close($curl);

        if ($error) {
            return abort($error->statusCode, $error->message);
        } else {
            return response()->json( json_decode($response) );
        }
    }


    /**
     * Create a new asset wallet on the tatum platform.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function createAssetWallet(Request $request)
    {
        $validated_data = $request->validate([
            'user_username' => ['required', 'exists:__users,username', 'string'],
            'asset_code' => ['required', 'exists:__assets,code', 'string'],
        ]);

        $asset = _Asset::firstWhere('code',$validated_data['asset_code'])->makeVisible(['tatum_xpub']);

        $curl = curl_init();
        $payload = [
            "currency" => $validated_data['asset_code'],
            "xpub" => $asset->tatum_xpub,
            "customer" => [
                "externalId" => $validated_data['user_username'],
            ],
        ];
          
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: " . $this->x_api_key,
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/account",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        $response = curl_exec($curl);
        $error = curl_error($curl);

        curl_close($curl);

        if ($error) {
            return abort($error->statusCode, $error->message);
        } else {
            return response()->json( json_decode($response) );
        }
    }

    /**
     * Create a new asset wallet address on the tatum platform.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function createAssetWalletAddress(Request $request)
    {
        $validated_data = $request->validate([
            'user_username' => ['required', 'exists:__users,username', 'string'],
            'asset_code' => ['required', 'exists:__assets,code', 'string'],
        ]);

        $asset_wallet = _AssetWallet::firstWhere($validated_data)->makeVisible(['blockchain_account_id','tatum_derivation_key']);

        $curl = curl_init();
        $payload = [
            
        ];
          
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: " . $this->x_api_key,
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/offchain/account/" . $asset_wallet->blockchain_account_id . "/address",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        $response = curl_exec($curl);
        $error = curl_error($curl);

        curl_close($curl);

        if ($error) {
            return abort($error->statusCode, $error->message);
        } else {
            return response()->json( json_decode($response) );
        }
    }


    /**
     * Create a new asset wallet private key on the tatum platform.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function createAssetWalletPrivateKey(Request $request)
    {
        $validated_data = $request->validate([
            'user_username' => ['required', 'exists:__users,username', 'string'],
            'asset_code' => ['required', 'exists:__assets,code', 'string'],
        ]);

        $asset = _Asset::firstWhere('code',$validated_data['asset_code'])->makeVisible(['tatum_mnemonic']);
        $asset_wallet = _AssetWallet::firstWhere($validated_data)->makeVisible(['blockchain_account_id', 'tatum_derivation_key']);

        $curl = curl_init();
        $payload = [
            'index' => 0,
            'mnemonic' => $asset->tatum_mnemonic,
        ];
          
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: " . $this->x_api_key,
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/offchain/account/" . $asset_wallet->blockchain_account_id . "/address",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        $response = curl_exec($curl);
        $error = curl_error($curl);

        curl_close($curl);

        if ($error) {
            return abort($error->statusCode, $error->message);
        } else {
            return response()->json( json_decode($response) );
        }
    }


    /**
     * Transfer asset value on the tatum platform.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function createTransaction(Request $request)
    {
        $validated_data = $request->validate([
            'source_user_username' => ['sometimes', 'exists:__users,username', 'string'],
            'destination_user_username' => ['sometimes', 'exists:__users,username', 'string'],
            'asset_code' => ['required', 'exists:__assets,code', 'string'],
            'transfer_value' => ['required', 'numeric'],
        ]);

        $source_user_asset_wallet = _AssetWallet::firstWhere(['user_username' => $validated_data['source_user_username'], 'asset_code' => $validated_data['asset_code']])->makeVisible(['blockchain_private_key']);
        $destination_user_asset_wallet = _AssetWallet::firstWhere(['user_username' => $validated_data['destination_user_username'], 'asset_code' => $validated_data['asset_code']])->makeVisible(['blockchain_address']);

        $curl = curl_init();
        $payload = [
            "to" => $destination_user_asset_wallet->blockchain_address,
            "currency" => $validated_data['asset_code'],
            "amount" => $validated_data['transfer_value'],
            "fromPrivateKey" => $source_user_asset_wallet->blockchain_private_key,
        ];
          
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: " . $this->x_api_key,
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => $this->supported_assets[$validated_data['code']]['transaction_url'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        $response = curl_exec($curl);
        $error = curl_error($curl);

        curl_close($curl);

        if ($error) {
            return abort($error->statusCode, $error->message);
        } else {
            return response()->json( json_decode($response) );
        }
    }

    
}
