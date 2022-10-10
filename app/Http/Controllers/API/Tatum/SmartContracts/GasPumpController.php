<?php

namespace App\Http\Controllers\API\Tatum\SmartContracts;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class GasPumpController extends Controller
{
    /**
     * Precalculate gas pump addresses
     * https://apidoc.tatum.io/tag/Gas-pump#operation/PrecalculateGasPumpAddresses
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function PrecalculateGasPumpAddresses(Request $request)
    {
        $validated_data = $request->validate([
            'chain' => ['required', 'string', Rule::in(["BSC","CELO","ETH","MATIC","KLAY","ONE","TRON"])],
            'owner' => ['required', 'string', 'between:13,128'],
            'from' => ['required', 'numeric', 'min:0'],
            'to' => ['required', 'numeric', 'min:0'],
        ]);

        $payload = $validated_data;

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/gas-pump",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Activate gas pump addresses
     * https://apidoc.tatum.io/tag/Gas-pump#operation/ActivateGasPumpAddresses
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function ActivateGasPumpAddresses(Request $request)
    {
        $validated_data = $request->validate([
            'chain' => ['required', 'string', Rule::in(["BSC","ETH","KLAY","MATIC","ONE","TRON"])],
            'owner' => ['required', 'string', 'between:13,128'],
            'from' => ['required', 'integer', 'min:0'],
            'to' => ['required', 'integer', 'min:0'],
            //'feeLimit' => ['required_if:chain,=,TRON', 'numeric', 'min:0'],
            //'index' => ['required', 'integer', 'min:0'],
            //'signatureId' => ['required', 'string'],
        ]);

        if ( $validated_data['chain'] === 'TRON' ) $validated_data['feeLimit'] = 200;
        $validated_data['signatureId'] = env('TATUM_KMS_ETH_SIGNATURE_ID');

        $payload = $validated_data;

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/gas-pump/activate",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Get the results of the address activation transaction
     * https://apidoc.tatum.io/tag/Gas-pump#operation/ActivatedNotActivatedGasPumpAddresses
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function ActivatedNotActivatedGasPumpAddresses(Request $request)
    {
        $validated_data = $request->validate([
            'chain' => ['required', 'string', Rule::in(["BSC","CELO","ETH","KLAY","MATIC","ONE","TRON"])],
            'owner' => ['required', 'string', 'between:13,128'],
            'index' => ['required', 'numeric', 'min:0'],
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/gas-pump/activated/".$validated_data['chain']."/".$validated_data['owner']."/".$validated_data['index'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Check whether the gas pump address with a specified index is activated
     * https://apidoc.tatum.io/tag/Gas-pump#operation/GasPumpAddressesActivatedOrNot
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function GasPumpAddressesActivatedOrNot(Request $request)
    {
        $validated_data = $request->validate([
            'chain' => ['required', 'string', Rule::in(["BSC","CELO","ETH","KLAY","MATIC","ONE","TRON"])],
            'txId' => ['required', 'string', 'between:10,80'],
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/gas-pump/address/".$validated_data['chain']."/".$validated_data['txId'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

}
