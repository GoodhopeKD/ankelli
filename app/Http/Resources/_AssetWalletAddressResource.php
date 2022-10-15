<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class _AssetWalletAddressResource extends JsonResource
{
    protected $with_balance = null;

    public function with_balance(bool $value){
        $this->with_balance = $value;
        return $this;
    }

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
                'balance' => $this->with_balance ? $this->balance_f() : null,
            ]), static function($var){ return $var !== null;} );
    }
}
