<?php

namespace App\Http\Controllers\API\Tatum\Blockchain;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class EthereumController extends Controller
{
    /**
     * Generate Ethereum wallet
     * https://apidoc.tatum.io/tag/Ethereum#operation/EthGenerateWallet
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function EthGenerateWallet(Request $request)
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
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ethereum/wallet?".http_build_query($query_params),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }
}
