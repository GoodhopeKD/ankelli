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
        'parent_uid',
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
}
