<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _RegToken extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = null;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'token',
        '_status',
        'creator_username',
    ];
    public $incrementing = false;
    protected $primaryKey = 'token';
    protected $keyType = 'string';

    /**
     * Get the logs associated with the city.
     */
    public function logs()
    {
        return $this->hasMany( _Log::class, 'entry_uid' )->where('entry_table', '__trades');
    }

    /**
     * Get the users associated with the city.
     */
    public function users()
    {
        return $this->hasMany( _User::class, 'reg_token' );
    }
}
