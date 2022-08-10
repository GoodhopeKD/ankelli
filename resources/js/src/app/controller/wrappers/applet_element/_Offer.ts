/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'
import { _dataless_resource_collection_wrapper } from 'app/controller/redux_reducers/_resource_collection_wrapper'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'updated_datetime'|'deleted_datetime'
type offer_to_t = 'buy' | 'sell'
type status_t = 'online' | 'offline'
type get_collection_params = {
    get_with_meta?: boolean,
    offers_to?: offer_to_t,
    creator_username?: string,
}
type payment_method_details_t = { key: string, value: string | number }[]

/* 
    RespObj Export
*/
export const _OfferRespObj = {
    ref_code: undefined as undefined | null | string,
    country: undefined as undefined | null | string,

    offer_to: undefined as undefined | null | offer_to_t,

    asset_code: undefined as undefined | null | string, // Asset to buy: e.g USTD
    currency_code: undefined as undefined | null | string, // Currency to buy asset with: e.g USD

    // for offer_to:sell
    asset_sell_price: undefined as undefined | null | number,
    min_sell_value: undefined as undefined | null | number,
    max_sell_value: undefined as undefined | null | number,

    // for offer_to:buy
    asset_purchase_price: undefined as undefined | null | number,
    min_purchase_amount: undefined as undefined | null | number,
    max_purchase_amount: undefined as undefined | null | number,

    payment_method_slug: undefined as undefined | null | string,
    payment_method_details: undefined as undefined | null | payment_method_details_t,
    note: undefined as undefined | null | string,
    status: undefined as undefined | null | status_t,
    
    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
    deleted_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _Offer extends _Wrapper_ implements Omit<typeof _OfferRespObj, casts_t> {
    ref_code: string | null = null
    country: string | null = null

    offer_to: offer_to_t | null = null

    asset_code: string | null = null
    currency_code: string | null = null

    asset_sell_price: number | null = null
    min_sell_value: number | null = null
    max_sell_value: number | null = null

    asset_purchase_price: number | null = null
    min_purchase_amount: number | null = null
    max_purchase_amount: number | null = null

    payment_method_slug: string | null = null
    payment_method_details: payment_method_details_t | null = null
    note: string | null = null
    status: status_t | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null
    deleted_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _OfferRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _OfferRespObj) {
        this._populate(args)
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = args.updated_datetime && typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _OfferRespObj) {
        return this._mainLaravelDBAPICreate('offers', args)
    }

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('offers', params, page_select, per_page)
    }
}
