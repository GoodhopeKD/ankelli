<?php

namespace App\Http\Controllers\API\Tatum\Security;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class MaliciousAddressConroller extends Controller
{
    /**
     * Check malicous address
     * https://apidoc.tatum.io/tag/Malicious-address#operation/CheckMalicousAddress
     * Supported Chains: ETH, BTC, LTC
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function CheckMalicousAddress(Request $request)
    {
        $validated_data = $request->validate([
            'address' => ['required', 'string'],
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_'.env('BC_ENV').'_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/security/address/".$validated_data['address'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }
}
