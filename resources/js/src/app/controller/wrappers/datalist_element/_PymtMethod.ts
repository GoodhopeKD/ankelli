/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Element Imports */
import _File, { _FileRespObj } from 'app/controller/wrappers/addons/_File'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'

/*
    Type Definitions
*/
type casts_t = 'icon' | 'created_datetime' | 'updated_datetime' | 'deleted_datetime'
type _status_t = 'active' | 'deactivated'
type get_collection_params = {
    get_with_meta?: boolean,
    search_query_string?: string,
}

/* 
    RespObj Export
*/
export const _PymtMethodRespObj = {
    id: undefined as undefined | null | number,
    name: undefined as undefined | null | string,
    slug: undefined as undefined | null | string,
    details_required: undefined as undefined | null | object,
    hex_color: undefined as undefined | null | string,
    icon: undefined as undefined | null | typeof _FileRespObj,
    _status: undefined as undefined | null | _status_t,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
    deleted_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _PymtMethod extends _Wrapper_ implements Omit<typeof _PymtMethodRespObj, casts_t> {
    id: number | null = null
    name: string | null = null
    slug: string | null = null
    details_required: object | null = null
    hex_color: string | null = null
    icon: _File | null = null
    _status: _status_t | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null
    deleted_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _PymtMethodRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _PymtMethodRespObj) {
        this._populate(args)
        this.icon = args.icon && typeof args.icon === typeof _FileRespObj ? new _File(args.icon) : null

        this.created_datetime = typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
        this.deleted_datetime = typeof args.deleted_datetime === 'string' ? new _DateTime(args.deleted_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _PymtMethodRespObj) {
        return this._mainLaravelDBAPICreate('admin/datalists/pymt_methods', args)
    }

    /* Readers */

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('content/datalists/pymt_methods', params, page_select, per_page)
    }
}