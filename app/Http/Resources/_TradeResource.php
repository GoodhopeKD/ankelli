<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class _TradeResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return array_filter(array_merge(
        parent::toArray($request), [
            'messages' => $this->messages_f(),
            'completion_review_on_trade_creator' => $this->completion_review_on_trade_creator_f(),
            'completion_review_on_offer_creator' => $this->completion_review_on_offer_creator_f(),
            'last_activity_datetime' => $this->last_activity_datetime_f(),
        ]), static function($var){ return $var !== null; } );
    }
}
