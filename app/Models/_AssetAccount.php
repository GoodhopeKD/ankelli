<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class _AssetAccount extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = 'updated_datetime';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_username',
        'asset_name',
        'asset_value',
    ];

    /**
     * Get the logs associated with the extension.
     */
    public function logs()
    {
        return $this->hasMany( _Log::class, 'entry_pmkey' )->where('entry_table', '__asset_accounts');
    }
}
