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
        'creator_username',
        'user_username',
        'used_datetime',
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
        'used_datetime' => 'datetime',
    ];
}
