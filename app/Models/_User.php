<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Laravel\Passport\HasApiTokens;

use App\Http\Resources\__UserDisplayCardResource;
use App\Http\Resources\_FileResourceCollection;
use App\Http\Resources\_AddressResourceCollection;
use App\Http\Resources\_EmailAddressResourceCollection;
use App\Http\Resources\_PhoneNoResourceCollection;
use App\Http\Resources\_AdminExtensionResourceCollection;
use App\Http\Resources\_SellerExtensionResourceCollection;
use App\Http\Resources\_BuyerExtensionResourceCollection;
use App\Http\Resources\_PrefItemResourceCollection;
use App\Http\Resources\_UserGroupMembershipResourceCollection;

class _User extends Authenticatable
{
    use HasApiTokens, Notifiable, SoftDeletes;

    const CREATED_AT = 'created_datetime';
    const UPDATED_AT = 'updated_datetime';
    const DELETED_AT = 'deleted_datetime';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'username',
        'email_address',
        'password',
        'reg_token',
        'avatar_image_id',
        'status',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'reg_token',
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
     * Get the email_addresses associated with the user.
     */
    public function email_addresses()
    {
        return $this->hasMany( _EmailAddress::class, 'user_username', 'username' );
    }

    /**
     * Get the phone_nos associated with the user.
     */
    public function phone_nos()
    {
        return $this->hasMany( _PhoneNo::class, 'parent_uid', 'username' )->where(['parent_table' => '__users']);
    }

    /**
     * Get the admin_extension associated with the user.
     */
    public function admin_extension()
    {
        return $this->hasOne( _AdminExtension::class, 'user_username', 'username' );
    }

    /**
     * Get the buyer_extension associated with the user.
     */
    public function buyer_extension()
    {
        return $this->hasOne( _BuyerExtension::class, 'user_username', 'username' );
    }
    /**
     * Get the seller_extension associated with the user.
     */
    public function seller_extension()
    {
        return $this->hasOne( _SellerExtension::class, 'user_username', 'username' );
    }

    /**
     * Get the pinnings associated with the user.
     */
    public function pinnings()
    {
        return $this->hasMany( _Pinning::class, 'user_username', 'username' );
    }

    /**
     * Get the notifications associated with the user.
     */
    public function notifications()
    {
        return $this->hasMany( _Notification::class , 'user_username', 'username' );
    }

    /**
     * Get the user_group_memberships associated with the user.
     */
    public function user_group_memberships()
    {
        return $this->hasMany( _UserGroupMembership::class , 'user_username', 'username' );
    }

    /**
     * Get the pref_items associated with the user.
     */
    public function pref_items()
    {
        return $this->hasMany( _PrefItem::class , 'parent_uid', 'username' )->where('parent_table', '__users');
    }

    /**
     * Get the sessions associated with the user.
     */
    public function sessions()
    {
        return $this->hasMany( _Session::class, 'user_username', 'username');
    }

    /**
     * Get the logs associated with the user.
     */
    public function logs()
    {
        return $this->hasMany( _Log::class, 'entry_uid', 'username' )->where('entry_table', '__users');
    }
    
    /**
     * Get the logs_by_model associated with the user.
     */
    public function logs_by_model()
    {
        return $this->hasMany( _Log::class, 'action_user_username', 'username' );
    }

    public function fullname_f()
    {
        return trim($this->name_s.' '.$this->surname);
    }

    public function referral_code_f()
    {
        return $this->referral_code ? $this->referral_code->code : null;
    }

    public function last_active_datetime_f()
    {
        return count($this->logs_by_model) ? $this->logs_by_model()->orderBy('action_datetime', 'desc')->first()->action_datetime : null;
    }

    public function email_addresses_f()
    {
        return count($this->email_addresses) ? json_decode(( new _EmailAddressResourceCollection( $this->email_addresses ))->toJson(),true)['data'] : null;
    }

    public function phone_nos_f()
    {
        return count($this->phone_nos) ? json_decode(( new _PhoneNoResourceCollection( $this->phone_nos ))->toJson(),true)['data'] : null;
    }

    // Permissions
    public function is_active_business_admin_f()
    {
        return $this->admin_extension()->where('status', 'active')->exists() && $this->user_group_memberships()->where('user_group_slug','business_administrators')->where('status','active')->exists();
    }

    public function can_create_trades_to_sell_f()
    {
        return !$this->seller_extension()->whereNotIn('status',['revoked'])->exists();
    }

    public function can_create_offers_to_buy_f()
    {
        return !$this->buyer_extension()->where('status','revoked')->exists();
    }

