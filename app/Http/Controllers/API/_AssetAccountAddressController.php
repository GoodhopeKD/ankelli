<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\_AssetAccount;

use App\Models\_AssetAccountAddress;
use App\Http\Resources\_AssetAccountAddressResource;
use App\Http\Resources\_AssetAccountAddressResourceCollection;

class _AssetAccountAddressController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $result = null;
        
        if ( $result === null ){
            $simple_query_args = [];

            if ( request()->asset_account_id ){ $simple_query_args = array_merge( $simple_query_args, [ 'asset_account_id' => request()->asset_account_id ]); }

            $eloquent_query = _AssetAccountAddress::where($simple_query_args);
            
            $result = $eloquent_query->orderByDesc('created_datetime')->paginate(request()->per_page)->withQueryString();
        }

        return $result ? _AssetAccountAddressResource::collection( $result ) : null;
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
            'asset_account_id' => ['required', 'integer', 'exists:__asset_accounts,id'],
            'blockchain_address' => ['sometimes', 'string'],
            'tatum_derivation_key' => ['sometimes', 'integer'],
        ]);

        if ( !( isset($validated_data['blockchain_address']) && isset($validated_data['tatum_derivation_key'])) ){
            $asset_account = _AssetAccount::find($validated_data['asset_account_id'])->makeVisible(['tatum_virtual_account_id']);
            $tatum_element = (new __TatumAPIController)->createVirtualAccountDepositAddress(new Request(['virtual_account_id' => $asset_account->tatum_virtual_account_id]))->getData();
            $validated_data['blockchain_address'] = $tatum_element->address;
            $validated_data['tatum_derivation_key'] = $tatum_element->derivationKey;
        }

        $element = _AssetAccountAddress::create($validated_data);
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _AssetAccountAddress entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        return response()->json( new _AssetAccountAddressResource( $element ) );
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
