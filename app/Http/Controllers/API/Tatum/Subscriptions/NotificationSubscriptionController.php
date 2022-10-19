<?php

namespace App\Http\Controllers\API\Tatum\Subscriptions;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class NotificationSubscriptionController extends Controller
{
    /**
     * Create a subscription
     * https://apidoc.tatum.io/tag/Notification-subscriptions#operation/createSubscription
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function createSubscription(Request $request)
    {
        $validated_data = $request->validate([
            'type' => ['required', 'string'],
            'attr' => ['required', 'array'],
            'attr.id' => ['sometimes', 'string', 'size:24'], // Virtual Account ID
            'attr.address' => ['sometimes', 'string', 'between:13,128'],
            'attr.chain' => ['sometimes', 'string', Rule::in(["SOL","ETH","MATIC","CELO","KLAY","BTC","LTC","BCH","DOGE","TRON","BSC"])],
            'attr.url' => ['required', 'string', 'max:500'],
        ]);

        $payload = $validated_data;
        
        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "Content-Type: application/json",
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_POSTFIELDS => json_encode($payload),
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/subscription",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "POST",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * List all active subscriptions
     * https://apidoc.tatum.io/tag/Notification-subscriptions#operation/getSubscriptions
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function getSubscriptions(Request $request)
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
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/subscription?".http_build_query($query_params),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * Cancel existing subscription
     * https://apidoc.tatum.io/tag/Notification-subscriptions#operation/deleteSubscription
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function deleteSubscription(Request $request)
    {
        $validated_data = $request->validate([
            'id' => ['required', 'string'], // Subscription ID
        ]);

        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_HTTPHEADER => [
                "x-api-key: ".env('TATUM_X_API_KEY'),
            ],
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/subscription/".$validated_data['id'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "DELETE",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }

    /**
     * List all executed webhooks
     * https://apidoc.tatum.io/tag/Notification-subscriptions#operation/getAllWebhooks
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function getAllWebhooks(Request $request)
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
            CURLOPT_URL => "https://api-eu1.tatum.io/v3/subscription/webhook?".http_build_query($query_params),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);

        return $this->ttm_cURL_call_tail($curl);
    }
}
