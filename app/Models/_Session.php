<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _Session extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = 'updated_datetime';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'token',
        'user_username',
        'device_info',
        'agent_app_info',
        '_status',
        'signin_datetime',
        'signout_datetime',
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
        //'created_datetime' => 'datetime',
        //'updated_datetime' => 'datetime',
        'signin_datetime' => 'datetime',
        'signout_datetime' => 'datetime',
    ];

    /**
     * Get the logs associated with the session.
     */
    public function logs()
    {
        return $this->hasMany( _Log::class, 'entry_uid', 'token' )->where('entry_table', '__sessions');
    }

    /**
     * Get the logs_in_session associated with the session.
     */
    public function logs_in_session()
    {
        return $this->hasMany( _Log::class, 'session_token', 'token' );
    }
    
    public function last_active_datetime_f()
    {
        $action = $this->logs_in_session()->orderBy('action_datetime', 'desc')->first();
        return $action ? $action->action_datetime : null;
    }
}
