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
        '_status',
        'creator_username',
    ];

    /**
     * Get the user_group associated with the user.
     */
    public function user_group()
    {
        return $this->belongsTo( _UserGroup::class , 'user_group_slug', 'slug' );
    }

    /**
     * Get the admin_extension associated with the user.
     */
    public function admin_extension()
    {
        return $this->belongsTo( _AdminExtension::class , 'user_username', 'user_username' );
    }

    public function post_title_f()
    {
        return $this->admin_extension ? $this->admin_extension->post_title : null;
    }
}
