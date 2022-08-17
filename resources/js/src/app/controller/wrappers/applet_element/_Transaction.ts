/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'

/*
    Type Definitions
*/
type casts_t = 'transfer_datetime'
type get_collection_params = {
    get_with_meta?: boolean,
    search_query_string?: string,
}

/* Result Objects */
type transfer_result_t = {
    user_username : string,
    old_asset_value : number,
    new_asset_value : number,
}[]

/* 
    RespObj Export
*/
export const _TransactionRespObj = {
    ref_code: undefined as undefined | null | string,
    session_token: undefined as undefined | null | string,
    note: undefined as undefined | null | string,
    source_user_username: undefined as undefined | null | string,
    destination_user_username: undefined as undefined | null | string,
    asset_code: undefined as undefined | null | string,
    source_account_transfer_value: undefined as undefined | null | number,
    destination_account_transfer_value: undefined as undefined | null | number,
    platform_charge_asset_value: undefined as undefined | null | number,
    transfer_result: undefined as undefined | null | transfer_result_t,
    transfer_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _Transaction extends _Wrapper_ implements Omit<typeof _TransactionRespObj, casts_t> {
    ref_code: string | null = null
    session_token: string| null = null
    note: string| null = null
    source_user_username: string | null = null
    destination_user_username: string | null = null
    asset_code: string | null = null
    source_account_transfer_value: number | null = null
    destination_account_transfer_value: number | null = null
    platform_charge_asset_value: number | null = null
    transfer_result: transfer_result_t | null = null
    transfer_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _TransactionRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _TransactionRespObj) {
        this._populate(args)
        this.transfer_datetime = new _DateTime(args.transfer_datetime)
    }

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('transactions', params, page_select, per_page)
    }
}