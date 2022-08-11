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
        'country',
        'offer_to',
        'asset_code',
        'currency_code',
        'asset_sell_price',
        'min_sell_value',
        'max_sell_value',
        'asset_purchase_price',
        'min_purchase_amount',
        'max_purchase_amount',
        'pymt_method_slug',
        'pymt_method_details',
        'note',
        '_status',
        'creator_username',
    ];
    public $incrementing = false;
    protected $primaryKey = 'ref_code';
    protected $keyType = 'string';
    
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'pymt_method_details' => 'array',
        //'created_datetime' => 'datetime',
        //'updated_datetime' => 'datetime',
    ];

    /**
     * Get the logs associated with the city.
     */
    public function logs()
    {
        return $this->hasMany( _Log::class, 'entry_uid' )->where('entry_table', '__offers');
    }
}
