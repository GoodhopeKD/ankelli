<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Contracts\Encryption\DecryptException;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;

use App\Models\_Session;
use App\Http\Resources\_SessionResource;

class _SessionController extends Controller
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
        $validated_data = $request->validate([
            'device_info'       => ['required', 'array'],
            'agent_app_info'    => ['required', 'array'],
        ]);

        function generate_session_token(){
            return substr(preg_replace('/[^a-zA-Z0-9\']/', '', Hash::make(Str::random(32))),6,16);
        }
        $session_token = generate_session_token();
        while (_Session::where('token', $session_token)->exists()){
            $session_token = generate_session_token();
        }

        //$encrypt = Crypt::encryptString;
        $encrypt = function ($in) { return $in; };
        
        $active_session_data = $validated_data;
        $active_session_data['token'] = $session_token;
        $active_session_data['user_username'] = null;
        $active_session_data['device_info'] = $encrypt(json_encode($validated_data['device_info']));
        $active_session_data['agent_app_info'] = $encrypt(json_encode($validated_data['agent_app_info']));
        $active_session_data['_status'] = 'empty';
        $active_session_data['signin_datetime'] = null;
        $active_session_data['signout_datetime'] = null;

        $element = _Session::create($active_session_data);
        session()->put('active_session_token', $session_token);
        // Handle _Log
        (new _LogController)->store(new Request([
            'action_note' => 'Addition of _Session entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
            'entry_uid' => $session_token,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        return response()->json(new _SessionResource($element));
    }

    public function _signUserIn(Request $request)
    {
        $validated_data = $request->validate([
            'token' => ['required', 'exists:__sessions', 'string'],
            'user_username' => ['required', 'string', 'exists:__users,username'],
            'device_info' => ['required', 'array'],
            'agent_app_info' => ['required', 'array'],
        ]);

        $active_session_data = $validated_data;
        $active_session_data['_status'] = 'active';
        $active_session_data['signin_datetime'] = now()->toDateTimeString();
        $active_session_data['signout_datetime'] = null;

        $element = (new _SessionController)->update(new Request($active_session_data), $active_session_data['token'])->getData();

        // Handle _Log
        (new _LogController)->store(new Request([
            'session_token' => $element->token,
            'action_note' => 'User signin.',
            'action_type' => 'entry_update',
            'entry_table' => '__sessions',
            'entry_uid' => $element->token,
            'entry_update_result'=> [
                [
                    'field_name' => '_status',
                    'old_value' => 'empty',
                    'new_value' => 'active',
                ],
            ],
        ]));
        // End _Log Handling
        return response()->json(new _SessionResource(_Session::find($element->token)));
    }

    public function _signUserOut(Request $request)
    {
        $validated_data = $request->validate([
            'token' => ['required', 'exists:__sessions', 'string'],
            'device_info' => ['required', 'array'],
            'agent_app_info' => ['required', 'array'],
        ]);

        $active_session_data = $validated_data;
        $active_session_data['_status'] = 'ended';
        $active_session_data['signout_datetime'] = now()->toDateTimeString();

        $element = (new _SessionController)->update(new Request($active_session_data), $active_session_data['token'])->getData();

        // Handle _Log
        (new _LogController)->store(new Request([
            'session_token' => $element->token,
            'action_note' => 'User signout.',
            'action_type' => 'entry_update',
            'entry_table' => '__sessions',
            'entry_uid' => $element->token,
            'entry_update_result'=> [
                [
                    'field_name' => '_status',
                    'old_value' => 'active',
                    'new_value' => 'ended',
                ],
            ],
        ]));
        // End _Log Handling
        $utc_offset = session()->get('utc_offset');
        Auth::user()->token()->revoke();
        session()->flush();
        session()->put('utc_offset', $utc_offset);
        return response()->json(new _SessionResource(_Session::find($element->token) ));
    }

    public function _end(Request $request)
    {
        $validated_data = $request->validate([
            'token' => ['required', 'exists:__sessions', 'string'],
            'user_username' => ['required', 'string', 'exists:__users,username'],
        ]);

        $active_session_data = $validated_data;
        $active_session_data['remote_end'] = true;
        $active_session_data['_status'] = 'ended';
        $active_session_data['signout_datetime'] = now()->toDateTimeString();

        $element = (new _SessionController)->update(new Request($active_session_data), $active_session_data['token'])->getData();

        // Handle _Log
        (new _LogController)->store(new Request([
            'session_token' => $element->token,
            'action_note' => 'Ending of active _Session',
            'action_type' => 'entry_update',
            'entry_table' => '__sessions',
            'entry_uid' => $element->token,
            'entry_update_result'=> [
                [
                    'field_name' => '_status',
                    'old_value' => 'active',
                    'new_value' => 'ended',
                ],
            ],
        ]));
        // End _Log Handling
        return response()->json(new _SessionResource(_Session::find($element->token)));
    }

    /**
     * Display the specified resource.
     *
     * @param  string  $token
     * @return \Illuminate\Http\Response
     */
    public function show(string $token)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  string  $token
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $token)
    {
        $validated_data = $request->validate([
            'user_username' => ['sometimes', 'required', 'string', 'exists:__users,username'],
            'device_info' => ['sometimes', 'array'],
            'agent_app_info' => ['sometimes', 'array'],
            '_status' => ['string', Rule::in(['empty', 'active', 'ended'])],
            'signin_datetime' => ['sometimes', 'date:Y-m-d H:i:s|nullable'],
            'signout_datetime' => ['nullable', 'date:Y-m-d H:i:s'],

            'default_route' => ['sometimes', 'boolean'],
            'remote_end' => ['sometimes', 'boolean'],
        ]);

        $api_auth_user = Auth::user();
        $api_auth_user_username = $api_auth_user ? $api_auth_user->username: null;

        $element = _Session::findOrFail($token);
        /*$check_array = ['token' => $token];

        if (isset($validated_data['remote_end']) && $validated_data['remote_end']){
            $check_array['user_username'] = $element->user_username;
            $check_array['_status'] = 'active';
        } else {
            if (!(isset($validated_data['default_route']) && $validated_data['default_route'])){
                $check_array['token'] = request()->header('x-session-token');
            }
            $check_array['user_username'] = $element->user_username ? $api_auth_user_username : null;
        }

        if (!_Session::where($check_array)->exists()){
            return abort(422, 'Session props mismatch');
        }*/

        if ($api_auth_user_username){
            session()->put('api_auth_user_username', $api_auth_user_username);
        }

        //$encrypt = Crypt::encryptString;
        $encrypt = function ($in) { return $in; };

        $validated_data['device_info'] = $encrypt(json_encode($validated_data['device_info']));
        $validated_data['agent_app_info'] = $encrypt(json_encode($validated_data['agent_app_info']));

        $element->update($validated_data);

        return response()->json(new _SessionResource($element));
    }
}
