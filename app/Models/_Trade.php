<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class _Trade extends Model
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
        'ref_code',
        'country',
        'was_offer_to',
        'asset_code',
        'currency_code',
        'asset_value',
        'purchase_amount',
        'asset_sell_price',
        'asset_purchase_price',
        'payment_method',
        'payment_details',
        'payment_declared_datetime',
        'payment_confirmed_datetime',
        'visible_to_creator',
        'visible_to_offer_creator',
        'status',
        'offer_creator_username',
        'creator_username',
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
        //'created_datetime' => 'datetime',
        //'updated_datetime' => 'datetime',
    ];

    /**
     * Get the logs associated with the city.
     */
    public function logs()
    {
        return $this->hasMany( _Log::class, 'entry_pmkey' )->where('entry_table', '__offers');
    }
}
