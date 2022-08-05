<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _Log extends Model
{
    const CREATED_AT = 'action_datetime';
    const UPDATED_AT = null;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id',
        'session_token',
        'action_type',
        'action_note',
        'action_user_username',
        'action_datetime',
        'utc_offset',
        'batch_code',
        'entry_table',
        'entry_pmkey',
        'entry_update_result',
        'request_location',
    ];
    public $incrementing = false;
    protected $keyType = 'string';
    
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        //'action_datetime' => 'datetime',
        'entry_update_result' => 'array',
    ];
}
