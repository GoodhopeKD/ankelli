<?php

namespace App\Http\Controllers\API\Tatum\VirtualAccounts;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class AccountController extends Controller
{
    /**
     * List all accounts
     * https://apidoc.tatum.io/tag/Account#operation/getAccounts
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function getAccounts(Request $request)
    {
        $validated_data = $request->validate([
            'pageSize' => ['nullable', 'integer', 'max:50'],
            'page' => ['nullable', 'integer'],
            'currency' => ['nullable', 'string'],
        ]);

        $query_params = [
            'pageSize' => $validated_data['pageSize'] ?? 50,
            'page' => $validated_data['page'] ?? 0,
            'currency' => $validated_data['currency'] ?? null,
        ];

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/account?".http_build_query($query_params),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * List all customer accounts
     * https://apidoc.tatum.io/tag/Account#operation/getAccountsByCustomerId
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function getAccountsByCustomerId(Request $request)
    {
        $validated_data = $request->validate([
            'id' => ['required', 'string'],
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
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/account/customer/".$validated_data['id']."?".http_build_query($query_params),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Create a new asset wallet on the tatum platform.
     * https://apidoc.tatum.io/tag/Account#operation/createAccount
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function createAccount(Request $request)
    {
        $validated_data = $request->validate([
            'one_of' => ['required', 'string', Rule::in(['createAccount','createAccountXpub'])],
            'currency' => ['required', 'string'],
            'externalId' => ['required', 'string', 'max:100'],
            'xpub' => ['required_if:one_of,=,createAccountXpub', 'string', 'max:192'],
            'accountingCurrency' => ['nullable', 'string', 'max:3'],
        ]);

        $payload = [
            "currency" => $validated_data['currency'],
            "xpub" => $validated_data['xpub'],
            "customer" => [
                "externalId" => $validated_data['externalId'],
                "accountingCurrency" => $validated_data['accountingCurrency'] ?? "USD",
            ],
            "accountingCurrency" => $validated_data['accountingCurrency'] ?? "USD",
        ];

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/account",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Get account by ID
     * https://apidoc.tatum.io/tag/Account#operation/getAccountByAccountId
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function getAccountByAccountId(Request $request)
    {
        $validated_data = $request->validate([
            'id' => ['required', 'string', 'size:24'],
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/account/".$validated_data['id'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Deactivate account
     * https://apidoc.tatum.io/tag/Account#operation/deactivateAccount
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function deactivateAccount(Request $request)
    {
        $validated_data = $request->validate([
            'id' => ['required', 'string', 'size:24'],
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/account/".$validated_data['id']."/deactivate",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "PUT",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Block an amount in an account
     * https://apidoc.tatum.io/tag/Account#operation/blockAmount
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function blockAmount(Request $request)
    {
        $validated_data = $request->validate([
            'id' => ['required', 'string', 'size:24'], // Account ID
            'amount' => ['required', 'string', 'max:38'],
            'type' => ['required', 'string', 'max:100'],
        ]);

        $payload = $validated_data;

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/account/block/".$validated_data['id'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Unblock a blocked amount in an account
     * https://apidoc.tatum.io/tag/Account#operation/deleteBlockAmount
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function deleteBlockAmount(Request $request)
    {
        $validated_data = $request->validate([
            'id' => ['required', 'string'], // Blockage ID
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/account/block/".$validated_data['id'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "DELETE",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Get blocked amounts in an account
     * https://apidoc.tatum.io/tag/Account#operation/getBlockAmount
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function getBlockAmount(Request $request)
    {
        $validated_data = $request->validate([
            'id' => ['required', 'string', 'size:24'], // Account ID
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
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/account/block/".$validated_data['id']."?".http_build_query($query_params),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Unblock all blocked amounts in an account
     * https://apidoc.tatum.io/tag/Account#operation/deleteAllBlockAmount
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function deleteAllBlockAmount(Request $request)
    {
        $validated_data = $request->validate([
            'id' => ['required', 'string', 'size:24'], // Account ID
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/account/block/account/".$validated_data['id'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "DELETE",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }
}
