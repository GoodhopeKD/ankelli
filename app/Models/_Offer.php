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
        'trade_txn_fee_fctr',

        'min_trade_purchase_amount',
        'max_trade_purchase_amount',
        'offer_total_purchase_amount',
        'filled_amount',

        'min_trade_sell_value',
        'max_trade_sell_value',
        'offer_total_sell_value',
        'filled_value',

        'buyer_cmplt_trade_mins_tmt',
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
        'trade_txn_fee_fctr' => 'float',
        'min_trade_sell_value' => 'float',
        'max_trade_sell_value' => 'float',
        'offer_total_sell_value' => 'float',
        'filled_value' => 'float',
        'pymt_details' => 'array',
    ];

    /**
     * Get the logs associated with the city.
     */
    public function logs()
    {
        return $this->hasMany( _Log::class, 'entry_uid' )->where('entry_table', '__offers');
    }

    public function creator_rating_f()
    {
        return _User::firstWhere('username',$this->creator_username)->rating_f();
    }

    public function creator_trades_as_buyer_stats_f()
    {
        return _User::firstWhere('username',$this->creator_username)->trades_as_buyer_stats_f();
    }
}
