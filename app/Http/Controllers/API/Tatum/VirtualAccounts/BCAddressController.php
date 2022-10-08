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

}
