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
            'rating' => $this->rating_f(),
            'completion_rate' => $this->completion_rate_f(),
            'asset_wallets' => $this->asset_wallets_f(),
            'user_group_memberships' => $this->user_group_memberships_f(),
            'active_user_group_membership_slugs' => $this->active_user_group_membership_slugs_f(),
        ]), static function($var){ return $var !== null;} );
    }
}
