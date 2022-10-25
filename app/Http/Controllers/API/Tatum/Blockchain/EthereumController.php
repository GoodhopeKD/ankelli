<?php

namespace App\Http\Controllers\API\Tatum\Blockchain;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class EthereumController extends Controller
{
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
            'index' => ['required', 'integer', 'between:0,2147483647'],
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_'.env('BC_ENV').'_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ethereum/address/".$validated_data['xpub']."/".$validated_data['index'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Generate Ethereum private key
     * https://apidoc.tatum.io/tag/Ethereum#operation/EthGenerateAddressPrivateKey
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function EthGenerateAddressPrivateKey(Request $request)
    {
        $validated_data = $request->validate([
            'mnemonic' => ['required', 'string', 'max:500'],
            'index' => ['required', 'integer', 'between:0,2147483647'],
        ]);

        $payload = $validated_data;

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: ".env('TATUM_'.env('BC_ENV').'_API_KEY'),
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ethereum/wallet/priv",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
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
                "x-api-key: ".env('TATUM_'.env('BC_ENV').'_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ethereum/account/balance/".$validated_data['address'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Get Ethereum Transaction
     * https://apidoc.tatum.io/tag/Ethereum#operation/EthGetTransaction
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function EthGetTransaction(Request $request)
    {
        $validated_data = $request->validate([
            'hash' => ['required', 'string'],
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_'.env('BC_ENV').'_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ethereum/transaction/".$validated_data['hash'],
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
            'index' => ['sometimes', 'integer', 'between:0,2147483647'],
            'fee' => ['sometimes', 'array'],
            'signatureId' => ['required', 'string'],
            'amount' => ['required', 'string', 'max:38'],
        ]);
        
        $payload = $validated_data;

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: ".env('TATUM_'.env('BC_ENV').'_API_KEY'),
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ethereum/transaction",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }
}
