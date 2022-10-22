<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class _TradeResourceCollection extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'data' => $this->collection->transform(function($_this){
                return array_filter([
                    'ref_code' => $_this->ref_code,
                    'country_name' => $_this->country_name,
                    'location' => $_this->location,
                    'was_offer_to' => $_this->was_offer_to,
                    'asset_code' => $_this->asset_code,
                    'asset_value' => $_this->asset_value,
                    'currency_code' => $_this->currency_code,
                    'currency_amount' => $_this->currency_amount,
                    'offer_price' => $_this->offer_price,
                    'buyer_cmplt_trade_mins_tmt' => $_this->buyer_cmplt_trade_mins_tmt,
                    'pymt_method_slug' => $_this->pymt_method_slug,
                    'buyer_opened_datetime' => $_this->buyer_opened_datetime,
                    'closed_datetime' => $_this->closed_datetime,
                    '_status' => $_this->_status,
                    'offer_creator_username' => $_this->offer_creator_username,
                    'created_datetime' => $_this->created_datetime,
                    'creator_username' => $_this->creator_username,

                    'peer_rating' => $_this->peer_rating_f(),
                    'peer_trades_as_buyer_stats' => $_this->peer_trades_as_buyer_stats_f(),
                    'progress' => $_this->progress_f(),
                    'mins_remaining' => $_this->mins_remaining_f(),
                    'completion_review_on_trade_creator' => $_this->completion_review_on_trade_creator_f(),
                    'completion_review_on_offer_creator' => $_this->completion_review_on_offer_creator_f(),
                    'last_activity_datetime' => $_this->last_activity_datetime_f(),
                ], static function($var){ return $var !== null; });
            }),
        ];
    }
}
