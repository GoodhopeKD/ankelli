<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class _OfferResourceCollection extends ResourceCollection
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
                return array_filter(array_merge(
                    is_array($_this->resource) ? $_this->resource: $_this->resource->toArray(), [
                    'creator_rating' => $_this->creator_rating_f(),
                    'creator_trades_as_buyer_stats' => $_this->creator_trades_as_buyer_stats_f(),
                    'created_datetime' => null,
                ]), static function($var){ return $var !== null; });
            }),
        ];
    }
}
