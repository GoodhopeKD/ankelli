<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _Currency extends Model
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
        'alpha_three_code',
        'symbol',
        'symbol_before_number',
        'usd_rate',
        'min_transactable_cash_amount',
        'smallest_transactable_cash_denomination_amount',
        'creator_username',
    ];
    
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'symbol_before_number' => 'boolean',
        //'usd_rate' => 'float',
        //'min_transactable_cash_amount' => 'float',
        //'smallest_transactable_cash_denomination_amount' => 'float',
    ];

    /**
     * Get the logs associated with the city.
     */
    public function logs()
    {
        return $this->hasMany( _Log::class, 'entry_uid' )->where('entry_table', '__currencies');
    }
}
