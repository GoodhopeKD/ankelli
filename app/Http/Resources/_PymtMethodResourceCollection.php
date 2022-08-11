<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class _PymtMethodResourceCollection extends ResourceCollection
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
                    'slug' => $_this->slug,
                    'details_required' => $_this->details_required,
                    'icon' => $_this->icon_f(),
                    '_status' => $_this->_status,
                    
                    //'creator_username'      => $_this->creator_username,
                    //'created_datetime'      => $_this->created_datetime,
                    //'updated_datetime'      => $_this->updated_datetime,
                ], static function($var){ return $var !== null;} );
            }),
        ];
    }
}
