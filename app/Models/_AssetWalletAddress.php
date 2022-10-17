<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Http\Request;

class _AssetWalletAddress extends Model
{
    const CREATED_AT = null;
    const UPDATED_AT = null;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        //'ttm_derivation_key',
        'user_username',
        'bc_address',
        'asset_code',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        //'ttm_derivation_key',
    ];

    private $ETH_USDT_FCTR = 1000;
    private $TRX_USDT_FCTR = 10;

    public function balance_f()
    {
        $balance = null;
        if ( _PrefItem::firstWhere('key_slug', 'use_ttm_api')->value_f() ){
            switch ($this->asset_code) {
                case 'ETH':
                    if ( in_array( $this->user_username, ['reserves', 'gaspump'] ) ){
                        $balance = (new \App\Http\Controllers\API\Tatum\Blockchain\EthereumController)->EthGetBalance(new Request(['address' => $this->bc_address]))->getData()->balance;
                        $asset = _Asset::firstWhere('code', $this->asset_code);
                        if ( $asset->chain === 'ETH' && $asset->code === 'ETH' && $asset->unit === 'USDT' ) $balance *= $this->ETH_USDT_FCTR;
                    }
                    break;
                case 'TRON':
                    if ( in_array( $this->user_username, ['reserves', 'gaspump'] ) ){
                        try {
                            $balance = (new \App\Http\Controllers\API\Tatum\Blockchain\TronController)->TronGetAccount(new Request(['address' => $this->bc_address]))->getData()->balance/1000000;
                            $asset = _Asset::firstWhere('code', $this->asset_code);
                            if ( $asset->chain === 'TRON' && $asset->code === 'TRON' && $asset->unit === 'USDT' ) $balance *= $this->TRX_USDT_FCTR;
                        } catch (\Throwable $th) {}
                    }
                    break;
            }
        }
        return $balance;
    }
}
