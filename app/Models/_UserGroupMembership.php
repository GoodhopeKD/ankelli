<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _UserGroupMembership extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = 'updated_datetime';
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_username',
        'user_group_slug',
        'status',
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

    /**
     * Get the user_group associated with the user.
     */
    public function user_group()
    {
        return $this->belongsTo( _UserGroup::class , 'user_group_slug', 'slug' );
    }
}
