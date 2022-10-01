/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'

/*
    Type Definitions
*/
type casts_t = 'created_datetime'
type _status_t = 'active' | 'deactivated' | 'used_up'
type get_collection_params = {
    get_with_meta?: boolean,
    asset_code?: string,
    currency_code?: string,
    creator_username?: string,
    _status?: string,
}

/* 
    RespObj Export
*/
export const _RegTokenRespObj = {
    token: undefined as undefined | null | string,
    _status: undefined as undefined | null | _status_t,
    use_count: undefined as undefined | null | number,
    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _RegToken extends _Wrapper_ implements Omit<typeof _RegTokenRespObj, casts_t> {
    token: string | null = null
    _status: _status_t | null = null
    use_count: number | null = null
    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    used_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _RegTokenRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _RegTokenRespObj) {
        this._populate(args)
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _RegTokenRespObj) {
        return this._mainLaravelDBAPICreate('accounts/systools/reg_tokens', args)
    }

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('accounts/systools/reg_tokens', params, page_select, per_page)
    }
}