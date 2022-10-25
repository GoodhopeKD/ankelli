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
        'unit',
        'chain',
        'xpub',

        'gp_owner_bc_address',
        'ttm_gp_chain_addresses_storage',
        'ttm_gp_calculated_batch_addresses',
        'ttm_gp_last_calculated_index',
        'ttm_gp_last_activated_index',

        'smallest_display_unit',
        'withdrawal_txn_fee_usd_fctr',
        'withdrawal_min_limit',
        'withdrawal_max_limit',
        'usd_asset_exchange_rate',
        'centralization_threshold',
        'onchain_disclaimer',
        'bc_txn_id_scan_url',
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
        'ttm_gp_chain_addresses_storage',
        'ttm_gp_calculated_batch_addresses',
        'ttm_gp_last_calculated_index',
        'ttm_gp_last_activated_index',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'ttm_gp_chain_addresses_storage' => 'boolean',
        'ttm_gp_calculated_batch_addresses' => 'array',
        //'smallest_display_unit' => 'float',
        //'withdrawal_txn_fee_usd_fctr' => 'float',
        //'withdrawal_min_limit' => 'float',
        //'withdrawal_max_limit' => 'float',
        //'usd_asset_exchange_rate' => 'float',
        //'centralization_threshold' => 'float',
    ];

    /**
     * Get the logs associated with the extension.
     */
    public function logs()
    {
        return $this->hasMany(_Log::class, 'entry_uid')->where('entry_table', '__assets');
    }
}
