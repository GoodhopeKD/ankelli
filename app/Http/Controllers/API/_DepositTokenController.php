<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

use App\Models\_Asset;

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
        $result = null;

        if ( $result === null && request()->get_as_addon_prop && request()->get_as_addon_prop == true ){
            $result = _DepositToken::where(['_status'=>'active'])
            ->orderByRaw('ifnull(used_datetime, created_datetime) DESC')->paginate(request()->per_page)->withQueryString(); 
        }
        
        if ( $result === null ){
            $simple_query_args = [];

            if ( request()->currency_code ){ $simple_query_args = array_merge( $simple_query_args, [ 'currency_code' => request()->currency_code ]); }
            if ( request()->asset_code ){ $simple_query_args = array_merge( $simple_query_args, [ 'asset_code' => request()->asset_code ]); }
            if ( request()->creator_username ){ $simple_query_args = array_merge( $simple_query_args, [ 'creator_username' => request()->creator_username ]); }

            $eloquent_query = _DepositToken::where($simple_query_args);

            if ( request()->_status && request()->_status == 'unused' ){ $eloquent_query->whereNull('used_datetime'); }
            if ( request()->_status && request()->_status == 'used' ){ $eloquent_query->whereNotNull('used_datetime'); }

            $result = $eloquent_query->orderByRaw('ifnull(used_datetime, created_datetime) DESC')->paginate(request()->per_page)->withQueryString();
        }

        return $result ? ( request()->get_with_meta && request()->get_with_meta == true ? _DepositTokenResource::collection( $result ) : new _DepositTokenResourceCollection( $result ) ) : null;
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
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->token,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        if ($request->expectsJson()) return response()->json( new _DepositTokenResource( $element ) );
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
     * @param  string  $token
     * @param  string  $asset_code
     * @return \Illuminate\Http\Response
     */
    public function use(string $token, string $asset_code)
    {
        $asset = _Asset::firstWhere(['code' => $asset_code]);
        if (!$asset){
            return abort(422,"Asset not valid.");
        }
        $validated_data['asset_code'] = $asset_code;

        $element = _DepositToken::find($token);

        if (!$element){
            return abort(422,"Token not valid.");
        }

        if ($element->asset_code != $validated_data['asset_code']){
            return abort(422,"Token not valid for selected asset.");
        }

        if ($element->used_datetime){
            return abort(422,"Token already used.");
        }

        $validated_data['user_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );
        $validated_data['used_datetime'] = now()->toDateTimeString();

        (new _TransactionController)->store( new Request([
            'txn_context' => 'offchain',
            'operation_slug' => 'deposit_token_topup',
            'recipient_username' => $validated_data['user_username'], 
            'recipient_note' => 'Wallet topup using deposit token "'.$token.'"',
            'sender_username' => 'reserves', 
            'sender_note' => 'Wallet topup using deposit token "'.$token.'"',
            'asset_code' => $element->asset_code,
            'xfer_asset_value' => $element->asset_value,
        ]));

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
            'action_note' => 'Updating of _DepositToken entry in database.',
            'action_type' => 'entry_update',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->token,
            'entry_update_result'=> $log_entry_update_result,
        ]));
        // End _Log Handling
        $element->update($validated_data);
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
