<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class _AssetAccountAddress extends Model
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
        'asset_account_id',
        'user_username',
        'blockchain_address',
        'tatum_derivation_key',
        'onchain_txcount',
        'last_active_datetime',
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
