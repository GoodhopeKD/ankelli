<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

use App\Models\_AssetWallet;
use App\Http\Resources\_AssetWalletResource;
use App\Http\Resources\_AssetWalletResourceCollection;

class _AssetWalletController extends Controller
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
            'user_username' => ['required', 'exists:__users,username', 'string'],
            'asset_code' => ['required', 'exists:__assets,code', 'string'],
            '_status' => ['sometimes', 'string', Rule::in(['active', 'frozen'])],
        ]);

        $element = _AssetWallet::create($validated_data);
        $element = _AssetWallet::find($element->id);
        
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _AssetWallet entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        return response()->json( new _AssetWalletResource( $element ) );
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(int $id)
    {
        $element = _AssetWallet::findOrFail($id);
        return response()->json( new _AssetWalletResource( $element ) );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, int $id)
    {
        $validated_data = $request->validate([
            'asset_value' => ['sometimes', 'numeric'],
            '_status' => ['sometimes', 'string', Rule::in(['active', 'frozen'])],
        ]);

        $element = _AssetWallet::findOrFail($id);

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
            'action_note' => 'Updating of _AssetWallet entry in database.',
            'action_type' => 'entry_update',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
            'entry_update_result'=> $log_entry_update_result,
        ]));
        // End _Log Handling

        $element->update($validated_data);

        return response()->json( new _AssetWalletResource( $element ) );
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(int $id)
    {
        //
    }
}
