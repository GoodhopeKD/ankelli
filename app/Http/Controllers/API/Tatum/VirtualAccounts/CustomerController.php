<?php

namespace App\Http\Controllers\API\Tatum\VirtualAccounts;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CustomerController extends Controller
{
    /**
     * List all customers
     * https://apidoc.tatum.io/tag/Customer#operation/findAllCustomers
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function findAllCustomers(Request $request)
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
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/customer?".http_build_query($query_params),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Get customer details
     * https://apidoc.tatum.io/tag/Customer#operation/getCustomerByExternalOrInternalId
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function getCustomerByExternalOrInternalId(Request $request)
    {
        $validated_data = $request->validate([
            'id' => ['required', 'string', 'max:100'], // Customer external or internal ID
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/customer/".$validated_data['id'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Update customer
     * https://apidoc.tatum.io/tag/Customer#operation/updateCustomer
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function updateCustomer(Request $request)
    {
        $validated_data = $request->validate([
            'id' => ['required', 'string', 'max:50'], // Customer internal ID
            'externalId' => ['nullable', 'string', 'max:100'],
            'accountingCurrency' => ['nullable', 'string', 'max:3'],
            'customerCountry' => ['nullable', 'string', 'max:2'],
            'providerCountry' => ['nullable', 'string', 'max:2'],
        ]);

        $payload = $validated_data;

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ledger/customer/".$validated_data['id'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "PUT",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

}
