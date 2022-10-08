<?php

namespace App\Http\Controllers\API\Tatum\Blockchain;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class TronController extends Controller
{
    /**
     * Generate a TRON wallet
     * https://apidoc.tatum.io/tag/Tron#operation/GenerateTronwallet
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function GenerateTronwallet(Request $request)
    {
        $validated_data = $request->validate([
            'mnemonic' => ['required', 'string', 'max:500'],
        ]);

        $query_params = [
            'mnemonic' => $validated_data['mnemonic'],
        ];

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/tron/wallet?".http_build_query($query_params),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }
}
