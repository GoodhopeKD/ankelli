<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _Transaction extends Model
{
    const CREATED_AT = 'transfer_datetime';
    const UPDATED_AT = 'updated_datetime';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'ref_code',

        'ttm_reference',
        'ttm_bc_txn_signature_id',
        'ttm_centralization_factor',
        'ttm_amount_blockage_id',
        'asset_value_escrowed',
        'bc_txn_id',

        'session_token',
        'operation_slug',
        'failure_note',
        '_status',

        'sender_bc_address',
        'sender_username',
        'sender_note',

        'recipient_bc_address',
        'recipient_username',
        'recipient_note',

        'asset_code',
        'asset_value',

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
        'ttm_reference',
        'ttm_bc_txn_signature_id',
        'ttm_amount_blockage_id',
        'session_token',
    ];
    
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        //'asset_value' => 'float',
        'transfer_result' => 'array',
    ];
}
