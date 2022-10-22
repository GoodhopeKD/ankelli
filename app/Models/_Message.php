<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use App\Http\Resources\_FileResourceCollection;

class _Message extends Model
{
    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = null;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id',
        'parent_table',
        'parent_uid',
        'body',
        'creator_username',
        'read_datetime',
    ];
    public $incrementing = false;
    protected $keyType = 'string';
    
    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'read_datetime' => 'datetime',
    ];

    public function creator_avatar_image_id_f()
    {
        return _User::firstWhere('username',$this->creator_username)->avatar_image_id;
    }

    public function attachment()
    {
        return $this->hasOne(_File::class, 'parent_uid')->where(['parent_table' => '__messages', 'tag' => 'message_attachment']);
    }

    public function attachment_f()
    {
        return $this->attachment ? json_decode((new _FileResourceCollection([$this->attachment]))->toJson(),true)['data'][0] : null;
    }
}
