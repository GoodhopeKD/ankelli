<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Contracts\Encryption\DecryptException;


class _SessionResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        //$decrypt = Crypt::decryptString;
        $decrypt = function ($in) { return $in; };
        $last_request_location = ($this->logs_in_session) ? $this->logs_in_session()->orderBy('action_datetime', 'desc')->first()->request_location : [];

        try {
            $device_info = $decrypt($this->device_info);
            $agent_app_info = $decrypt($this->agent_app_info);
            $last_request_location = $decrypt($last_request_location);
        } catch (DecryptException $e) {
            $device_info = $this->device_info;
            $agent_app_info = $this->agent_app_info;
        }

        return array_filter([
            'token' => $this->token,
            'user_username' => $this->user_username,
            'device_info' => json_decode($device_info),
            'agent_app_info' => json_decode($agent_app_info),
            '_status' => $this->_status,
            'created_datetime' => $this->created_datetime,
            'updated_datetime' => $this->updated_datetime,
            'signin_datetime' => $this->signin_datetime,
            'signout_datetime' => $this->signout_datetime,
            'last_active_datetime' => $this->last_active_datetime_f(),
            'last_request_location' => json_decode($last_request_location),
        ], static function($var) { return $var !== null; });
    }
}
