<?php

namespace App\Http\Controllers\API\Tatum\VirtualAccounts;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class BCAddressController extends Controller
{
    /**
     * Get all deposit addresses for a virtual account
     * https://apidoc.tatum.io/tag/Blockchain-addresses#operation/getAllDepositAddresses
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function getAllDepositAddresses(Request $request)
    {
        $validated_data = $request->validate([
            'id' => ['required', 'string', 'size:24'], // Account ID
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/offchain/account/".$validated_data['id']."/address",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Create a deposit address for a virtual account.
     * https://apidoc.tatum.io/tag/Blockchain-addresses#operation/generateDepositAddress
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function generateDepositAddress(Request $request)
    {
        $validated_data = $request->validate([
            'id' => ['required', 'string', 'size:24'], // Account ID
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/offchain/account/".$validated_data['id']."/address",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Check whether a blockchain address is assigned to a virtual account
     * https://apidoc.tatum.io/tag/Blockchain-addresses#operation/addressExists
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function addressExists(Request $request)
    {
        $validated_data = $request->validate([
            'currency' => ['required', 'string'], 
            'address' => ['required', 'string'], 
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/offchain/account/address/".$validated_data['address']."/".$validated_data['currency'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Assign a blockchain address to a virtual account
     * https://apidoc.tatum.io/tag/Blockchain-addresses#operation/assignAddress
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function assignAddress(Request $request)
    {
        $validated_data = $request->validate([
            'id' => ['required', 'string', 'size:24'], // Account ID
            'address' => ['required', 'string'], 
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/offchain/account/".$validated_data['id']."/address/".$validated_data['address'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Remove a deposit address from a virtual account
     * https://apidoc.tatum.io/tag/Blockchain-addresses#operation/removeAddress
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function removeAddress(Request $request)
    {
        $validated_data = $request->validate([
            'id' => ['required', 'string', 'size:24'], // Account ID
            'address' => ['required', 'string'], 
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/offchain/account/".$validated_data['id']."/address/".$validated_data['address'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "DELETE",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

}
