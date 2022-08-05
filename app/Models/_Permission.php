<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class _Permission extends Model
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
     * Get the logs associated with the city.
     */
    public function logs()
    {
        return $this->hasMany( _Log::class, 'entry_pmkey' )->where('entry_table', '__permissions');
    }
}
