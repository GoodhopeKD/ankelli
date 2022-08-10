<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _PrefItem extends Model
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
        'key',
        'value',
        'value_type',
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

    public function value_f()
    {
        $value = $this->value; // string / enum return default
        if ($this->value_type === 'boolean') $value = (boolean)$value;
        if ($this->value_type === 'float') $value = (float)$value;
        if ($this->value_type === 'integer') $value = (integer)$value;
        if ($this->value_type === 'json') $value = json_decode($value);
        return $value;
    }
}
