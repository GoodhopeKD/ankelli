<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

use App\Http\Resources\_MessageResourceCollection;
use App\Http\Resources\_ReviewResourceCollection;

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
        'offer_ref_code',
        'was_offer_to',
        'asset_code',
        'currency_code',
        'asset_value',
        'currency_amount',
        'asset_value_escrowed',
        'offer_price',
        'trade_txn_fee_fctr',
        'buyer_cmplt_trade_mins_tmt',
        'pymt_method_slug',
        'pymt_details',
        'pymt_declared_datetime',
        'pymt_confirmed_datetime',
        'visible_to_creator',
        'visible_to_offer_creator',
        'buyer_opened_datetime',
        'closed_datetime',
        '_status',
        'flag_raiser_username',
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
        'pymt_declared_datetime' => 'datetime',
        'pymt_confirmed_datetime' => 'datetime',
        'buyer_opened_datetime' => 'datetime',
        'closed_datetime' => 'datetime',
        'visible_to_creator' => 'boolean',
        'visible_to_offer_creator' => 'boolean',
        'asset_value' => 'float',
        'asset_value_escrowed' => 'float',
        'offer_price' => 'float',
        'trade_txn_fee_fctr' => 'float',
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
     * Get the completion_review_on_trade_creator associated with the user.
     */
    public function completion_review_on_trade_creator()
    {
        return $this->hasOne( _Review::class, 'parent_uid', 'creator_username' )->where(['parent_table' => '__users', 'pivot_parent_table' => '__trades', 'pivot_parent_uid' => $this->ref_code]);
    }

    /**
     * Get the completion_review_on_offer_creator associated with the user.
     */
    public function completion_review_on_offer_creator()
    {
        return $this->hasOne( _Review::class, 'parent_uid', 'offer_creator_username' )->where(['parent_table' => '__users', 'pivot_parent_table' => '__trades', 'pivot_parent_uid' => $this->ref_code]);
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

    public function completion_review_on_trade_creator_f()
    {
        return $this->completion_review_on_trade_creator ? json_decode(( new _ReviewResourceCollection( [$this->completion_review_on_trade_creator] ))->toJson(),true)['data'][0] : null;
    }

    public function completion_review_on_offer_creator_f()
    {
        return $this->completion_review_on_offer_creator ? json_decode(( new _ReviewResourceCollection( [$this->completion_review_on_offer_creator] ))->toJson(),true)['data'][0] : null;
    }

    public function last_activity_datetime_f()
    {
        $last_message_datetime = null;
        $last_message = $this->messages()->orderByRaw('ifnull(read_datetime, created_datetime) DESC')->first();
        if ($last_message){
            $last_message_datetime = $last_message->read_datetime ?? $last_message->created_datetime;
        }
        $all_datetimes = array_filter([$last_message_datetime, $this->created_datetime, $this->updated_datetime]);
        rsort($all_datetimes);
        return ($all_datetimes[0]);
    }
    
}
