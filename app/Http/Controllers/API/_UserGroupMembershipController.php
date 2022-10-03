<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

use App\Models\_AdminExtension;

use App\Models\_UserGroupMembership;
use App\Http\Resources\_UserGroupMembershipResource;
use App\Http\Resources\_UserGroupMembershipResourceCollection;

class _UserGroupMembershipController extends Controller
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

            if ( request()->user_group_slug ){ $simple_query_args = array_merge( $simple_query_args, [ 'user_group_slug' => request()->user_group_slug ]); }
            if ( request()->_status && request()->_status !== 'all' ){ $simple_query_args = array_merge( $simple_query_args, [ '_status' => request()->_status ]); }
            if ( !isset(request()->_status) ){ $simple_query_args = array_merge( $simple_query_args, [ '_status' => 'active' ]); }

            $eloquent_query = _UserGroupMembership::where($simple_query_args);

            $result = $eloquent_query->orderByRaw('ifnull(updated_datetime, created_datetime) ASC')->paginate(request()->per_page)->withQueryString();
        }

        return $result ? ( request()->get_with_meta && request()->get_with_meta == true ? _UserGroupMembershipResource::collection( $result ) : new _UserGroupMembershipResourceCollection( $result ) ) : null;
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
            'user_group_slug' => ['required', 'exists:__user_groups,slug', 'string'],
            '_status' => ['sometimes', 'string', Rule::in(['active', 'deactivated'])],
        ]);

        $validated_data['creator_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );

        $creator_admin_extension = _AdminExtension::firstWhere([ 'user_username' => $validated_data['creator_username'] ]);
        if ($creator_admin_extension){
            if ($creator_admin_extension->_status!='active'){
                return abort(422,"Current user cannot add member to any group because _AdminExtension is ".$creator_admin_extension->_status);
            }
        } else {
            return abort(403,"Current user is not an admin");
        }

        $protected_user_groups = [
            'developers' => ['system', 'developer'],
            'system_administrators' => ['system', 'developer', 'sysadmin'],
            'business_administrators' => ['system', 'developer', 'busadmin'],
        ];
        
        foreach ($protected_user_groups as $user_group_slug => $permitted_adders) {
            if ($validated_data['user_group_slug'] == $user_group_slug && !in_array($validated_data['creator_username'], $permitted_adders)){
                return abort(403,"Current user cannot add member to selected group");
            }
        }

        if (in_array($validated_data['user_group_slug'], ['user_administrator', ...array_keys($protected_user_groups)])){
            $new_member_admin_extension = _AdminExtension::firstWhere([ 'user_username' => $validated_data['user_username'] ]);
            if ($new_member_admin_extension){
                if ($new_member_admin_extension->_status!='active'){
                    return abort(422,"User cannot be added to group because _AdminExtension is ".$new_member_admin_extension->_status);
                }
            } else {
                return abort(422,"User needs to be added as admin to be  added to this group");
            }
        }

        $element = _UserGroupMembership::create($validated_data);
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _UserGroupMembership entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        if ($request->expectsJson()) return response()->json( new _UserGroupMembershipResource( $element ) );
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
