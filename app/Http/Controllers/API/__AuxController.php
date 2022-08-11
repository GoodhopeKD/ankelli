<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Stevebauman\Location\Facades\Location;

use App\Models\_Session;
use App\Http\Resources\_SessionResource;

use App\Models\_RegToken;
use App\Models\_EmailAddress;

use App\Models\_User;
use App\Http\Resources\_UserResource;

use App\Models\_PrefItem;

class __AuxController extends Controller
{
    /**
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function default_route(Request $request)
    {
        $scaffolding_app_enabled_pref_item = _PrefItem::where('key_slug','scaffolding_app_enabled')->first();

        if ( $scaffolding_app_enabled_pref_item && $scaffolding_app_enabled_pref_item->value ){
            $request->validate([
                'active_session_data.token' => ['sometimes', 'string' ],
                'active_session_data.device_info' => ['required', 'array'],
                'active_session_data.agent_app_info' => ['required', 'array'],
                'active_session_data.utc_offset' => ['required', 'string'],
            ]);
        
            Session::put('utc_offset', $request->active_session_data['utc_offset']);
        
            // Response Structure
            $response = [
                //'sysconfig_params_data' => ( new __AuxController )->sysconfig_params()->getData()->data,
                //'datalists_data' => ( new __AuxController )->datalists()->getData(),
                'active_session_data' => null,
                'auth_user_data' => null,
            ];
        
            // Auth user
            $api_auth_user = auth('api')->user();
            if ($api_auth_user){
                $response['auth_user_data'] = new _UserResource( $api_auth_user );
            }
        
            // Active session
            $active_session_data = $request->active_session_data;
            if ($active_session_data){
                $active_session_data['request_location'] = Location::get() ? (array)(Location::get()) : [ 'ip' => $request->ip() ];
                if ( isset($active_session_data['token']) && _Session::where('token', $active_session_data['token'] )->exists() && _Session::find($active_session_data['token'])['_status'] !== 'ended' ){
                    $active_session_data['default_route'] = true;
                    $response['active_session_data'] = new _SessionResource(( new _SessionController )->update( new Request( array_filter( $active_session_data) ), $active_session_data['token'] ));
                } else {
                    $response['active_session_data'] = new _SessionResource(( new _SessionController )->store( new Request( array_filter( $active_session_data) ) ));
                }     
            }
        
            return response()->json( $response );
        } else {
            return response()->json([
                'message' => 'Scaffolding app disabled',
            ]);
        }
    }

    public function reserved_usernames()
    {
        return ['ankelli','goodhope','admin','administrator', 'sysadmin', 'system'];
    }

    public function availability_check(Request $request)
    {
        switch ($request->check_param_name) {
            case 'reg_token':
                $reg_token = _RegToken::find( $request->check_param_value );
                $usable = $reg_token && $reg_token->_status === 'active' && count(_User::where('reg_token',$request->check_param_value)->get()) <= (integer)_PrefItem::where('key_slug','reg_token_max_use_count')->first()->value;
                $message = $usable ? 'Reg token available for use.' : ($reg_token ? ($reg_token->_status === 'available' ? 'Reg token used up.' : 'Reg token has _status "'.$reg_token->_status.'".') : 'Reg token not found.');
                break;

            case 'username':
                $reserved_usernames = (new __AuxController)->reserved_usernames();
                $usable = !_User::where('username', $request->check_param_value )->exists() && !in_array( $request->check_param_value , $reserved_usernames );
                $message = $usable ? 'Username available for use.' : ( in_array( $request->check_param_value , $reserved_usernames ) ? 'Chosen username is reserved word and can\'t be used.' : 'Username already in use in the system.');
                break;

            case 'email_address':
                $usable = !(_User::where('email_address', $request->check_param_value )->exists() || _EmailAddress::where('email_address', $request->check_param_value )->exists());
                $message = $usable ? 'Email address available for use.' : 'Email address already exists in database.';
                break;
            
            default:
                $usable = null;
                $message = 'Check param not recognized.';
                break;
        }

        $response = [
            "usable" => $usable,
            "message" => $message,
        ];
        return response()->json( $response );
    }

    public function sysconfig_params_enum_options()
    {
        return response()->json([
            [
                'slug' => 'scaffolding_apps',
                'name' => 'Frontend scaffolding apps',
                'options' => [
                    [
                        'slug' => 'react',
                        'name' => 'React',
                    ],
                    [
                        'slug' => 'none',
                        'name' => 'None',
                    ],
                ],
            ],
            [
                'slug' => 'langs',
                'name' => 'Display Languages',
                'options' => [
                    [
                        'slug' => 'en',
                        'name' => 'English',
                    ],
                    [
                        'slug' => 'fr',
                        'name' => 'French',
                    ],
                ],
            ],
            [
                'slug' => 'themes',
                'name' => 'Display Themes',
                'options' => [
                    [
                        'slug' => 'light',
                        'name' => 'Light',
                    ],
                    [
                        'slug' => 'dark',
                        'name' => 'Dark',
                    ],
                ],
            ],
            [
                'slug' => 'file_storage_drivers',
                'name' => 'File Storage drivers',
                'options' => [
                    [
                        'slug' => 'lavarel_file_storage',
                        'name' => 'Laravel file storage',
                    ],
                    [
                        'slug' => 'firebase_cloud_storage',
                        'name' => 'Firebase cloud storage',
                    ],
                ],
            ],
            [
                'slug' => 'db_drivers',
                'name' => 'Database drivers',
                'options' => [
                    [
                        'slug' => 'lavarel_mysql_db',
                        'name' => 'Laravel MYSQL Database',
                    ],
                    [
                        'slug' => 'firebase_cloud_firestore',
                        'name' => 'Firebase cloud firestore',
                    ],
                ],
            ],
        ]);
    }

    public function sysconfig_params()
    {
        return response()->json( (new _PrefItemController)->index( new Request(['parent_uid'=>'system']) ));
    }

    public function active_assets()
    {
        return response()->json( (new _AssetController)->index( new Request(['_status'=>'active']) ));
    }

    public function datalists()
    {
        return response()->json([
            'active_assets' => json_decode((new _AssetController)->index( new Request(['_status'=>'active']) )->toJson(),true)['data'],
            'active_currencies' => json_decode((new _CurrencyController)->index( new Request(['_status'=>'active']) )->toJson(),true)['data'],
            'active_pymt_methods' => json_decode((new _PymtMethodController)->index( new Request(['_status'=>'active']) )->toJson(),true)['data'],
            'active_countries' => [],
        ]);
    }
}