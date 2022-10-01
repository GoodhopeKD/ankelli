<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

use App\Models\_AdminExtension;
use App\Http\Resources\_AdminExtensionResource;
use App\Http\Resources\_AdminExtensionResourceCollection;

class _AdminExtensionController extends Controller
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
            'user_username' => ['required', 'string', 'exists:__users,username'],
            'post_title' => ['required', 'string'],
            '_status' => ['sometimes', 'string', Rule::in(['active', 'suspended', 'deactivated'])],
        ]);

        $validated_data['creator_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );

        $element = _AdminExtension::create($validated_data);
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _AdminExtension entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->user_username,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling

        if ($request->expectsJson()) return response()->json( new _AdminExtensionResource( $element ) );
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
