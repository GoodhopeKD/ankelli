<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _PhoneNo extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = 'updated_datetime';
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'country_calling_code',
        'parent_table',
        'parent_pmkey',
        'number',
        'tag',
        'creator_username',
        'verified_datetime',
    ];
    
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        //'created_datetime' => 'datetime',
        //'updated_datetime' => 'datetime',
        'verified_datetime' => 'datetime',
    ];
}
