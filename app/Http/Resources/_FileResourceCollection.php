<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class _FileResourceCollection extends ResourceCollection
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
                    'id'                    => $_this->id,
                    //'parent_table'          => $_this->parent_table,
                    //'parent_uid'            => $_this->parent_uid,
                    //'filegroup'             => $_this->filegroup,
                    //'tag'                   => $_this->tag,
                    'title'                 => $_this->title,
                    'width'                 => $_this->width,
                    'height'                => $_this->height,
                    'uri'                   => str_replace( "ankelli.com", env('MIX_DOMAIN_NAME') ,$_this->uri ),
                    //'type'                  => $_this->type,
                    //'filesize'              => $_this->filesize,
                    //'original_filename'     => $_this->original_filename,
                    //'order_index'           => $_this->order_index,

                    //'creator_username'      => $_this->creator_username,
                    //'created_datetime'      => $_this->created_datetime,
                    //'updated_datetime'      => $_this->updated_datetime,
                ], static function($var){ return $var !== null; } );
            }),
        ];
    }
}
