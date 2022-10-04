<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _VerifToken extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = null;
    
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'token',
        'user_username',
        'charge',
        '_status',
        'receiving_resource_table',
        'receiving_resource_id',
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
        'verified_datetime' => 'datetime',
    ];

    /**
     * Get the email_address associated with the verif_token.
     */
    public function email_address()
    {
        return $this->belongsTo( _EmailAddress::class, 'receiving_resource_id' );
    }

    /**
     * Get the phone_no associated with the verif_token.
     */
    public function phone_no()
    {
        return $this->belongsTo( _PhoneNo::class, 'receiving_resource_id' );
    }

    public function receiving_resource_value_f()
    {
        $receiving_resource_value = null;
        switch ( $this->receiving_resource_table ) {
            case '__email_addresses':
                $receiving_resource_value = ( $this->email_address ) ? $this->email_address->email_address : null;
                break;
            case '__phone_nos':
                $receiving_resource_value = ( $this->phone_no ) ? '+'.ltrim($this->phone_no->country_calling_code, '+').ltrim($this->phone_no->number, '0');
                break;
        }
        return $receiving_resource_value;
    }
}
