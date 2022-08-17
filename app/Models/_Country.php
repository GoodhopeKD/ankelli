<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _Country extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = 'updated_datetime';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'code',
        'choice_pymt_method_slugs',
        'choice_currency_codes',
        'allowed_asset_codes',
        '_status',
        'creator_username',
    ];
    
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'choice_pymt_method_slugs' => 'array',
        'choice_currency_codes' => 'array',
        'allowed_asset_codes' => 'array',
    ];

    /**
     * Get the logs associated with the city.
     */
    public function logs()
    {
        return $this->hasMany( _Log::class, 'entry_uid' )->where('entry_table', '__countries');
    }
}
