/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Element Imports */
import _Message, { _MessageRespObj } from 'app/controller/wrappers/addons/_Message'
/* Logger Imports */
import _Log, { _LogRespObj } from 'app/controller/wrappers/addons/_Log'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'
import { _dataless_resource_collection_wrapper } from 'app/controller/redux_reducers/_resource_collection_wrapper'

/*
    Type Definitions
*/
type casts_t = 'payment_declared_datetime' | 'payment_confirmed_datetime' | 'created_datetime' | 'updated_datetime'
type was_offer_to_t = 'buy' | 'sell'
type status_t = 'active' | 'cancelled' | 'flagged' | 'completed'
type payment_method_details_t = { key: string, value: string | number }[]
type addable_addon_args_t = typeof _MessageRespObj
type get_collection_params = {
    get_with_meta?: boolean,
    get_closed?: boolean,
}

/* 
    RespObj Export
*/
export const _TradeRespObj = {
    ref_code: undefined as undefined | null | string,
    country: undefined as undefined | null | string,

    was_offer_to: undefined as undefined | null | was_offer_to_t,

    asset_code: undefined as undefined | null | string, // Asset to buy: eg USTD
    currency_code: undefined as undefined | null | string, // Currency to buy asset with: e.g USD
    asset_value: undefined as undefined | null | number, // Value of asset to be released from seller // Calculated as 1.01 * (purchase_amount  purchase_price) // max: seller's balance
    purchase_amount: undefined as undefined | null | number, // Amount offer_creator will use to buy asset // Calculated as 0.99 * asset_value *    purchase_price // limits: offer_min-offer_max
    
    // for was_offer_to:sell
    asset_sell_price: undefined as undefined | null | number,
    
    // for was_offer_to:buy
    asset_purchase_price: undefined as undefined | null | number,
    
    payment_method_slug: undefined as undefined | null | string,
    payment_method_details: undefined as undefined | null | payment_method_details_t,
    payment_declared_datetime: undefined as undefined | null | string,
    payment_confirmed_datetime: undefined as undefined | null | string,
    visible_to_creator: undefined as undefined | null | boolean,
    visible_to_offer_creator: undefined as undefined | null | boolean,
    status: undefined as undefined | null | status_t,

    offer_creator_username: undefined as undefined | null | string,
    creator_username: undefined as undefined | null | string, // Seller
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
}

/* 
    Addable AddonProps 
*/
const AddableAddonPropsRespObj = {
    messages: [] as typeof _MessageRespObj[]
}

/*
    Gettable AddonProps
*/
const GettableCollectionAddonPropsRespObj = {
    messages: [] as typeof _MessageRespObj[],
    logs: [] as typeof _LogRespObj[]
}

const GettableAddonPropsRespObj = GettableCollectionAddonPropsRespObj

/*
    Exported Default Class
*/
export default class _Trade extends _Wrapper_ implements Omit<typeof _TradeRespObj, casts_t> {
    ref_code: string | null = null
    country: string | null = null

    was_offer_to: was_offer_to_t | null = null

    asset_code: string | null = null
    currency_code: string | null = null
    asset_value: number | null = null
    purchase_amount: number | null = null

    asset_sell_price: number | null = null
    asset_purchase_price: number | null = null

    payment_method_slug: string | null = null
    payment_method_details: payment_method_details_t | null = null
    payment_declared_datetime: _DateTime | null = null
    payment_confirmed_datetime: _DateTime | null = null
    visible_to_creator: boolean | null = null
    visible_to_offer_creator: boolean | null = null
    status: status_t | null = null

    offer_creator_username: string | null = null
    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null

    protected gettable_collection_addon_props_page_selects_data = {} as { [collection_name in keyof typeof GettableCollectionAddonPropsRespObj]: typeof _dataless_resource_collection_wrapper }

    messages: _Message[] = []
    logs: _Log[] = []

    /* Class Constructor */
    constructor(args: typeof _TradeRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _TradeRespObj) {
        this._populate(args)
        this.payment_declared_datetime = args.payment_declared_datetime && typeof args.payment_declared_datetime === 'string' ? new _DateTime(args.payment_declared_datetime) : null
        this.payment_confirmed_datetime = args.payment_confirmed_datetime && typeof args.payment_confirmed_datetime === 'string' ? new _DateTime(args.payment_confirmed_datetime) : null
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = args.updated_datetime && typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _TradeRespObj) {
        return this._mainLaravelDBAPICreate('trades', args)
    }

    /* Readers */
    
    public async read() {
        return this._mainLaravelDBAPIRead('trades/' + this.ref_code)
    }

    public static async getOne(params: { id: number }) {
        return this._mainLaravelDBAPIGetOne('trades/' + params.id)
    }

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('trades', params, page_select, per_page)
    }

    public async getAddonProp(addon_prop_name: keyof typeof GettableAddonPropsRespObj, page_select?: laravel_api_page_selection_t, per_page?: number) {
        this.recreateGCAPPPD(GettableCollectionAddonPropsRespObj);
        const prop_types = {
            'messages': _Message,
            'logs': _Log,
        }
        if (Object.keys(prop_types).includes(addon_prop_name)) {
            return this._mainLaravelDBAPIGetAddonPropCollection(prop_types[addon_prop_name], { addon_prop_name, addon_prop_parent_table: '__trades', addon_prop_parent_uid: this.ref_code as string }, page_select, per_page)
        } else {
            return Promise.reject({ message: 'Addon not recognized' })
        }
    }

    /* Updaters */

    public async addAddonProp(prop_name: keyof typeof AddableAddonPropsRespObj, args: addable_addon_args_t) {
        const prop_types = {
            'messages': _Message
        }
        args = { ...args, parent_table: '__trades', parent_uid: this.ref_code }
        if (Object.keys(prop_types).includes(prop_name)) {
            return prop_types[prop_name].create(args)
        } else {
            return Promise.reject({ message: 'Addon not recognized' })
        }
    }
}
