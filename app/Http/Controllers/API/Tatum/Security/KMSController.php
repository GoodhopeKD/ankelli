<?php

namespace App\Http\Controllers\API\Tatum\Security;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class KMSController extends Controller
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
     * Complete pending transaction to sign
     * https://apidoc.tatum.io/tag/Key-Management-System#operation/CompletePendingSignature
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function CompletePendingSignature(Request $request)
    {
        $validated_data = $request->validate([
            'id' => ['required', 'string', 'size:24'],
            'txId' => ['required', 'string', 'between:10,80'],
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/kms/".$validated_data['id']."/".$validated_data['txId'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "PUT",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Delete transaction
     * https://apidoc.tatum.io/tag/Key-Management-System#operation/DeletePendingTransactionToSign
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function DeletePendingTransactionToSign(Request $request)
    {
        $validated_data = $request->validate([
            'id' => ['required', 'string', 'size:24'], // Transaction ID
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/kms/".$validated_data['id'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "DELETE",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }
}
