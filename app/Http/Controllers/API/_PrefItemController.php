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

            $result = $eloquent_query->orderByRaw('ifnull(updated_datetime, created_datetime) DESC')->get(); 
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
