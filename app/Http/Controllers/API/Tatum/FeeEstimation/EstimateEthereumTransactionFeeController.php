<?php

namespace App\Http\Controllers\API\Tatum\FeeEstimation;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class EstimateEthereumTransactionFeeController extends Controller
{
    /**
     * Estimate Ethereum transaction fees
     * https://apidoc.tatum.io/tag/Blockchain-fees#operation/EthEstimateGas
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function EthEstimateGas(Request $request)
    {
        $validated_data = $request->validate([
            'from' => ['required', 'string', 'size:42'],
            'to' => ['required', 'string', 'size:42'],
            'contractAddress' => ['sometimes', 'string', 'size:42'],
            'amount' => ['required', 'string', 'max:38'],
        ]);

        $payload = $validated_data;

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/ethereum/gas",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }
}
