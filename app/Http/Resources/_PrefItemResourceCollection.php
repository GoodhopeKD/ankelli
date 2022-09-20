<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class _PrefItemResourceCollection extends ResourceCollection
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

                    /* Parent identifiers used to pull entries so no need to send them again */

                    'id' => $_this->id,
                    //'parent_table' => $_this->parent_table,
                    //'parent_uid' => $_this->parent_uid,
                    'key_name' => $_this->key_name,
                    'key_slug' => $_this->key_slug,
                    'value' => $_this->value_f(),
                    'value_type' => $_this->value_type,
                    
                    //'creator_username'      => $_this->creator_username,
                    //'created_datetime'      => $_this->created_datetime,
                    //'updated_datetime'      => $_this->updated_datetime,
                ], static function($var){ return $var !== null;} );
            }),
        ];

    }
}
