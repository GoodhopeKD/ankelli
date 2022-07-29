/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/main_laravel_db_rest_api.actions'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'updated_datetime'
type get_collection_params = {
    get_with_meta?: boolean,
}

/* 
    ResponseObject Export
*/
export const _CurrencyResponseObject = {
    id: undefined as undefined | null | number,
    name: undefined as undefined | null | string,
    alpha_three_code: undefined as undefined | null | string,
    min_transactable_cash_amount: undefined as undefined | null | number,
    smallest_transactable_cash_denomination_amount: undefined as undefined | null | number,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _Currency extends _Wrapper_ implements Omit<typeof _CurrencyResponseObject, casts_t> {
    id: number | null = null
    name: string | null = null
    alpha_three_code: string | null = null
    min_transactable_cash_amount: number | null = null
    smallest_transactable_cash_denomination_amount: number | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _CurrencyResponseObject) { super(); this.populate(args) }

    protected populate(args: typeof _CurrencyResponseObject) {
        this._populate(args)
        this.created_datetime = typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _CurrencyResponseObject) {
        return this._mainLaravelDBAPICreate('datalists/assets', args)
    }

    /* Readers */

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('datalists/assets', params, page_select, per_page)
    }
}