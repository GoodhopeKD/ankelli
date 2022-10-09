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
        'txn_context',
        'blockchain_txn_id',
        'tatum_unsigned_txn_signature_id',
        'ttm_reference',
        'session_token',
        'operation_slug',
        'sender_username',
        'sender_note',
        'source_blockchain_address',
        'recipient_username',
        'recipient_note',
        'destination_blockchain_address',
        'asset_code',
        'xfer_asset_value',
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
        'blockchain_txn_id',
        'tatum_unsigned_txn_signature_id',
        'ttm_reference',
    ];
    
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        //'xfer_asset_value' => 'float',
        'transfer_result' => 'array',
    ];
}
