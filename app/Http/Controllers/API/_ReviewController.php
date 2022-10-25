<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

use App\Models\_Review;
use App\Http\Resources\_ReviewResource;
use App\Http\Resources\_ReviewResourceCollection;

class _ReviewController extends Controller
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

            if (request()->parent_table) { $simple_query_args = array_merge($simple_query_args, [ 'parent_table' => request()->parent_table ]); }
            if (request()->parent_uid) { $simple_query_args = array_merge($simple_query_args, [ 'parent_uid' => request()->parent_uid ]); }
            if (request()->pivot_parent_table) { $simple_query_args = array_merge($simple_query_args, [ 'pivot_parent_table' => request()->pivot_parent_table ]); }
            if (request()->pivot_parent_uid) { $simple_query_args = array_merge($simple_query_args, [ 'pivot_parent_uid' => request()->pivot_parent_uid ]); }
            if (request()->creator_username) { $simple_query_args = array_merge($simple_query_args, [ 'creator_username' => request()->creator_username ]); }

            $eloquent_query = _Review::where($simple_query_args);

            $result = $eloquent_query->orderByRaw('ifnull(updated_datetime, created_datetime) DESC')->paginate(request()->per_page)->withQueryString();
        }

        return $result ? (request()->get_with_meta && request()->get_with_meta == true ? _ReviewResource::collection($result) : new _ReviewResourceCollection($result)) : null;
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
            'parent_table' => ['required', 'string', Rule::in(['__users', '__merchants'])],
            'parent_uid' => ['required', 'string', 'max:64'],
            'pivot_parent_table' => ['sometimes', 'string', Rule::in(['__trades', '__orders'])],
            'pivot_parent_uid' => ['sometimes', 'string', 'max:64'],
            'rating' => ['required', 'integer', 'between:1,5'],
            'comment' => ['sometimes', 'nullable', 'string', 'max:255'],
        ]);
        $validated_data['creator_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null);

        $element = _Review::create($validated_data);
        // Handle _Log
        (new _LogController)->store(new Request([
            'action_note' => 'Addition of _Review entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        if ($request->expectsJson()) return response()->json(new _ReviewResource($element));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(int $id)
    {
        $element = _Review::find($id);
        if (!$element) return abort(404, 'Review with specified id not found');
        return response()->json(new _ReviewResource($element));
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
            'update_note' => ['required', 'string', 'max:255'],
            'rating' => ['sometimes', 'integer', 'between:1,5'],
            'comment' => ['sometimes', 'string', 'max:255'],
        ]);

        $element = _Review::findOrFail($id);

        // Handle _Log
        $log_entry_update_result = [];
        foreach ($validated_data as $key => $value) {
            if (in_array($key, $element->getFillable()) && $element->{$key} != $value) {
                array_push($log_entry_update_result, [
                    'field_name' => $key,
                    'old_value' => $element->{$key},
                    'new_value' => $value,
                ]);
            }
        }
        if (!count($log_entry_update_result)) return abort(422, 'No values were updated');
        (new _LogController)->store(new Request([
            'action_note' => $request->update_note,
            'action_type' => 'entry_update',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
            'entry_update_result'=> $log_entry_update_result,
        ]));
        // End _Log Handling
        $element->update($validated_data);
        if ($request->expectsJson()) return response()->json(new _ReviewResource($element));
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
