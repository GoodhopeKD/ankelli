<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\_EmailAddress;
use App\Http\Resources\_EmailAddressResource;
use App\Http\Resources\_EmailAddressResourceCollection;

class _EmailAddressController extends Controller
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
            'email_address' => ['required', 'string', 'min:5', 'max:64', 'email', 'unique:__email_addresses'],
            'user_username' => ['required', 'string', 'exists:__users,username'],
        ]);
        $element = _EmailAddress::create($validated_data);
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _EmailAddress entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->email_address,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        if ($request->expectsJson()) return response()->json( new _EmailAddressResource( $element ) );
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
