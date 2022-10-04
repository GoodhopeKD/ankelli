<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Laravel\Passport\HasApiTokens;

use Illuminate\Http\Request;

use App\Http\Resources\__UserDisplayCardResource;
use App\Http\Resources\_FileResourceCollection;
use App\Http\Resources\_AddressResourceCollection;
use App\Http\Resources\_ReviewResourceCollection;
use App\Http\Resources\_EmailAddressResourceCollection;
use App\Http\Resources\_PhoneNoResourceCollection;
use App\Http\Resources\_AdminExtensionResourceCollection;
use App\Http\Resources\_SellerExtensionResourceCollection;
use App\Http\Resources\_BuyerExtensionResourceCollection;
use App\Http\Resources\_PrefItemResourceCollection;
use App\Http\Resources\_AssetWalletResourceCollection;
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
        'tatum_customer_id',
        '_status',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'reg_token',
        'tatum_customer_id',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
    ];

    /**
     * Get the reviews associated with the user.
     */
    public function reviews()
    {
        return $this->hasMany( _Review::class, 'parent_uid', 'username' )->where(['parent_table' => '__users']);
    }

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
     * Get the asset_wallets associated with the user.
     */
    public function asset_wallets()
    {
        return $this->hasMany( _AssetWallet::class, 'user_username', 'username');
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

    public function referral_code_f()
    {
        return $this->referral_code ? $this->referral_code->code : null;
    }

    public function last_active_datetime_f()
    {
        return count($this->logs_by_model) ? $this->logs_by_model()->orderBy('action_datetime', 'desc')->first()->action_datetime : null;
    }

    public function reviews_f()
    {
        return count($this->reviews) ? json_decode(( new _ReviewResourceCollection( $this->reviews ))->toJson(),true)['data'] : null;
    }

    public function rating_f()
    {
        $reviews = $this->reviews()->get();
        $total_rating = 0;
        foreach ($reviews as $review) {
            $total_rating += $review->rating;
        }
        $reviews_count = count($reviews);
        return $total_rating && $reviews_count ? ($total_rating / $reviews_count) : null;
    }

    public function completion_rate_f()
    {
        $trades = array_merge(
            _Trade::where(['was_offer_to' => 'buy', 'offer_creator_username' => $this->username])->whereIn('_status', ['completed', 'cancelled'])->get()->all(),
            _Trade::where(['was_offer_to' => 'sell', 'creator_username' => $this->username])->whereIn('_status', ['completed', 'cancelled'])->get()->all()
        );
        $total_rating = 0;
        foreach ($trades as $trade) {
            if ($trade->_status == 'completed')
                $total_rating += 1;
        }
        $trades_count = count($trades);
        return $total_rating && $trades_count ? (100* $total_rating / $trades_count) : null;
    }

    public function trades_as_buyer_stats_f()
    {
        $trades = array_merge(
            _Trade::where(['was_offer_to' => 'buy', 'offer_creator_username' => $this->username])->whereIn('_status', ['completed', 'cancelled'])->get()->all(),
            _Trade::where(['was_offer_to' => 'sell', 'creator_username' => $this->username])->whereIn('_status', ['completed', 'cancelled'])->get()->all()
        );
        $completed = 0;
        foreach ($trades as $trade) {
            if ($trade->_status == 'completed')
                $completed += 1;
        }
        return [ 'total' => count($trades), 'completed' => $completed ];
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
        return $this->admin_extension()->where('_status', 'active')->exists() && $this->user_group_memberships()->where('user_group_slug', 'business_administrators')->where('_status', 'active')->exists();
    }

    public function can_create_trades_to_sell_f()
    {
        return !$this->seller_extension()->whereNotIn('_status',['revoked'])->exists();
    }

    public function can_create_offer_to_buy_f()
    {
        return !$this->buyer_extension()->where('_status', 'revoked')->exists();
    }

    // Extensions
    public function admin_extension_f()
    {
        return $this->admin_extension ? json_decode(( new _AdminExtensionResourceCollection( [$this->admin_extension] ))->toJson(),true)['data'][0] : null;
    }

    public function seller_extension_f()
    {
        return $this->seller_extension ? json_decode(( new _SellerExtensionResourceCollection( [$this->seller_extension] ))->toJson(),true)['data'][0] : null;
    }
    
    public function buyer_extension_f()
    {
        return $this->buyer_extension ? json_decode(( new _BuyerExtensionResourceCollection( [$this->buyer_extension] ))->toJson(),true)['data'][0] : null;
    }

    public function pref_items_f()
    {
        return count($this->pref_items) ? json_decode(( new _PrefItemResourceCollection( $this->pref_items ))->toJson(),true)['data']: [];
    }

    public function asset_wallets_f()
    {
        return count($this->asset_wallets) ? json_decode(( new _AssetWalletResourceCollection( $this->asset_wallets ))->toJson(),true)['data']: [];
    }

    private function _set_user_group_memberships_info()
    {
        // User Groups
        $user_group_memberships = $this->user_group_memberships()->get()->toArray();

        // Active User Groups
        $active_user_group_membership_slugs = [];

        foreach ($this->user_group_memberships()->get() as $key => $user_group_membership) {
            if ( $user_group_membership->_status === 'active' && $user_group_membership->user_group->_status==='active' ){ array_push( $active_user_group_membership_slugs, $user_group_membership->user_group_slug ); }
        }

        $admin_extension = $this->admin_extension;
        if (isset($admin_extension) && !(array_search('administrators', array_column($user_group_memberships, "user_group_slug")) !== false)){
            $_status = $admin_extension->_status === 'active' && _UserGroup::firstWhere('slug', 'administrators')->_status === 'active' ? 'active' : 'revoked';
            array_push( $user_group_memberships, new Request([ 
                'id'                    => null,
                'user_username'         => $this->username,
                'user_group_slug'       => 'administrators',
                '_status'                => $_status,
                'creator_username'      => $admin_extension->creator_username,
                'created_datetime'      => $admin_extension->created_datetime,
                'updated_datetime'      => $admin_extension->updated_datetime,
            ]));
            if ( $_status === 'active' ){ array_push( $active_user_group_membership_slugs, 'administrators' ); }
        }

        $seller_extension = $this->seller_extension;
        if ( $seller_extension && !(array_search('sellers', array_column($user_group_memberships, "user_group_slug")) !== false)){
            $_status = $seller_extension->_status === 'active' && _UserGroup::firstWhere('slug', 'sellers')->_status === 'active' ? 'active' : 'revoked';
            array_push( $user_group_memberships, new Request([ 
                'id'                    => null,
                'user_username'         => $this->username,
                'user_group_slug'       => 'sellers',
                '_status'                => $_status,
                'creator_username'      => $seller_extension->creator_username,
                'created_datetime'      => $seller_extension->created_datetime,
                'updated_datetime'      => $seller_extension->updated_datetime,
            ]));
            if ( $_status === 'active' ){ array_push( $active_user_group_membership_slugs, 'sellers' ); }
        }

        $buyer_extension = $this->buyer_extension;
        if ( $buyer_extension && !(array_search('buyers', array_column($user_group_memberships, "user_group_slug")) !== false)){
            $_status = $buyer_extension->_status === 'active' && _UserGroup::firstWhere('slug', 'buyers')->_status === 'active' ? 'active' : 'revoked';
            array_push( $user_group_memberships, new Request([ 
                'id'                    => null,
                'user_username'         => $this->username,
                'user_group_slug'       => 'buyers',
                '_status'                => $_status,
                'creator_username'      => $buyer_extension->creator_username,
                'created_datetime'      => $buyer_extension->created_datetime,
                'updated_datetime'      => $buyer_extension->updated_datetime,
            ]));
            if ( $_status === 'active' ){ array_push( $active_user_group_membership_slugs, 'buyers' ); }
        }

        $this->_set_user_group_memberships_info_done = true;
        $this->user_group_memberships_f = count($user_group_memberships) ? json_decode(( new _UserGroupMembershipResourceCollection( $user_group_memberships ))->toJson(),true)['data']: null;
        $this->active_user_group_membership_slugs_f = $active_user_group_membership_slugs;
    }

    public function user_group_memberships_f()
    {
        if (!isset($this->_set_user_group_memberships_info_done)){
            $this->_set_user_group_memberships_info();
        }
        return $this->user_group_memberships_f;
    }

    public function active_user_group_membership_slugs_f()
    {
        if (!isset($this->_set_user_group_memberships_info_done)){
            $this->_set_user_group_memberships_info();
        }
        return $this->active_user_group_membership_slugs_f;
    }
}
