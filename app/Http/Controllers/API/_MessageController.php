<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

use App\Models\_Message;
use App\Http\Resources\_MessageResource;
use App\Http\Resources\_MessageResourceCollection;

class _MessageController extends Controller
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
            'parent_table' => ['sometimes', 'string', Rule::in(['__chats', '__trades'])],
            'parent_uid' => ['required', 'exists:' . $request->parent_table . ','.($request->parent_table=='__chats'?'id':'ref_code').''],
            'body' => ['required', 'string'],
        ]);

        $validated_data['id'] = random_int(100000, 199999).strtoupper(substr(md5(microtime()),rand(0,9),7));
        $validated_data['creator_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );

        $element = _Message::create($validated_data);
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _Message entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => '__messages',
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        return response()->json( new _MessageResource( $element ) );
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
