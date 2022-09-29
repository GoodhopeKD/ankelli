<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class _Offer extends Model
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
        'country_name',
        'location',
        'offer_to',
        'asset_code',
        'currency_code',
        'offer_price',

        'min_trade_purchase_amount',
        'max_trade_purchase_amount',

        'min_trade_sell_value',
        'max_trade_sell_value',

        'pymt_method_slug',
        'pymt_details',
        'note',
        '_status',
        'creator_username',
    ];
    public $incrementing = false;
    protected $primaryKey = 'ref_code';
    protected $keyType = 'string';

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'pymt_details',
    ];
    
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'offer_price' => 'float',
        'min_trade_sell_value' => 'float',
        'max_trade_sell_value' => 'float',
        'pymt_details' => 'array',
    ];

    /**
     * Get the logs associated with the city.
     */
    public function logs()
    {
        return $this->hasMany( _Log::class, 'entry_uid' )->where('entry_table', '__offers');
    }
}
