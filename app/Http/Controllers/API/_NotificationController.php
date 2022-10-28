<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
//use Mail;
use Illuminate\Support\Facades\Mail;

use App\Models\_Notification;
use App\Models\_User;
use App\Models\_PrefItem;
use App\Http\Resources\_NotificationResource;

class _NotificationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $result = null;
      
        if ($result === null) {
            $simple_query_args = [];

            if (request()->user_username) { $simple_query_args = array_merge($simple_query_args, [ 'user_username' => request()->user_username ]); }

            $eloquent_query = _Notification::where($simple_query_args);

            if (request()->_status && request()->_status == 'unread') { $eloquent_query->whereNull('read_datetime'); }
            if (request()->_status && request()->_status == 'read') { $eloquent_query->whereNotNull('read_datetime'); }
          
            $result = $eloquent_query->orderByDesc('created_datetime')->paginate(request()->per_page)->withQueryString();
        }

        return $result ? _NotificationResource::collection($result) : null;
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
            'content' => ['required', 'array'],
            'content.title' => ['required', 'string'],
            'content.subtitle' => ['sometimes', 'string'],
            'content.body' => ['required', 'string'],
        ]);
        // Create uid
        $validated_data['id'] = random_int(100000, 199999).strtoupper(substr(md5(microtime()),rand(0,9),7));

        $element = _Notification::create($validated_data);

        $email_address = _User::firstWhere(['username' => $validated_data['user_username']])->email_address;

        if (!_PrefItem::where(['parent_table' => '__email_addresses', 'parent_uid' => $email_address, 'key_slug' => 'receive_notifications', 'value' => 0])->exists()){
            Mail::send('mail', $validated_data, function($message) use($email_address, $validated_data) {
                $message->to($email_address, $validated_data['user_username'])->subject($validated_data['content']['title']);
                $message->from('noreply@ankelli.com', 'Ankelli platform');
            });
        }

        // Handle _Log
        (new _LogController)->store(new Request([
            'action_note' => 'Addition of _Notification entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        if ($request->expectsJson()) return response()->json(new _NotificationResource($element));
    }

    /**
     * Display the specified resource.
     *
     * @param  string $id
     * @return \Illuminate\Http\Response
     */
    public function show(string $id)
    {
        $element = _Notification::find($id);
        if (!$element) return abort(404, 'Notification with specified id not found');
        if (!$element->read_datetime) {
            $element->update(['read_datetime' => now()->toDateTimeString()]);
        }
        return response()->json(new _NotificationResource($element));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  string  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  string  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(string $id)
    {
        //
    }
}
