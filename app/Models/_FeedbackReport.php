<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _FeedbackReport extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = 'updated_datetime';
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'ticket_code',
        'session_token',
        'type',
        'title',
        'message',
        'creator_name',
        'creator_email_address',
        'closing_note',
        'status',
        'creator_username',
    ];
    public $incrementing = false;
    protected $primaryKey = 'ticket_code';
    protected $keyType = 'string';

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        //'created_datetime' => 'datetime',
        //'updated_datetime' => 'datetime',
    ];
}
