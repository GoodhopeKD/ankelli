<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    protected function ttm_cURL_call_tail($curl)
    {
        $response = curl_exec($curl);
        $error_message = curl_error($curl);
        $error_code = 0;
        if ($error_message) $error_code = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        curl_close($curl);
        $decoded_response = ($error_message) ? (object)['statusCode' => $error_code !== 0 ? $error_code : 422, 'message' => $error_message ] : json_decode($response);
        if ( isset($decoded_response->statusCode) && $decoded_response->statusCode !== 200 ) return abort($decoded_response->statusCode, $decoded_response->message);
        return \Response::json( $decoded_response, isset($decoded_response->statusCode) && $decoded_response->statusCode !== 200 ? $decoded_response->statusCode : 200 );
    }
}
