<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Carbon;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Stevebauman\Location\Facades\Location;

use App\Models\_Log;

function generate_log_id(){
    return substr(preg_replace('/[^a-zA-Z0-9\']/', '', Hash::make(Str::random(32))),6,16);
}

class _LogController extends Controller
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
        if (!env('LOGGER_DISABLED')){
            $validated_data = $request->validate([
                'action_type' => ['required', 'string', Rule::in(['entry_create', 'entry_read', 'entry_update', 'entry_delete', 'function_call', 'batch_init'])],
                'batch_code' => ['nullable', 'string'],
                'action_note' => ['nullable', 'string'],
                'entry_table' => ['sometimes', 'string'],
                'entry_uid' => ['sometimes', 'required'],
                'entry_update_result' => ['sometimes', 'required_if:action_type,=,entry_update', 'array'],
            ]);

            $log_id = generate_log_id();
            while (_Log::where('id', $log_id)->exists()){
                $log_id = generate_log_id();
            }
            $validated_data['id'] = $log_id;

            if (!isset($validated_data['batch_code']) || (isset($validated_data['batch_code']) && $validated_data['action_type'] == 'batch_init')){
                //$encrypt = Crypt::encryptString;
                $encrypt = function ($in) { return $in; };
                $validated_data['request_location'] = $encrypt(json_encode(Location::get() ? (array)(Location::get()) : [ 'ip' => request()->ip() ]));
                $validated_data['utc_offset'] = session()->get('utc_offset');
            }
            $validated_data['session_token'] = session()->get('active_session_token');
            $validated_data['action_user_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null);

            _Log::create($validated_data);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(int $id)
    {
        //
    }
}
