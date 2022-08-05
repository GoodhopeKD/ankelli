<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _EmailAddress extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = null;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'email_address',
        'user_username',
        'verified_datetime',
    ];
    
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        //'created_datetime' => 'datetime',
        'verified_datetime' => 'datetime',
    ];

    /**
     * Get the pref_items associated with the email_address.
     */
    public function pref_items()
    {
        return $this->hasMany( _PrefItem::class, 'parent_pmkey', 'email_address' )->where('parent_table', '__email_addresses');
    }

    /**
     * Get the logs associated with the listing.
     */
    public function logs()
    {
        return $this->hasMany( _Log::class, 'entry_pmkey', 'email_address' )->where('entry_table', '__email_addresses');
    }

    public function receive_notifications_f()
    {
        return !($this->pref_items()->where( 'key', 'receive_notifications' )->exists() && $this->pref_items()->where( 'key', 'receive_notifications' )->first()['value'] === 'no');
    }
    
    public function receive_promotions_f()
    {
        return !($this->pref_items()->where( 'key', 'receive_promotions' )->exists() && $this->pref_items()->where( 'key', 'receive_promotions' )->first()['value'] === 'no');
    }

    public function is_user_primary_f()
    {
        return _User::where([ 'username' => $this->user_username, 'email_address' =>$this->email_address ])->exists();
    }
}