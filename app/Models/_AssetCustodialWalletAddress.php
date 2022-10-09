<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class _AssetCustodialWalletAddress extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = null;
    const DELETED_AT = 'deleted_datetime';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'asset_code',
        'blockchain_address',
        'ttm_wallet_id',
        //'ttm_subscription_id',
        'onchain_txn_count',
        'last_active_datetime',

        'ttm_gp_address',
        'ttm_gp_index_from',
        'ttm_gp_index_to',
        'ttm_gp_trx_fee_limit',
        'ttm_gp_actvxn_txn_id',

        'creator_username',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'last_active_datetime' => 'datetime',
    ];
}
