<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class _AssetWalletAddressResourceCollection extends ResourceCollection
{
    protected $with_balance = null;

    public function with_balance(bool $value){
        $this->with_balance = $value;
        return $this;
    }

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
                    'balance' => $this->with_balance ? $_this->balance_f() : null,
                ]), static function($var){ return $var !== null;} );
            }),
        ];
    }
}
