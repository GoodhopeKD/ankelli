<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

use App\Models\_PrefItem;

use App\Models\_Asset;
use App\Http\Resources\_AssetResource;
use App\Http\Resources\_AssetResourceCollection;

class _AssetController extends Controller
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

            if ( request()->_status && request()->_status !== 'all' ){ $simple_query_args = array_merge( $simple_query_args, [ '_status' => request()->_status ]); }
            if ( !isset(request()->_status) ){ $simple_query_args = array_merge( $simple_query_args, [ '_status' => 'active' ]); }

            $eloquent_query = _Asset::where($simple_query_args);

            $result = $eloquent_query->orderByRaw('ifnull(updated_datetime, created_datetime) DESC')->paginate(request()->per_page ?? count($eloquent_query->get()))->withQueryString();
        }

        return $result ? ( request()->get_with_meta && request()->get_with_meta == true ? _AssetResource::collection( $result ) : new _AssetResourceCollection( $result ) ) : null;
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
            'name' => ['required', 'string', 'max:64'],
            'code' => ['required', 'string', 'max:64'],
            'smallest_display_unit' => ['required', 'numeric'],
            'onchain_disclaimer' => ['required', 'string'],
            'tatum_currency' => ['required', 'string', 'max:64'],
            '_status' => ['sometimes', 'string', Rule::in(['active', 'frozen'])],
        ]);

        $validated_data['creator_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );

        if ( _PrefItem::firstWhere('key_slug', 'use_tatum_api')->value_f() ){
            $tatum_element = (new __TatumAPIController)->getOrCreateBlockchainWallet(new Request(['asset_code' => $validated_data['code']]))->getData();
            $validated_data['tatum_mnemonic'] = $tatum_element->mnemonic;
            $validated_data['tatum_xpub'] = $tatum_element->xpub;
        }
        $element = _Asset::create($validated_data);
        
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _Asset entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        return response()->json( new _AssetResource( $element ) );
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

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, int $id)
    {
        //
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
