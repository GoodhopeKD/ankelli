<?php

namespace App\Http\Controllers\API\Tatum\VirtualAccounts;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class TransactionController extends Controller
{
    /**
     * Send payment
     * https://apidoc.tatum.io/tag/Transaction#operation/sendTransaction
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function sendTransaction(Request $request)
    {
        $validated_data = $request->validate([
            'senderAccountId' => ['required', 'string', 'size:24'],
            'recipientAccountId' => ['required', 'string', 'size:24'],
            'amount' => ['required', 'string', 'max:38'],
            'recipientNote' => ['required', 'string', 'max:500'],
            'senderNote' => ['required', 'string', 'max:500'],
        ]);

        $payload = $validated_data;
        
        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: ".env('TATUM_'.env('BC_ENV').'_API_KEY'),
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/transaction",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Find transactions within the ledger
     * https://apidoc.tatum.io/tag/Transaction#operation/getTransactions
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function getTransactions(Request $request)
    {
        $validated_data = $request->validate([
            'account' => ['nullable', 'string', 'size:24'],
            'counterAccount' => ['nullable', 'string', 'size:24'],
            'currency' => ['nullable', 'string', 'max:50'],

            'opType' => ['nullable', 'string'],
            'transactionType' => ['nullable', 'string'],

            'from' => ['nullable', 'integer'],
            'to' => ['nullable', 'integer'],

            'pageSize' => ['nullable', 'integer', 'max:50'],
            'offset' => ['nullable', 'integer'],
        ]);

        $payload = $validated_data;

        $query_params = [
            'pageSize' => $validated_data['pageSize'] ?? 50,
            'offset' => $validated_data['offset'] ?? 0,
        ];
        
        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: ".env('TATUM_'.env('BC_ENV').'_API_KEY'),
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/transaction/ledger?".http_build_query($query_params),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Find transactions for account
     * https://apidoc.tatum.io/tag/Transaction#operation/getTransactionsByAccountId
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function getTransactionsByAccountId(Request $request)
    {
        $validated_data = $request->validate([
            'id' => ['required', 'string', 'size:24'],
            'currency' => ['nullable', 'string', 'max:50'],
            
            'opType' => ['nullable', 'string'],
            'transactionType' => ['nullable', 'string'],

            'from' => ['nullable', 'integer'],
            'to' => ['nullable', 'integer'],

            'pageSize' => ['nullable', 'integer', 'max:50'],
            'offset' => ['nullable', 'integer'],
        ]);

        $payload = $validated_data;

        $query_params = [
            'pageSize' => $validated_data['pageSize'] ?? 50,
            'offset' => $validated_data['offset'] ?? 0,
        ];
        
        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: ".env('TATUM_'.env('BC_ENV').'_API_KEY'),
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/transaction/account?".http_build_query($query_params),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

}
