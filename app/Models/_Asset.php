<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _Asset extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = 'updated_datetime';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'tatum_mnemonic',
        'tatum_xpub',
        'name',
        'code',
        'smallest_display_unit',
        'onchain_disclaimer',
        '_status',
        'creator_username',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'tatum_mnemonic',
        'tatum_xpub',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'smallest_display_unit' => 'float',
    ];

    /**
     * Get the logs associated with the extension.
     */
    public function logs()
    {
        return $this->hasMany( _Log::class, 'entry_uid' )->where('entry_table', '__assets');
    }
}
