<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use App\Http\Resources\_MessageResourceCollection;

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
        'country_name',
        'location',
        'was_offer_to',
        'asset_code',
        'currency_code',
        'asset_value',
        'asset_value_escrowed',
        'platform_charge_asset_factor',
        'currency_amount',
        'offer_price',
        'escrow_lock_transaction_ref_code',
        'pymt_method_slug',
        'pymt_details',
        'pymt_declared_datetime',
        'pymt_confirmed_datetime',
        'visible_to_creator',
        'visible_to_offer_creator',
        '_status',
        'offer_creator_username',
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
        'visible_to_creator' => 'boolean',
        'visible_to_offer_creator' => 'boolean',
        'asset_value' => 'float',
        'asset_value_escrowed' => 'float',
        'platform_charge_asset_factor' => 'float',
        'offer_price' => 'float',
        'pymt_details' => 'array',
    ];

    /**
     * Get the messages associated with the user.
     */
    public function messages()
    {
        return $this->hasMany( _Message::class, 'parent_uid', 'ref_code')->where('parent_table', '__trades');
    }

    /**
     * Get the logs associated with the city.
     */
    public function logs()
    {
        return $this->hasMany( _Log::class, 'entry_uid' )->where('entry_table', '__trades');
    }

    public function messages_f()
    {
        return count($this->messages) ? json_decode(( new _MessageResourceCollection( $this->messages()->orderBy('created_datetime')->get() ))->toJson(),true)['data']: null;
    }
}
