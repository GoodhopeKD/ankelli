<?php

namespace App\Http\Controllers\API\Tatum\Blockchain;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class EthereumController extends Controller
{
    /**
     * Generate Ethereum wallet
     * https://apidoc.tatum.io/tag/Ethereum#operation/EthGenerateWallet
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function EthGenerateWallet(Request $request)
    {
        $validated_data = $request->validate([
            'mnemonic' => ['required', 'string', 'max:500'],
        ]);

        $query_params = [
            'mnemonic' => $validated_data['mnemonic'],
        ];

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ethereum/wallet?".http_build_query($query_params),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Generate Ethereum account address from Extended public key
     * https://apidoc.tatum.io/tag/Ethereum#operation/EthGenerateAddress
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function EthGenerateAddress(Request $request)
    {
        $validated_data = $request->validate([
            'xpub' => ['required', 'string', 'max:192'],
            'index' => ['required', 'integer', 'max:2147483647'],
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ethereum/address/".$validated_data['xpub']."/".$validated_data['index'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Get Ethereum account balance
     * https://apidoc.tatum.io/tag/Ethereum#operation/EthGetBalance
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function EthGetBalance(Request $request)
    {
        $validated_data = $request->validate([
            'address' => ['required', 'string'],
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ethereum/account/balance/".$validated_data['address']."?".http_build_query(['type' => 'testnet']),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Send Ethereum / ERC20 from account to account
     * https://apidoc.tatum.io/tag/Ethereum#operation/EthBlockchainTransfer
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function EthBlockchainTransfer(Request $request)
    {
        $validated_data = $request->validate([
            'to' => ['required', 'string', 'size:42'],
            'currency' => ['required', 'string', Rule::in(["USDT","LEO","LINK","UNI","FREE","GMC","GMC_BSC","RMD","MKR","USDC","BAT","TUSD","BUSD","PAX","PAXG","MMY","WBTC","XCON","ETH"])],
            'amount' => ['required', 'string', 'max:38'],
            'index' => ['sometimes', 'integer', 'max:2147483647'],
            'fee' => ['sometimes', 'array'],
        ]);

        $validated_data['signatureId'] = env('TATUM_KMS_ETH_WALLET_SIGNATURE_ID');

        $payload = $validated_data;

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ethereum/transaction",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }
}
