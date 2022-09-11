<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class _Transaction extends Model
{
    use SoftDeletes;

    const CREATED_AT = 'transfer_datetime';
    const UPDATED_AT = NULL;
    const DELETED_AT = 'deleted_datetime';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'ref_code',
        'blockchain_txid',
        'session_token',
        'description',
        'tr_type',
        'source_user_username',
        'destination_user_username',
        'asset_code',
        'transfer_value',
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
    ];
    
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'transfer_value' => 'float',
        'transfer_result' => 'array',
        'transfer_datetime' => 'datetime',
    ];
}
