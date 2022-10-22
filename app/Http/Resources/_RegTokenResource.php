<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class _RegTokenResource extends JsonResource
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
                'use_count' => count($this->users),
            ]), static function($var){ return $var !== null; });
    }
}
