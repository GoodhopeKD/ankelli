<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

use App\Models\_RegToken;
use App\Http\Resources\_RegTokenResource;

class _RegTokenController extends Controller
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
            $result = _RegToken::where(['_status'=>'active'])
            ->orderByRaw('ifnull(created_datetime) DESC')->paginate(request()->per_page)->withQueryString(); 
        }
        
        if ( $result === null ){
            $simple_query_args = [];

            if ( request()->creator_username ){ $simple_query_args = array_merge( $simple_query_args, [ 'creator_username' => request()->creator_username ]); }

            $eloquent_query = _RegToken::where($simple_query_args);

            $result = $eloquent_query->orderByDesc('created_datetime')->paginate(request()->per_page)->withQueryString();
        }

        return $result ? _RegTokenResource::collection( $result ) : null;
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
            '_status' => ['sometimes', 'string', Rule::in(['active', 'suspended', 'used_up'])],
        ]);

        $load_factory_data = session()->get('load_factory_data');
        $load_factory_data = isset($load_factory_data) ? (boolean)$load_factory_data : null;
        $validated_data['token'] = $load_factory_data ? '1234567890' : random_int(100000, 199999).strtoupper(substr(md5(microtime()),rand(0,9),7));
        $validated_data['creator_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );

        $element = _RegToken::create($validated_data);
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _RegToken entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->token,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        return response()->json( new _RegTokenResource( $element ) );
    }

    /**
     * Display the specified resource.
     *
     * @param  string $token
     * @return \Illuminate\Http\Response
     */
    public function show(string $token)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  string $token
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $token)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  string $token
     * @return \Illuminate\Http\Response
     */
    public function destroy(string $token)
    {
        //
    }
}