    // Extensions
    public function admin_extension_f()
    {
        return $this->admin_extension ? json_decode(( new _AdminExtensionResourceCollection( [$this->admin_extension] ))->toJson(),true)['data'][0] : NULL;
    }

    public function seller_extension_f()
    {
        return $this->seller_extension ? json_decode(( new _SellerExtensionResourceCollection( [$this->seller_extension] ))->toJson(),true)['data'][0] : NULL;
    }
    
    public function buyer_extension_f()
    {
        return $this->buyer_extension ? json_decode(( new _BuyerExtensionResourceCollection( [$this->buyer_extension] ))->toJson(),true)['data'][0] : NULL;
    }

    public function pref_items_f()
    {
        return count($this->pref_items) ? json_decode(( new _PrefItemResourceCollection( $this->pref_items ))->toJson(),true)['data']: null;
    }

    private function _set_user_group_memberships_info()
    {
        // User Groups
        $user_group_memberships = $this->user_group_memberships()->get()->toArray();

        // Active User Groups
        $active_user_group_memberships = [];

        foreach ($this->user_group_memberships()->get() as $key => $user_group_membership) {
            if ( $user_group_membership->status === 'active' && $user_group_membership->user_group->status==='active' ){ array_push( $active_user_group_memberships, $user_group_membership->user_group_slug ); }
        }

        $admin_extension = $this->admin_extension;
        if (isset($admin_extension) && !(array_search('user_administrators', array_column($user_group_memberships, "user_group_slug")) !== false)){
            $status = $admin_extension->status === 'active' && _UserGroup::where('slug', 'user_administrators')->first()->status === 'active' ? 'active' : 'revoked';
            array_push( $user_group_memberships, (object)[ 
                'id'                    => NULL,
                'user_username'         => $this->username,
                'user_group_slug'       => 'user_administrators',
                'status'                => $status,
                'creator_username'      => $admin_extension->creator_username,
                'created_datetime'      => $admin_extension->created_datetime,
                'updated_datetime'      => $admin_extension->updated_datetime,
            ]);
            if ( $status === 'active' ){ array_push( $active_user_group_memberships, 'user_administrators' ); }
        }

        $seller_extension = $this->seller_extension;
        if ($seller_extension && !(array_search('sellers', array_column($user_group_memberships, "user_group_slug")) !== false)){
            $status = $seller_extension->status === 'active' && _UserGroup::where('slug', 'sellers')->first()->status === 'active' ? 'active' : 'revoked';
            array_push( $user_group_memberships, (object)[ 
                'id'                    => NULL,
                'user_username'         => $this->username,
                'user_group_slug'       => 'sellers',
                'status'                => $status,
                'creator_username'      => $seller_extension->creator_username,
                'created_datetime'      => $seller_extension->created_datetime,
                'updated_datetime'      => $seller_extension->updated_datetime,
            ]);
            if ( $status === 'active' ){ array_push( $active_user_group_memberships, 'sellers' ); }
        }

        $buyer_extension = $this->buyer_extension;
        if ($buyer_extension && !(array_search('buyers', array_column($user_group_memberships, "user_group_slug")) !== false)){
            $status = $buyer_extension->status === 'active' && _UserGroup::where('slug', 'buyers')->first()->status === 'active' ? 'active' : 'revoked';
            array_push( $user_group_memberships, (object)[ 
                'id'                    => NULL,
                'user_username'         => $this->username,
                'user_group_slug'       => 'buyers',
                'status'                => $status,
                'creator_username'      => $buyer_extension->creator_username,
                'created_datetime'      => $buyer_extension->created_datetime,
                'updated_datetime'      => $buyer_extension->updated_datetime,
            ]);
            if ( $status === 'active' ){ array_push( $active_user_group_memberships, 'buyers' ); }
        }

        $this->_set_user_group_memberships_info_done = true;
        $this->user_group_memberships_f = count($user_group_memberships) ? json_decode(( new _UserGroupMembershipResourceCollection( $user_group_memberships ))->toJson(),true)['data']: null;
        $this->active_user_group_memberships_f = $active_user_group_memberships;
    }

    public function user_group_memberships_f()
    {
        if (!isset($this->_set_user_group_memberships_info_done)){
            $this->_set_user_group_memberships_info();
        }
        return $this->user_group_memberships_f;
    }

    public function active_user_group_memberships_f()
    {
        if (!isset($this->_set_user_group_memberships_info_done)){
            $this->_set_user_group_memberships_info();
        }
        return $this->active_user_group_memberships_f;
    }
}
