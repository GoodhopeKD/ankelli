<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _DepositToken extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = null;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'token',
        'asset_code',
        'asset_value',
        'currency_code',
        'currency_amount',
        'creator_username',
        'user_username',
        'used_datetime',
    ];
    public $incrementing = false;
    protected $primaryKey = 'token';
    protected $keyType = 'string';
    
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        //'asset_value' => 'float',
        'used_datetime' => 'datetime',
    ];

    /**
     * Get the logs associated with the city.
     */
    public function logs()
    {
        return $this->hasMany(_Log::class, 'entry_uid')->where('entry_table', '__currencies');
    }
}
