<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\_Currency;
use App\Http\Resources\_CurrencyResource;
use App\Http\Resources\_CurrencyResourceCollection;

class _CurrencyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $result = null;

        if ( $result === null && request()->get_as_addon_prop && request()->get_as_addon_prop == true ){
            $result = _Currency::where(['status'=>'active'])
            ->orderByRaw('ifnull(updated_datetime, created_datetime) DESC')->paginate()->withQueryString(); 
        }

        if ( $result === null ){
            $simple_query_args = [];

            if ( request()->status && request()->status !== 'all' ){ $simple_query_args = array_merge( $simple_query_args, [ 'status' => request()->status ]); }
            if ( !isset(request()->status) ){ $simple_query_args = array_merge( $simple_query_args, [ 'status' => 'active' ]); }

            $eloquent_query = _Currency::where($simple_query_args);

            $result = $eloquent_query->orderByRaw('ifnull(updated_datetime, created_datetime) DESC')->paginate(1000)->withQueryString(); 
        }

        return $result ? ( request()->get_with_meta && request()->get_with_meta == true ? _CurrencyResource::collection( $result ) : new _CurrencyResourceCollection( $result ) ) : null;
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
