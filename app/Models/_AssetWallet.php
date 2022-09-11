<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

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
        'blockchain_id',
        'blockchain_address',
        'blockchain_private_key',
        'tatum_customer_id',
        'user_username',
        'asset_code',
        'asset_value',
        '_status',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'blockchain_id',
        'blockchain_address',
        'blockchain_private_key',
        'tatum_customer_id',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'asset_value' => 'float',
    ];

    /**
     * Get the logs associated with the extension.
     */
    public function logs()
    {
        return $this->hasMany( _Log::class, 'entry_uid' )->where('entry_table', '__asset_wallets');
    }
}