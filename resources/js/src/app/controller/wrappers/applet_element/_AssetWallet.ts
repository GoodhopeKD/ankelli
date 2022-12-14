/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'
import { mainLaravelDBRestAPICallWrapper } from 'app/controller/actions/rest_api.actions'
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
export const _AssetWalletRespObj = {
    id: undefined as undefined | null | number,
    user_username: undefined as undefined | null | string,
    asset_code: undefined as undefined | null | string,
    usable_balance_asset_value: undefined as undefined | null | number,
    total_balance_asset_value: undefined as undefined | null | number,
    _status: undefined as undefined | null | _status_t,

    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _AssetWallet extends _Wrapper_ implements Omit<typeof _AssetWalletRespObj, casts_t> {
    id: number | null = null
    user_username: string | null = null
    asset_code: string | null = null
    usable_balance_asset_value: number | null = null
    total_balance_asset_value: number | null = null
    _status: _status_t | null = null

    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _AssetWalletRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _AssetWalletRespObj) {
        this._populate(args)
        this.created_datetime = typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _AssetWalletRespObj) {
        return this._mainLaravelDBAPICreate('funds/asset-wallets', args)
    }

    /* Readers */

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('funds/asset-wallets', params, page_select, per_page)
    }

    public static async asset_wallets_totals(asset_code: string) {
        return await mainLaravelDBRestAPICallWrapper
            .dispatch({
                type: 'APP_BACKEND_API_CALL',
                method: 'GET',
                endpoint: 'admin/funds/asset-wallets-totals?asset_code=' + asset_code,
            })
            .then((resp: any) => { return Promise.resolve(resp) })
            .catch((e: any) => { return Promise.reject(e) })
    }

    async refreshAssetValues() {
        return await mainLaravelDBRestAPICallWrapper
            .dispatch({
                type: 'APP_BACKEND_API_CALL',
                method: 'GET',
                endpoint: 'funds/asset-wallets/' + this.id + '/refresh',
            })
            .then((resp: any) => { return Promise.resolve(resp) })
            .catch((e: any) => { return Promise.reject(e) })
    }
}