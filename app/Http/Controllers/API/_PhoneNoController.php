<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

use App\Models\_PhoneNo;
use App\Http\Resources\_PhoneNoResource;
use App\Http\Resources\_PhoneNoResourceCollection;

class _PhoneNoController extends Controller
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
            'parent_table'      => ['required', 'string', Rule::in(['__orders', '__users', '__stores'])],
            'parent_uid'        => ['required', 'string', 'max:64'],
            'country_calling_code'=> ['required', 'string', 'max:4'],
            'number'            => ['required', 'string', 'max:64'],
            'tag'               => ['required', 'string', Rule::in(['whatsapp', 'calls', 'calls_or_whatsapp'])],
        ]);
        $validated_data['creator_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );

        $element = _PhoneNo::create($validated_data);
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _PhoneNo entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => '__phone_nos',
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        return response()->json( new _PhoneNoResource( $element ) );
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
