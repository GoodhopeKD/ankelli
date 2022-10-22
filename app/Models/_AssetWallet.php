<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Http\Resources\_AssetWalletAddressResourceCollection;

class _AssetWallet extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = 'updated_datetime';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'ttm_virtual_account_id',
        'ttm_subscription_id',
        'user_username',
        'asset_code',
        'asset_chain',
        'usable_balance_asset_value',
        'total_balance_asset_value',
        '_status',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'ttm_virtual_account_id',
        'ttm_subscription_id',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        //'usable_balance_asset_value' => 'float',
        //'total_balance_asset_value' => 'float',
    ];

    /**
     * Get the asset_wallet_addresses associated with the extension.
     */
    public function asset_wallet_addresses()
    {
        return $this->hasMany(_AssetWalletAddress::class, 'asset_code', 'asset_code')->where('user_username', $this->user_username);
    }

    /**
     * Get the logs associated with the extension.
     */
    public function logs()
    {
        return $this->hasMany(_Log::class, 'entry_uid')->where('entry_table', '__asset_wallets');
    }

    public function asset_wallet_addresses_f()
    {
        return count($this->asset_wallet_addresses) ? json_decode((new _AssetWalletAddressResourceCollection($this->asset_wallet_addresses))->toJson(),true)['data']: [];
    }
}
