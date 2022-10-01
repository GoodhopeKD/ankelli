<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\_PrefItem;
use App\Http\Resources\_PrefItemResource;
use App\Http\Resources\_PrefItemResourceCollection;

class _PrefItemController extends Controller
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

            if ( request()->parent_table ){ $simple_query_args = array_merge( $simple_query_args, [ 'parent_table' => request()->parent_table ]); }
            if ( request()->parent_uid ){ $simple_query_args = array_merge( $simple_query_args, [ 'parent_uid' => request()->parent_uid ]); }

            $eloquent_query = _PrefItem::where($simple_query_args);

            $result = $eloquent_query->orderByDesc('created_datetime')->get(); 
        }

        return $result ? ( request()->get_with_meta && request()->get_with_meta == true ? _PrefItemResource::collection( $result ) : new _PrefItemResourceCollection( $result ) ) : null;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
            'update_note' => ['required', 'string', 'max:255'],
            'value' => ['required'],
            'value_type' => ['required', 'string', 'max:64'],
        ]);

        $element = _PrefItem::findOrFail($id);
        if ($element->value_type !== $validated_data['value_type']){
            abort(422, 'Value type mismatch');
        }

        // Handle _Log
        $log_entry_update_result = [];
        foreach ( $validated_data as $key => $value ) {
            if ( in_array( $key, $element->getFillable() ) && $element->{$key} != $value ){
                array_push( $log_entry_update_result, [
                    'field_name' => $key,
                    'old_value' => $element->{$key},
                    'new_value' => $value,
                ]);
            }
        }
        (new _LogController)->store( new Request([
            'action_note' => $request->update_note,
            'action_type' => 'entry_update',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
            'entry_update_result'=> $log_entry_update_result,
        ]));
        // End _Log Handling
        $element->update($validated_data);
        if ($request->expectsJson()) return response()->json( new _PrefItemResource( $element ) );
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
