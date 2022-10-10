<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class _AssetCustodialWalletAddress extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = 'updated_datetime';
    const DELETED_AT = 'deleted_datetime';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'asset_chain',
        'blockchain_address',
        'ttm_wallet_id',
        'ttm_subscription_id',
        'ttm_activated_unused_gp_addresses',
        'ttm_activated_unused_gp_addresses_offset_index',
        'ttm_last_gp_addresses_activation_txn_signature_id',
        'creator_username',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'ttm_activated_unused_gp_addresses',
        'ttm_subscription_id',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'ttm_activated_unused_gp_addresses' => 'array',
    ];
}
