<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class _CurrencyResourceCollection extends ResourceCollection
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
                    'id' => $_this->id,
                    'name' => $_this->name,
                    'code' => $_this->code,
                    'symbol' => $_this->symbol,
                    'symbol_before_number' => $_this->symbol_before_number,
                    'usd_rate' => $_this->usd_rate,
                    'min_transactable_cash_amount' => $_this->min_transactable_cash_amount,
                    'smallest_transactable_cash_denomination_amount' => $_this->smallest_transactable_cash_denomination_amount,
                    '_status' => $_this->_status,
                    
                    //'creator_username'      => $_this->creator_username,
                    //'created_datetime'      => $_this->created_datetime,
                    //'updated_datetime'      => $_this->updated_datetime,
                ], static function($var){ return $var !== null;} );
            }),
        ];
    }
}
