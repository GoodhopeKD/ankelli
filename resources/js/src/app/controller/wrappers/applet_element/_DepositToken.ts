/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Actions, Configs imports */
import { mainLaravelDBRestAPICallWrapper } from 'app/controller/actions/rest_api.actions'
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'used_datetime'
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
export const _DepositTokenRespObj = {
    token: undefined as undefined | null | string,
    asset_code: undefined as undefined | null | string,
    asset_value: undefined as undefined | null | number,
    currency_code: undefined as undefined | null | string,
    currency_amount: undefined as undefined | null | number,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    user_username: undefined as undefined | null | string,
    used_datetime: undefined as undefined | null | string
}

/*
    Exported Default Class
*/
export default class _DepositToken extends _Wrapper_ implements Omit<typeof _DepositTokenRespObj, casts_t> {
    token: string | null = null
    asset_code: string | null = null
    asset_value: number | null = null
    currency_code: string | null = null
    currency_amount: number | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    user_username: string | null = null
    used_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _DepositTokenRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _DepositTokenRespObj) {
        this._populate(args)
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.used_datetime = args.used_datetime && typeof args.used_datetime === 'string' ? new _DateTime(args.used_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _DepositTokenRespObj) {
        return this._mainLaravelDBAPICreate('deposit_tokens', args)
    }

    /* Reader(s) */

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('deposit_tokens', params, page_select, per_page)
    }

    public static async use(args: typeof _DepositTokenRespObj) {
        return await mainLaravelDBRestAPICallWrapper
            .dispatch({
                type: 'APP_BACKEND_API_CALL',
                method: 'POST',
                endpoint: 'deposit_tokens/use/' + args.token,
                data: args
            })
            .then((resp: any) => { return Promise.resolve(resp) })
            .catch((e: any) => { return Promise.reject(e) })
    }
}