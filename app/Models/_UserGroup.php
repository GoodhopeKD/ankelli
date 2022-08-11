<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class _UserGroup extends Model
{
    use SoftDeletes;

    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = 'updated_datetime';
    const DELETED_AT = 'deleted_datetime';
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'slug',
        'description',
        '_status',
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
     * Get the profile_image associated with the store.
     */
    public function profile_image()
    {
        return $this->hasOne( _File::class, 'parent_uid', 'slug' )->where('parent_table', '__user_groups');
    }

    public function profile_image_f()
    {
        return $this->profile_image ? json_decode(( new _FileResourceCollection( [$this->profile_image] ))->toJson(),true)['data'][0] : NULL;
    }
}
