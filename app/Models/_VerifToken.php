<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _VerifToken extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = NULL;
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'token',
        'user_username',
        'charge',
        'status',
        'recepient_resource_table',
        'recepient_resource_id',
        'verified_datetime',
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
        'verified_datetime' => 'datetime',
    ];

    /**
     * Get the email_address associated with the verif_token.
     */
    public function email_address()
    {
        return $this->belongsTo( _EmailAddress::class, 'recepient_resource_id' );
    }

    /**
     * Get the phone_no associated with the verif_token.
     */
    public function phone_no()
    {
        return $this->belongsTo( _PhoneNo::class, 'recepient_resource_id' );
    }

    public function recepient_resource_value_f()
    {
        $recepient_resource_value = NULL;
        switch ( $this->recepient_resource_table ) {
            case '__email_addresses':
                $recepient_resource_value = ( $this->email_address ) ? $this->email_address->email_address : NULL;
                break;
            case '__phone_nos':
                $recepient_resource_value = ( $this->phone_no ) ? '+' . ltrim($this->phone_no->country_calling_code, '+') . ltrim($this->phone_no->number, '0');
                break;
        }
        return $recepient_resource_value;
    }
}
