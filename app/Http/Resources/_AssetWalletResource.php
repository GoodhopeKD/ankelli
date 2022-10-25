<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class _AssetWalletResource extends JsonResource
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
                'usable_balance_asset_value' => $this->usable_balance_asset_value,
                'total_balance_asset_value' => $this->total_balance_asset_value,
                '_status' => $this->_status,
                'asset_wallet_addresses' => $this->asset_wallet_addresses_f(),
            ]), static function($var) { return $var !== null; });
    }
}
