<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _Review extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = 'updated_datetime';
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'parent_table',
        'parent_uid',
        'pivot_parent_table',
        'pivot_parent_uid',
        'rating',
        'comment',
        'creator_username',
    ];
}
