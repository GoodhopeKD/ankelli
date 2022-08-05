<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _File extends Model
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
        'parent_pmkey',
        'filegroup',
        'tag',
        'title',
        'width',
        'height',
        'uri',
        'type',
        'filesize',
        'filename',
        'original_filename',
        'order_index',
        'creator_username',
    ];
    
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
