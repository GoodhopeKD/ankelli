/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'updated_datetime'
type _status_t = 'active' | 'frozen'
type get_collection_params = {
    get_with_meta?: boolean,
}

/* 
    RespObj Export
*/
export const _AssetAccountRespObj = {
    id: undefined as undefined | null | number,
    user_username: undefined as undefined | null | string,
    asset_name: undefined as undefined | null | string,
    asset_value: undefined as undefined | null | number,
    _status: undefined as undefined | null | _status_t,

    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _AssetAccount extends _Wrapper_ implements Omit<typeof _AssetAccountRespObj, casts_t> {
    id: number | null = null
    user_username: string | null = null
    asset_name: string | null = null
    asset_value: number | null = null
    _status: _status_t | null = null

    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _AssetAccountRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _AssetAccountRespObj) {
        this._populate(args)
        this.created_datetime = typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _AssetAccountRespObj) {
        return this._mainLaravelDBAPICreate('asset_accounts', args)
    }

    /* Readers */

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('asset_accounts', params, page_select, per_page)
    }
}