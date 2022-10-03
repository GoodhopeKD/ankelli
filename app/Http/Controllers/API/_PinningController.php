<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

use App\Models\_Pinning;
use App\Http\Resources\_PinningResource;
use App\Http\Resources\_PinningResourceCollection;

class _PinningController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validated_data = $request->validate([
            'user_username' => ['required', 'string', 'exists:__users,username'],
            'item_table' => ['required', 'string', Rule::in(['__listings', '__events'])],
            'item_reference_code' => ['required', 'exists:'.$request->item_table.',reference_code', 'string'],
            'pinning_type'      => ['required', 'string', Rule::in(['favourite', 'cart'])],
            'product_quantity'   => ['integer'],
        ]);

        $validated_data['creator_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );

        $element = _Pinning::create($validated_data);
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _Pinning entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        if ($request->expectsJson()) return response()->json( new _PinningResource( $element ) );
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
        $validated_data = $request->validate([
            'pinning_type'      => ['string', Rule::in(['favourite', 'cart'])],
            'product_quantity'   => ['integer'],
        ]);

        $api_auth_user = auth('api')->user();

        $element = _Pinning::findOrFail($id);
        $element->update($validated_data);
        if ($request->expectsJson()) return response()->json( new _PinningResource( $element ) );
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(int $id)
    {
        $api_auth_user = auth('api')->user();
        $element = _Pinning::findOrFail($id);
        if ( $api_auth_user && $api_auth_user->username === $element->user_username){
            $element->delete();
            return response()->json(['success' => 'success'], 200);
        } else {
            return abort(403, 'User not allowed to perform operation');
        }
    }
}
