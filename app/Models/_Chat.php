<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _Chat extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = NULL;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id',
        'participant_one_username',
        'participant_one_visible',
        'participant_two_username',
        'participant_two_visible',
        'creator_username',
    ];
    public $incrementing = false;
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
