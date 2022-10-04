/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Element Imports */
import _Trade, { _TradeRespObj } from 'app/controller/wrappers/applet_element/_Trade'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'
import { _dataless_resource_collection_wrapper } from 'app/controller/redux_reducers/_resource_collection_wrapper'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'updated_datetime' | 'deleted_datetime'
type offer_to_t = 'buy' | 'sell'
type _status_t = 'online' | 'offline'
type get_collection_params = {
    get_with_meta?: boolean,
    offer_to?: offer_to_t,
    creator_username?: string,
}
type pymt_details_t = { key: string, value: string | number }[]

/* 
    RespObj Export
*/
export const _OfferRespObj = {
    ref_code: undefined as undefined | null | string,
    country_name: undefined as undefined | null | string,

    offer_to: undefined as undefined | null | offer_to_t,

    asset_code: undefined as undefined | null | string, // Asset to buy: e.g USTD
    currency_code: undefined as undefined | null | string, // Currency to buy asset with: e.g USD
    offer_price: undefined as undefined | null | number,

    // for offer_to:buy
    min_trade_purchase_amount: undefined as undefined | null | number,
    max_trade_purchase_amount: undefined as undefined | null | number,

    // for offer_to:sell
    min_trade_sell_value: undefined as undefined | null | number,
    max_trade_sell_value: undefined as undefined | null | number,

    pymt_method_slug: undefined as undefined | null | string,
    pymt_details: undefined as undefined | null | pymt_details_t,
    note: undefined as undefined | null | string,
    _status: undefined as undefined | null | _status_t,

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
    country_name: string | null = null

    offer_to: offer_to_t | null = null

    asset_code: string | null = null
    currency_code: string | null = null
    offer_price: number | null = null

    min_trade_purchase_amount: number | null = null
    max_trade_purchase_amount: number | null = null

    min_trade_sell_value: number | null = null
    max_trade_sell_value: number | null = null

    pymt_method_slug: string | null = null
    pymt_details: pymt_details_t | null = null
    note: string | null = null
    _status: _status_t | null = null

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
        return this._mainLaravelDBAPICreate('p2p/offers', args)
    }

    public static async getOne(params: { ref_code: string }) {
        return this._mainLaravelDBAPIGetOne('p2p/offers/{ref_code}', params)
    }

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('p2p/offers', params, page_select, per_page)
    }

    public async accept(args: { currency_amount: number, pymt_details?: any, sender_password?: string }) {
        return _Trade.create({ offer_ref_code: this.ref_code as string, currency_amount: args.currency_amount, pymt_details: args.pymt_details, sender_password: args.sender_password })
    }

    /* Updaters */

    public async update(args: typeof _OfferRespObj, update_note: string) {
        const data = {} as typeof args
        if (typeof args._status === typeof this._status && args._status !== this._status) data._status = args._status
        return this._mainLaravelDBAPIUpdate('p2p/offers/' + this.ref_code, update_note, data)
    }

    public async setOffline() {
        return this.update({ _status: 'offline' } as typeof _OfferRespObj, "Set _Offer _status to offline")
    }

    public async setOnline() {
        return this.update({ _status: 'online' } as typeof _OfferRespObj, "Set _Offer _status to online")
    }
}
