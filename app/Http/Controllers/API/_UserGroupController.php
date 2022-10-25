<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\_UserGroup;
use App\Http\Resources\_UserGroupResource;
use App\Http\Resources\_UserGroupResourceCollection;

class _UserGroupController extends Controller
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

            $eloquent_query = _UserGroup::where($simple_query_args);

            $result = $eloquent_query->orderByRaw('ifnull(updated_datetime, created_datetime) DESC')->paginate(request()->per_page ?? count($eloquent_query->get()))->withQueryString();
        }

        return $result ? (request()->get_with_meta && request()->get_with_meta == true ? _UserGroupResource::collection($result) : new _UserGroupResourceCollection($result)) : null;
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
     * @param  string $slug
     * @return \Illuminate\Http\Response
     */
    public function show(string $slug)
    {
        $element = _UserGroup::firstWhere('slug',$slug);
        return response()->json(new _UserGroupResource($element));
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
