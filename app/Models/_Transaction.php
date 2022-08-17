<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _Transaction extends Model
{
    const CREATED_AT = 'transfer_datetime';
    const UPDATED_AT = NULL;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'ref_code',
        'session_token',
        'note',
        'source_user_username',
        'destination_user_username',
        'asset_code',
        'source_account_transfer_value',
        'destination_account_transfer_value',
        'platform_charge_asset_value',
        'transfer_result',
    ];
    public $incrementing = false;
    protected $primaryKey = 'ref_code';
    protected $keyType = 'string';
    
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'source_account_transfer_value' => 'float',
        'destination_account_transfer_value' => 'float',
        'platform_charge_asset_value' => 'float',
        'transfer_result' => 'array',
        'transfer_datetime' => 'datetime',
    ];
}
