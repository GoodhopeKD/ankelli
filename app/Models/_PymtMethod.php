<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use App\Http\Resources\_FileResourceCollection;

class _PymtMethod extends Model
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
        'details_required',
        '_status',
        'creator_username',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'details_required' => 'array',
        //'created_datetime' => 'datetime',
        //'updated_datetime' => 'datetime',
    ];

    /**
     * Get the icon associated with the pymt_method.
     */
    public function icon()
    {
        return $this->hasOne( _File::class, 'parent_uid', 'slug' )->where(['parent_table' => '__pymt_methods', 'tag' => 'pymt_method_icon']);
    }

    public function icon_f()
    {
        return $this->icon ? json_decode(( new _FileResourceCollection( [$this->icon] ))->toJson(),true)['data'][0] : NULL;
    }


}
