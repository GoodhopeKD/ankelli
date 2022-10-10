<?php

namespace App\Http\Controllers\API\Tatum\Utils;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ExchangeRateController extends Controller
{
    /**
     * Get currenct exchange rate of the supported FIAT / crypto asset
     * https://apidoc.tatum.io/tag/Exchange-rate#operation/getExchangeRate
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function getExchangeRate(Request $request)
    {
        $validated_data = $request->validate([
            'currency' => ['required', 'string', 'max:30'],
            'basePair' => ['required', 'string', 'max:30'],
        ]);

        $query_params = [
            'basePair' => $validated_data['basePair'],
        ];

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/tatum/rate/".$validated_data['currency']."?".http_build_query($query_params),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);
        return $this->ttm_cURL_call_tail($curl);
    }
}
