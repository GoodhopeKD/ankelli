<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _Message extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = null;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id',
        'parent_table',
        'parent_uid',
        'body',
        'creator_username',
        'read_datetime',
    ];
    public $incrementing = false;
    protected $keyType = 'string';
    
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'read_datetime' => 'datetime',
    ];
}
