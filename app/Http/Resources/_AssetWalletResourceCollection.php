<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class _AssetWalletResourceCollection extends ResourceCollection
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
                    'user_username' => $_this->user_username,
                    'asset_code' => $_this->asset_code,
                    'asset_value' => $_this->asset_value,
                    '_status' => $_this->_status,
                    
                    //'created_datetime'      => $_this->created_datetime,
                    //'updated_datetime'      => $_this->updated_datetime,
                ], static function($var){ return $var !== null;} );
            }),
        ];
    }
}
