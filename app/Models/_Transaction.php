<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class _Transaction extends Model
{
    use SoftDeletes;

    const CREATED_AT = 'transfer_datetime';
    const UPDATED_AT = null;
    const DELETED_AT = 'deleted_datetime';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'ref_code',
        'txcontext',
        'blockchain_txid',
        'tatum_reference',
        'session_token',
        'description',
        'operation_slug',
        'source_user_username',
        'source_blockchain_address',
        'destination_user_username',
        'destination_blockchain_address',
        'asset_code',
        'transfer_asset_value',
        'transfer_result',
        'transfer_datetime',
    ];
    public $incrementing = false;
    protected $primaryKey = 'ref_code';
    protected $keyType = 'string';

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'blockchain_txid',
        'tatum_reference',
    ];
    
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'transfer_asset_value' => 'float',
        'transfer_result' => 'array',
    ];
}
