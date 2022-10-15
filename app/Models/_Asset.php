<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _Asset extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = 'updated_datetime';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'code',
        'fe_asset_code',
        'chain',
        'xpub',
        'smallest_display_unit',
        'withdrawal_txn_fee_usd_fctr',
        'withdrawal_min_limit_usd_fctr',
        'withdrawal_max_limit_usd_fctr',
        'usd_asset_exchange_rate',
        'onchain_disclaimer',
        '_status',
        'creator_username',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'xpub',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        //'smallest_display_unit' => 'float',
        //'withdrawal_txn_fee_usd_fctr' => 'float',
        //'usd_asset_exchange_rate' => 'float',
    ];

    /**
     * Get the logs associated with the extension.
     */
    public function logs()
    {
        return $this->hasMany( _Log::class, 'entry_uid' )->where('entry_table', '__assets');
    }
}
