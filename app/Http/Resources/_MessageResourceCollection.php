<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class _MessageResourceCollection extends ResourceCollection
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
                    'creator_avatar_image_id' => $_this->creator_avatar_image_id_f(),
                    'attachment' => $_this->attachment_f(),
                    'parent_table' => null,
                    'parent_uid' => null,
                ]), static function($var){ return $var !== null; });
            }),
        ];
    }
}
