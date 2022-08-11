<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class _SellerExtension extends Model
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
        'user_username',
        '_status',
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

    /**
     * Get the listings_posted associated with the user.
     */
    public function listings_posted()
    {
        return $this->hasMany( _Listing::class, 'seller_username', 'user_username')->where('seller_table', '__users');
    }

    /**
     * Get the orders_received associated with the user.
     */
    public function orders_received()
    {
        return $this->hasMany( _Order::class, 'seller_username', 'user_username')->where('seller_table', '__users');
    }

    public function complete_purchases_count_f()
    {
        return count( $this->orders_received()->where( "_status", "complete" )->get() );
    }
}
