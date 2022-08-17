<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class _UserResource extends JsonResource
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
            'asset_accounts' => $this->asset_accounts_f(),
        ]), static function($var){ return $var !== null;} );
    }
}
