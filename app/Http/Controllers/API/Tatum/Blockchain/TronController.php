<?php

namespace App\Http\Controllers\API\Tatum\Blockchain;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class TronController extends Controller
{
    /**
     * Generate a TRON address from the wallet's extended public key
     * https://apidoc.tatum.io/tag/Tron#operation/TronGenerateAddress
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function TronGenerateAddress(Request $request)
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
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/tron/address/".$validated_data['xpub']."/".$validated_data['index'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Generate the private key for a TRON address
     * https://apidoc.tatum.io/tag/Tron#operation/TronGenerateAddressPrivateKey
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function TronGenerateAddressPrivateKey(Request $request)
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
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/tron/wallet/priv",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Get the TRON account by its address
     * https://apidoc.tatum.io/tag/Tron#operation/TronGetAccount
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function TronGetAccount(Request $request)
    {
        $validated_data = $request->validate([
            'address' => ['required', 'string'],
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_'.env('BC_ENV').'_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/tron/account/".$validated_data['address'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Freeze the balance of a TRON account
     * https://apidoc.tatum.io/tag/Tron#operation/TronFreeze
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function TronFreeze(Request $request)
    {
        $validated_data = $request->validate([
            'from' => ['required', 'string', 'size:34'],
            'receiver' => ['required', 'string', 'size:34'],
            'duration' => ['required', 'integer', 'min:3'],
            'resource' => ['required', 'string', Rule::in(['BANDWIDTH','ENERGY'])],
            'amount' => ['required', 'string', 'max:38'],
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
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/tron/freezeBalance",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Send TRX to a TRON account
     * https://apidoc.tatum.io/tag/Tron#operation/TronTransfer
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function TronTransfer(Request $request)
    {
        $validated_data = $request->validate([
            'from' => ['required', 'string', 'size:34'],
            'to' => ['required', 'string', 'size:34'],
            'amount' => ['required', 'string', 'max:38'],
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
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/tron/transaction",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Send TRC-20 tokens to a TRON account
     * https://apidoc.tatum.io/tag/Tron#operation/TronTransferTrc20
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function TronTransferTrc20(Request $request)
    {
        $validated_data = $request->validate([
            'from' => ['required', 'string', 'size:34'],
            'to' => ['required', 'string', 'size:34'],
            'tokenAddress' => ['required', 'string', 'size:34'],
            'amount' => ['required', 'string', 'max:38'],
            'feeLimit' => ['required', 'integer', 'min:0'],
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
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/tron/transaction",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }
}
