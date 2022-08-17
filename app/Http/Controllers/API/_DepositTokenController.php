<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

use App\Models\_DepositToken;
use App\Http\Resources\_DepositTokenResource;
use App\Http\Resources\_DepositTokenResourceCollection;

class _DepositTokenController extends Controller
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
            'asset_code' => ['required', 'exists:__assets,code', 'string'],
            'asset_value' => ['required', 'numeric'],
            'currency_code' => ['required', 'exists:__currencies,code', 'string'],
            'currency_amount' => ['required', 'integer'],
        ]);
        $validated_data['token'] = random_int(100000, 199999).strtoupper(substr(md5(microtime()),rand(0,9),7));
        $validated_data['creator_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );

        $element = _DepositToken::create($validated_data);
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _DepositToken entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => '__deposit_tokens',
            'entry_uid' => $element->token,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        return response()->json( new _DepositTokenResource( $element ) );
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
    public function use(Request $request, $token)
    {
        $validated_data = $request->validate([
            'asset_code' => ['required', 'exists:__assets,code', 'string'],
        ]);

        $element = _DepositToken::find($token);

        if ($element->asset_code != $validated_data['asset_code']){
            return abort(422,"Token not valid for selected asset.");
        }

        if ($element->used_datetime){
            return abort(422,"Already used.");
        }

        $validated_data['user_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );
        $validated_data['used_datetime'] = now()->toDateTimeString();

        (new _TransactionController)->store( new Request([
            'note' => 'Deposit token topup.',
            'source_user_username' => 'ankelli', 
            'destination_user_username' => $validated_data['user_username'], 
            'asset_code' => $element->asset_code,
            'source_account_transfer_value' => $element->asset_value,
        ]));

        // Handle _Log
        $log_entry_update_result = [];
        foreach ( $validated_data as $key => $value ) {
            if ( $element->{$key} != $value ){
                array_push( $log_entry_update_result, [
                    'field_name' => $key,
                    'old_value' => $element->{$key},
                    'new_value' => $value,
                ]);
            }
        }
        (new _LogController)->store( new Request([
            'action_note' => 'Updating of _DepositToken entry in database.',
            'action_type' => 'entry_update',
            'entry_table' => '__deposit_tokens',
            'entry_uid' => $element->token,
            'batch_code' => $request->batch_code,
            'entry_update_result'=> $log_entry_update_result,
        ]));
        // End _Log Handling

        $element->update($validated_data);

        // End _Log Handling
        return response()->json( new _DepositTokenResource( $element ) );
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  string  $token
     * @return \Illuminate\Http\Response
     */
    public function destroy(string $token)
    {
        //
    }
}
