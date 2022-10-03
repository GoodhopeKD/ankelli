<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;

use App\Models\_Session;
use App\Http\Resources\_SessionResource;

use App\Models\_PrefItem;
use App\Models\_RegToken;
use App\Models\_EmailAddress;
use App\Models\_Log;

use App\Models\_User;
use App\Http\Resources\_UserResource;
use App\Http\Resources\_UserResourceCollection;

class _UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $result = null;

        if ( $result === null && request()->get_as_addon_prop && request()->get_as_addon_prop == true ){
            $result = _User::where(['_status'=>'active'])
            ->orderByRaw('ifnull(updated_datetime, created_datetime) DESC')->paginate(request()->per_page)->withQueryString(); 
        }
        
        if ( $result === null ){
            $simple_query_args = [];

            if ( request()->_status && request()->_status !== 'all' ){ $simple_query_args = array_merge( $simple_query_args, [ '_status' => request()->_status ]); }
            if ( !isset(request()->_status) ){ $simple_query_args = array_merge( $simple_query_args, [ '_status' => 'active' ]); }

            $eloquent_query = _User::where($simple_query_args);

            if ( request()->user_username && is_string( request()->user_username ) ){
                $eloquent_query = $eloquent_query
                ->where(['creator_username' => request()->user_username, 'visible_to_creator' => true])
                ->orWhere(function($query) { $query->where(['offer_creator_username' => request()->user_username, 'visible_to_offer_creator' => true]); });
            }
            
            $result = $eloquent_query->orderByRaw('ifnull(updated_datetime, created_datetime) DESC')->paginate(request()->per_page)->withQueryString();
        }

        return $result ? ( request()->get_with_meta && request()->get_with_meta == true ? _UserResource::collection( $result ) : new _UserResourceCollection( $result ) ) : null;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $token_reg_enabled = _PrefItem::firstWhere('key_slug', 'token_reg_enabled')->value_f();
        // Request Validation
        $validated_data = $request->validate([
            'reg_token' => [ $token_reg_enabled ? 'required' : 'sometimes', 'string', 'max:16'],
            'username' => ['required', 'string', 'min:4', 'max:64'],
            'email_address' => ['required', 'string', 'email', 'max:64'],
            'password' => ['required', 'string', 'min:8', 'max:32', 'confirmed'],
        ]);

        if ( $token_reg_enabled ){
            $reg_token_check = (array)(new __AuxController)->usability_check( new Request([ 'param_name' => 'reg_token', 'param_value' => $validated_data['reg_token'] ]) )->getData();
            if ( !$reg_token_check['usable']){
                return abort(422, $reg_token_check['message']);
            }
        }

        $username_check = (array)(new __AuxController)->availability_check( new Request([ 'param_name' => 'username', 'param_value' => $validated_data['username'] ]) )->getData();
        if ( !$username_check['available']){
            return abort(422, $username_check['message']);
        }

        $email_address_check = (array)(new __AuxController)->availability_check( new Request([ 'param_name' => 'email_address', 'param_value' => $validated_data['email_address'] ]) )->getData();
        if ( !$email_address_check['available']){
            return abort(422, $email_address_check['message']);
        }

        // Response Structure
        $response = [
            'sysconfig_params_data' => null,
            'active_session_data' => null,
            'auth_user_data' => null,
        ];

        $validated_data['password'] = bcrypt($request->password);
        $api_auth_user = _User::create($validated_data);

        // Initialise _Log Batch Handling
        $log_batch_code = random_int(100000, 199999).strtoupper(substr(md5(microtime()),rand(0,9),7));
        (new _LogController)->store( new Request([
            'action_note' => 'User signup.',
            'action_type' => 'batch_init',
            'batch_code' => $log_batch_code,
        ]));
        // End Initialise _Log Batch Handling
        
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note'   => 'Addition of _User entry to database.',
            'action_type'   => 'entry_create',
            'entry_table'   => '__users',
            'entry_uid'     => $api_auth_user->username,
            'batch_code'    => $log_batch_code,
        ]));
        // End _Log Handling

        // Create _User's Email address
        (new _EmailAddressController)->store( new Request([
            'email_address' => $api_auth_user->email_address,
            'user_username' => $api_auth_user->username,
            'batch_code' => $log_batch_code,
        ]));
        // End Create _User's Email address

        // Create notification to verify email
        (new _NotificationController)->store( new Request([
            'user_username' => $api_auth_user->username,
            'content' => [
                'title' => 'Welcome Note',
                'subtitle' => 'Welcome to the Ankelli Crypto trading Platform.',
                'body' => "We as the Ankelli Team welcome you to our Crypto trading platform.\nPlease, enjoy the services we have prepared for you.\nTo get the most out of your experience here, start by verifying your email address."
            ],
            'batch_code' => $log_batch_code,
        ]));
        // End Create notification to verify email

        if ( !( session()->get('active_session_token') && in_array(session()->get('active_session_token'), ['FACTORY_SSN', 'TEST_SSN']) )){
            // Handle _Session
            $active_session_data = $request->active_session_data;
            $active_session_data['user_username'] = $api_auth_user->username;
            $response['active_session_data'] = (new _SessionController)->_signUserIn( new Request( $active_session_data ), $active_session_data['token'] );
            // End _Session Handling

            $response['auth_token'] = $api_auth_user->createToken('auth_token')->accessToken;
            $response['sysconfig_params_data'] = ( new __AuxController )->sysconfig_params()->getData()->data;
            $response['auth_user_data'] = new _UserResource( $api_auth_user );
        }

        if ($request->expectsJson()) return response()->json( $response );
    }

    /**
     * Display the specified resource.
     *
     * @param  string  $username
     * @return \Illuminate\Http\Response
     */
    public function show(string $username)
    {
        $element = _User::where('username',$username)->first();
        return $element ? response()->json( new _UserResource( $element ) ) : null;
    }

    public function signIn(Request $request)
    {
        // Request Validation
        $validated_data = $request->validate([
            'username' => ['required', 'string', 'min:4', 'max:64'],
            'password' => ['required', 'string', 'min:8', 'max:64'],
        ]);

        // Login attempt
        if (!auth()->attempt($validated_data)){
            return response()->json(['message' => 'Invalid credentials'], 401);
        }

        // Response Structure
        $response = [
            'sysconfig_params_data' => ( new __AuxController )->sysconfig_params()->getData()->data,
            'active_session_data' => null,
            'auth_user_data' => null,
        ];
        $api_auth_user = Auth::user();

        // Handle _Session
        $active_session_data = $request->active_session_data;
        $active_session_data['user_username'] = $api_auth_user->username;
        $response['active_session_data'] = (new _SessionController)->_signUserIn( new Request( $active_session_data ), $active_session_data['token'] );
        // End _Session

        $response['auth_token'] = $api_auth_user->createToken('auth_token')->accessToken;
        $response['auth_user_data'] = new _UserResource( $api_auth_user );

        return response()->json( $response );
    }

    public function signOut(Request $request)
    {
        // Response Structure
        $response = [
            'sysconfig_params_data' => ( new __AuxController )->sysconfig_params()->getData()->data,
            'active_session_data' => null,
            'auth_user_data' => null,
        ];

        // Handle Old _Session
        $active_session_data = $request->active_session_data;
        (new _SessionController)->_signUserOut( new Request( $active_session_data ), $active_session_data['token'] );
        // End Old _Session
        
        // Handle New _Session
        $response['active_session_data'] = (new _SessionController)->store( new Request( [
            'device_info' => $active_session_data['device_info'],
            'agent_app_info' => $active_session_data['agent_app_info'],
        ]))->getData();
        // End New _Session

        return response()->json( $response );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  string  $username
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, string $username)
    {
        $validated_data = $request->validate([
            'tatum_customer_id' => ['sometimes', 'string', 'max:24'],
            'avatar_image_id' => ['sometimes', 'integer'],
        ]);

        $element = _User::where(['username' => $username])->firstOrFail();

        // Handle _Log
        $log_entry_update_result = [];
        foreach ( $validated_data as $key => $value ) {
            if ( in_array( $key, $element->getFillable() ) && $element->{$key} != $value ){
                array_push( $log_entry_update_result, [
                    'field_name' => $key,
                    'old_value' => $element->{$key},
                    'new_value' => $value,
                ]);
            }
        }
        (new _LogController)->store( new Request([
            'action_note' => 'Updating of _User entry in database.',
            'action_type' => 'entry_update',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->username,
            'batch_code' => $request->batch_code,
            'entry_update_result'=> $log_entry_update_result,
        ]));
        // End _Log Handling
        $element->update($validated_data);
        if ($request->expectsJson()) return response()->json( (new _UserResource( $element )) );
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function get_lost_username(Request $request)
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function reset_lost_password(Request $request)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  string  $username
     * @return \Illuminate\Http\Response
     */
    public function destroy(string $username)
    {
        //
    }
}
