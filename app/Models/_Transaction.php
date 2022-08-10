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
        'asset_name',
        'transfer_value',
        'transfer_result',
        'creator_username',
    ];
    public $incrementing = false;
    protected $primaryKey = 'token';
    protected $keyType = 'string';
    
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'transfer_datetime' => 'datetime',
    ];
}
