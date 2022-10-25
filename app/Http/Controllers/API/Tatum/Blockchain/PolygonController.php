<?php

namespace App\Http\Controllers\API\Tatum\Blockchain;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class EthereumController extends Controller
{
    /**
     * Generate Polygon account address from Extended public key
     * https://apidoc.tatum.io/tag/Polygon#operation/PolygonGenerateAddress
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function PolygonGenerateAddress(Request $request)
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
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/polygon/address/".$validated_data['xpub']."/".$validated_data['index'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Generate Polygon private key
     * https://apidoc.tatum.io/tag/Polygon#operation/PolygonGenerateAddressPrivateKey
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function PolygonGenerateAddressPrivateKey(Request $request)
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
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/polygon/wallet/priv",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }


    /**
     * Get Polygon Account balance
     * https://apidoc.tatum.io/tag/Polygon#operation/PolygonGetBalance
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function PolygonGetBalance(Request $request)
    {
        $validated_data = $request->validate([
            'address' => ['required', 'string'],
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_'.env('BC_ENV').'_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/polygon/account/balance/".$validated_data['address'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Get Polygon Transaction
     * https://apidoc.tatum.io/tag/Polygon#operation/PolygonGetTransaction
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function PolygonGetTransaction(Request $request)
    {
        $validated_data = $request->validate([
            'hash' => ['required', 'string'],
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_'.env('BC_ENV').'_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/polygon/transaction/".$validated_data['hash'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Send MATIC from account to account
     * https://apidoc.tatum.io/tag/Polygon#operation/PolygonBlockchainTransfer
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function PolygonBlockchainTransfer(Request $request)
    {
        $validated_data = $request->validate([
            'to' => ['required', 'string', 'size:42'],
            'currency' => ['required', 'string', Rule::in(["BETH","BBTC","BADA","WMATIC","BDOT","BXRP","BLTC","BBCH","MATIC"])],
            'amount' => ['required', 'string', 'max:38'],
            'fee' => ['sometimes', 'array'],
            'signatureId' => ['required', 'string'],
            'index' => ['sometimes', 'integer', 'between:0,2147483647'],
        ]);

        $payload = $validated_data;

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: ".env('TATUM_'.env('BC_ENV').'_API_KEY'),
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/polygon/transaction",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }
}
