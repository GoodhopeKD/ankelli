<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _Exportable extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = 'updated_datetime';

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
     * Get the logs associated with the city.
     */
    public function logs()
    {
        return $this->hasMany(_Log::class, 'entry_uid')->where('entry_table', '__exportables');
    }
}
