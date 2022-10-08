<?php

namespace App\Http\Controllers\API\Tatum\Security;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CustodialManagedWalletController extends Controller
{
    /**
     * Get pending transactions to sign
     * https://apidoc.tatum.io/tag/Key-Management-System#operation/ReceivePendingTransactionsToSign
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function ReceivePendingTransactionsToSign(Request $request)
    {
        $validated_data = $request->validate([
            'chain' => ['required', 'string', 'max:24'],
        ]);

        $payload = [];

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/kms/pending/".$validated_data['chain'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Create managed address
     * https://apidoc.tatum.io/tag/Custodial-managed-wallets#operation/CustodialCreateWallet
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function CustodialCreateWallet(Request $request)
    {
        $validated_data = $request->validate([
            'chain' => ['required', 'string'],
        ]);

        $payload = $validated_data;

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/custodial/wallet",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Get managed addresses
     * https://apidoc.tatum.io/tag/Custodial-managed-wallets#operation/CustodialGetWallets
     *
     * @return \Illuminate\Http\Response
     */
    public function CustodialGetWallets(Request $request)
    {
        $validated_data = $request->validate([
            'pageSize' => ['nullable', 'integer', 'max:50'],
            'offset' => ['nullable', 'integer'],
        ]);

        $query_params = [
            'pageSize' => $validated_data['pageSize'] ?? 50,
            'offset' => $validated_data['offset'] ?? 0,
        ];

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/custodial/wallet?".http_build_query($query_params),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Get managed address
     * https://apidoc.tatum.io/tag/Custodial-managed-wallets#operation/CustodialGetWallet
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function CustodialGetWallet(Request $request)
    {
        $validated_data = $request->validate([
            'id' => ['required', 'string'],
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/custodial/wallet/".$validated_data['id'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Delete managed address
     * https://apidoc.tatum.io/tag/Custodial-managed-wallets#operation/CustodialDeleteWallet
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function CustodialDeleteWallet(Request $request)
    {
        $validated_data = $request->validate([
            'id' => ['required', 'string'],
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/custodial/wallet/".$validated_data['id'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "DELETE",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }
}
