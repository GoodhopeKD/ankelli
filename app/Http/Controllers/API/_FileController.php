<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Storage;

use App\Models\_File;
use App\Http\Resources\_FileResource;
use App\Http\Resources\_FileResourceCollection;

class _FileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  int  $some_id
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function upload(Request $request)
    {
        if (!isset($request->filegroup) || !isset($request->parent_table)){
            return abort(422,"Filegroup or Parent Table missing");
        }

        $validated_data = $request->validate([
            'files' => ['required', 'array'],
            //'files.*' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:4096',
        ]);

        $response = ['files' => []];

        if($request->has('files')) {
            foreach( $request->file('files') as $file ) {
                $filegroup = $request->filegroup;
                $parent_table = $request->parent_table;
                $filename = substr(md5(microtime()),rand(0,9),20).'.'.$file->extension();
                $upload_dir_path = 'public/' . $filegroup . '/' . ltrim( $parent_table, '__' );
                $path = $file->storeAs( $upload_dir_path , $filename );
                $file_data = [];
                $file_data['filesize'] = $file->getSize();
                $file_data['original_filename'] = $file->getClientOriginalName();
                $file_data['uri'] = 'https://ankelli.com' . Storage::url( $upload_dir_path . '/' . $filename );
                array_push( $response['files'], $file_data );
            }
            $response["success"] = true;
            $response["message"] = "Success! file(s) uploaded";
        } else {
            $response["success"] = false;
            $response["message"] = "Failed! file(s) not uploaded";
        }
        return response()->json($response);
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
            'parent_table'      => ['required', 'string'],
            'parent_uid'        => ['required', 'string', 'max:64'],
            'filegroup'         => ['required', 'string', Rule::in(['documents', 'images'])],
            'tag'               => ['required', 'string', 'max:32'],
            'title'             => ['required', 'string', 'max:255'],
            'width'             => ['integer', 'nullable'],
            'height'            => ['integer', 'nullable'],
            'uri'               => ['required', 'string', 'max:255'],
            'type'              => ['string', 'max:12'],
            'filesize'          => ['integer', 'nullable'],
            'original_filename' => ['required', 'string', 'max:255'],
            'order_index'       => ['integer', 'nullable'],
        ]);
        $validated_data['creator_username'] = session()->get('api_auth_user_username', auth('api')->user() ? auth('api')->user()->username : null );

        $element = _File::create($validated_data);
        // Handle _Log
        (new _LogController)->store( new Request([
            'action_note' => 'Addition of _File entry to database.',
            'action_type' => 'entry_create',
            'entry_table' => $element->getTable(),
            'entry_uid' => $element->id,
            'batch_code' => $request->batch_code,
        ]));
        // End _Log Handling
        return response()->json( new _FileResource( $element ) );
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
            'tag'               => ['sometimes', 'string', 'max:32'],
            'title'             => ['sometimes', 'string', 'max:255'],
            'order_index'       => ['integer', 'nullable'],
        ]);

        $element = _File::findOrFail($id);
        $element->update($validated_data);
        return response()->json( (new _FileResource( _File::findOrFail( $id ) )) );
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(int $id)
    {
        $element = _File::findOrFail($id);
        if (in_array( auth('api')->user()->username, [$element->creator_username, $element->upater_username] )){
            Storage::delete( 'public/' . $element->filegroup . '/' . ltrim( $element->parent_table, '__' ) . '/' . $element->filename );
            $element->delete();
            return response()->json(['success' => 'success'], 200);
        } else {
            return abort(403, 'User not allowed to perform operation');
        }
    }
}
