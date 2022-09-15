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
        'blockchain_address',
        'tatum_derivation_key',
        'last_active_datetime',
    ];
}
