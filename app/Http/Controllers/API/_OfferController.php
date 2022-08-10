<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\_Offer;
use App\Http\Resources\_OfferResource;
use App\Http\Resources\_OfferResourceCollection;


class _OfferController extends Controller
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
            $result = _Offer::where(['status'=>'online'])
            ->orderByRaw('ifnull(updated_datetime, created_datetime) DESC')->paginate()->withQueryString(); 
        }

        if ( $result === null ){
            $simple_query_args = [];

            if ( request()->offers_to ){ $simple_query_args = array_merge( $simple_query_args, [ 'offer_to' => request()->offers_to ]); }
            if ( request()->status && request()->status !== 'all' ){ $simple_query_args = array_merge( $simple_query_args, [ 'status' => request()->status ]); }
            if ( !isset(request()->status) ){ $simple_query_args = array_merge( $simple_query_args, [ 'status' => 'online' ]); }

            $eloquent_query = _Offer::where($simple_query_args);

            $result = $eloquent_query->orderByRaw('ifnull(updated_datetime, created_datetime) DESC')->paginate()->withQueryString(); 
        }

        return $result ? ( request()->get_with_meta && request()->get_with_meta == true ? _OfferResource::collection( $result ) : new _OfferResourceCollection( $result ) ) : null;
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
