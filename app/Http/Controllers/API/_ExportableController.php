<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\_Exportable;
use App\Http\Resources\_ExportableResource;
use App\Http\Resources\_ExportableResourceCollection;

class _ExportableController extends Controller
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

            if (request()->_status && request()->_status !== 'all') { $simple_query_args = array_merge($simple_query_args, [ '_status' => request()->_status ]); }
            if (!isset(request()->_status)) { $simple_query_args = array_merge($simple_query_args, [ '_status' => 'active' ]); }

            $eloquent_query = _Exportable::where($simple_query_args);

            $result = $eloquent_query->orderByRaw('ifnull(updated_datetime, created_datetime) DESC')->paginate(request()->per_page ?? count($eloquent_query->get()))->withQueryString();
        }

        return $result ? (request()->get_with_meta && request()->get_with_meta == true ? _ExportableResource::collection($result) : new _ExportableResourceCollection($result)) : null;
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
