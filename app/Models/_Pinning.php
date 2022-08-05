<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _Pinning extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = 'updated_datetime';
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'item_ref_code',
        'user_username',
        'item_table',
        'product_quantity',
        'pinning_type',
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
