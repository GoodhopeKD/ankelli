/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'updated_datetime'|'deleted_datetime'
type status_t = 'online' | 'offline'
type payment_details_t = { key: string, value: string | number }[]

/* 
    ResponseObject Export
*/
export const _OfferResponseObject = {
    id: undefined as undefined | null | number,
    country: undefined as undefined | null | string,
    asset_name: undefined as undefined | null | string, // Asset to buy: USTD
    purchase_currency: undefined as undefined | null | string, // Currency to buy asset with: USD
    purchase_price: undefined as undefined | null | number, // Price per 1 unit of purchase_currency (max 1)
    min_purchase_amount: undefined as undefined | null | number,
    max_purchase_amount: undefined as undefined | null | number,
    payment_method: undefined as undefined | null | string,
    payment_details: undefined as undefined | null | payment_details_t,
    note: undefined as undefined | null | string,
    status: undefined as undefined | null | status_t,
    
    creator_username: undefined as undefined | null | string, // Buyer
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
    deleted_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _Offer extends _Wrapper_ implements Omit<typeof _OfferResponseObject, casts_t> {
    id: number | null = null
    country: string | null = null
    asset_name: string | null = null
    purchase_currency: string | null = null
    purchase_price: number | null = null
    min_purchase_amount: number | null = null
    max_purchase_amount: number | null = null
    payment_method: string | null = null
    payment_details: payment_details_t | null = null
    note: string | null = null
    status: status_t | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null
    deleted_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _OfferResponseObject) { super(); this.populate(args) }

    protected populate(args: typeof _OfferResponseObject) {
        this._populate(args)
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = args.updated_datetime && typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _OfferResponseObject) {
        return this._mainLaravelDBAPICreate('offers', args)
    }
}
