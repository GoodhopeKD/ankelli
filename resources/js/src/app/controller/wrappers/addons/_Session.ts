/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'updated_datetime' | 'last_active_datetime' | 'signin_datetime' | 'signout_datetime'
type status_t = 'empty' | 'active' | 'ended'
type get_collection_params = {
    user_username?: string,
    status?: status_t,
}

const HostRespObj = {
    name: undefined as undefined | null | string,
    version: undefined as undefined | null | string,
    extra: undefined as undefined | null | string,
}

type last_request_location_t = {
    ip?: string
}


/* 
    RespObj Export
*/
export const _SessionRespObj = {
    token: undefined as undefined | null | string,
    user_username: undefined as undefined | null | string,
    device_info: undefined as undefined | null | typeof HostRespObj,
    agent_app_info: undefined as undefined | null | typeof HostRespObj,
    status: undefined as undefined | null | status_t,
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
    last_active_datetime: undefined as undefined | null | string,
    signin_datetime: undefined as undefined | null | string,
    signout_datetime: undefined as undefined | null | string,
    last_request_location: undefined as undefined | null | last_request_location_t,
}

/*
    Exported Default Class
*/
export default class _Session extends _Wrapper_ implements Omit<typeof _SessionRespObj, casts_t> {
    token: string | null = null
    user_username: string | null = null
    device_info: typeof HostRespObj | null = null
    agent_app_info: typeof HostRespObj | null = null
    status: status_t | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null
    last_active_datetime: _DateTime | null = null
    signin_datetime: _DateTime | null = null
    signout_datetime: _DateTime | null = null
    last_request_location: last_request_location_t | null = null

    /* Class Constructor */
    constructor(args: typeof _SessionRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _SessionRespObj) {
        this._populate(args)

        // Load Datetimes
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = args.updated_datetime && typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
        this.last_active_datetime = new _DateTime(args.last_active_datetime)
        this.signin_datetime = args.signin_datetime && typeof args.signin_datetime === 'string' ? new _DateTime(args.signin_datetime) : null
        this.signout_datetime = args.signin_datetime && typeof args.signout_datetime === 'string' ? new _DateTime(args.signout_datetime) : null
    }

    /* Readers */

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('sessions', params, page_select, per_page)
    }

    /* Updaters */
    static async endRemote(id: number) {

    }
}