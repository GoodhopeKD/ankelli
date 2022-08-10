<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Validation\Rule;

use App\Models\_Session;
use App\Http\Resources\_SessionResource;

use App\Models\_PrefItem;
use App\Models\_RegToken;
use App\Models\_EmailAddress;
use App\Models\_Log;

use App\Models\_User;
use App\Http\Resources\_UserResource;

class _UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $token_reg_enabled = (boolean)_PrefItem::where('key_slug','token_reg_enabled')->first()->value;
        // Request Validation
        $validated_data = $request->validate([
            'reg_token' => [$token_reg_enabled ? 'required' : 'sometimes', 'string', 'max:16'],
            'username' => ['required', 'string', 'min:4', 'max:64'],
            'email_address' => ['required', 'string', 'email', 'max:64'],
            'password' => ['required', 'string', 'min:8', 'max:32', 'confirmed'],
        ]);

        if ( $token_reg_enabled ){
            $reg_token_check = (array)(new __AuxController)->availability_check( new Request([ 'check_param_name' => 'reg_token', 'check_param_value' => $validated_data['reg_token'] ]) )->getData();
            if (!$reg_token_check['usable']){
                return abort(422, $reg_token_check['message']);
            }
        }

        $username_check = (array)(new __AuxController)->availability_check( new Request([ 'check_param_name' => 'username', 'check_param_value' => $validated_data['username'] ]) )->getData();
        if (!$username_check['usable']){
            return abort(422, $username_check['message']);
        }

        $email_address_check = (array)(new __AuxController)->availability_check( new Request([ 'check_param_name' => 'email_address', 'check_param_value' => $validated_data['email_address'] ]) )->getData();
        if (!$email_address_check['usable']){
            return abort(422, $email_address_check['message']);
        }

        // Response Structure
        $response = [
            'sysconfig_params_data' => ( new __AuxController )->sysconfig_params_data()->getData()->data,
            'active_session_data' => null,
            'auth_user_data' => null,
        ];

        $validated_data['password'] = bcrypt($request->password);
        $api_auth_user = _User::create($validated_data);

        Session::put( 'action_user_username', $validated_data['username'] );

        // Initialise _Log Batch Handling
        $log_batch_code = random_int(100000, 199999).strtoupper(substr(md5(microtime()),rand(0,9),7));
        while ( _Log::where( 'batch_code', $log_batch_code )->exists() ){
            $log_batch_code = random_int(100000, 199999).strtoupper(substr(md5(microtime()),rand(0,9),7));
        }
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

        // Create _User's Email Address
        (new _EmailAddressController)->store( new Request([
            'email_address' => $api_auth_user->email_address,
            'user_username' => $api_auth_user->username,
            'batch_code' => $log_batch_code,
        ]));
        // End Create _User's Email Address

        // Create notification to verify email
        (new _NotificationController)->store( new Request([
            'user_username' => $api_auth_user->username,
            'content' => [
                'title' => 'Welcome Note.',
                'subtitle' => 'Welcome to the Eureka E-commerce Platform',
                'body' => "We as the Eureka Team welcome you to our E-commerce platform.\nPlease, enjoy the services we have prepared for you.\nTo get the most out of your experience here, start by verifying your email address."
            ],
            'batch_code' => $log_batch_code,
        ]));
        // End Create notification to verify email

        // Handle _Session
        $active_session_data = $request->active_session_data;
        $active_session_data['user_username'] = $api_auth_user->username;
        $response['active_session_data'] = new _SessionResource((new _SessionController)->_signUserIn( new Request( $active_session_data ), $active_session_data['token'] ));
        // End _Session Handling

        $response['auth_token'] = $api_auth_user->createToken('auth_token')->accessToken;
        $response['auth_user_data'] = new _UserResource( $api_auth_user );

        return response()->json( $response );
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
            'sysconfig_params_data' => ( new __AuxController )->sysconfig_params_data()->getData()->data,
            'active_session_data' => null,
            'auth_user_data' => null,
        ];
        $api_auth_user = Auth::user();

        // Handle _Session
        $active_session_data = $request->active_session_data;
        $active_session_data['user_username'] = $api_auth_user->username;
        $response['active_session_data'] = new _SessionResource((new _SessionController)->_signUserIn( new Request( $active_session_data ), $active_session_data['token'] ));
        // End _Session

        $response['auth_token'] = $api_auth_user->createToken('auth_token')->accessToken;
        $response['auth_user_data'] = new _UserResource( $api_auth_user );

        return response()->json( $response );
    }

    public function signOut(Request $request)
    {
        // Response Structure
        $response = [
            'sysconfig_params_data' => ( new __AuxController )->sysconfig_params_data()->getData()->data,
            'active_session_data' => null,
            'auth_user_data' => null,
        ];

        // Handle Old _Session
        $active_session_data = $request->active_session_data;
        $active_session = (new _SessionController)->_signUserOut( new Request( $active_session_data ), $active_session_data['token'] );
        // End Old _Session
        
        // Handle New _Session
        $response['active_session_data'] = new _SessionResource((new _SessionController)->store( new Request( [
            'device_info' => $active_session_data['device_info'],
            'agent_app_info' => $active_session_data['agent_app_info'],
        ])));
        // End New _Session

        return response()->json( $response );
    }

    public function check(Request $request)
    {
        switch ($request->check_param_name) {
            case 'reg_token':
                $reg_token = _RegToken::find( $request->check_param_value );
                $usable = $reg_token && $reg_token->status === 'active' && count(_User::where('reg_token',$request->check_param_value)->get()) <= (integer)_PrefItem::where('key_slug','reg_token_max_use_count')->first()->value;
                $message = $usable ? 'Reg token available for use.' : ($reg_token ? ($reg_token->status === 'available' ? 'Reg token used up.' : 'Reg token has status "'.$reg_token->status.'".') : 'Reg token not found.');
                break;

            case 'username':
                $reserved_usernames = ['ankelli','goodhope','admin','administrator', 'sysadmin', 'system'];
                $usable = !_User::where('username', $request->check_param_value )->exists() && !in_array( $request->check_param_value , $reserved_usernames );
                $message = $usable ? 'Username available for use.' : ( in_array( $request->check_param_value , $reserved_usernames ) ? 'Chosen username is reserved word and can\'t be used.' : 'Username already in use in the system.');
                break;

            case 'email_address':
                $usable = !(_User::where('email_address', $request->check_param_value )->exists() || _EmailAddress::where('email_address', $request->check_param_value )->exists());
                $message = $usable ? 'Email address available for use.' : 'Email address already exists in database.';
                break;
            
            default:
                $usable = null;
                $message = 'Check param not recognized.';
                break;
        }

        $response = [
            "usable" => $usable,
            "message" => $message,
        ];
        return response()->json( $response );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
