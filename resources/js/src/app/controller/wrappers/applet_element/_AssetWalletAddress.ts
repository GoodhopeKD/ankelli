/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'last_active_datetime' | 'deleted_datetime'
type get_collection_params = {
    get_with_meta?: boolean,
}

/* 
    RespObj Export
*/
export const _AssetWalletAddressRespObj = {
    id: undefined as undefined | null | number,
    asset_wallet_id: undefined as undefined | null | number,
    blockchain_address: undefined as undefined | null | string,
    tatum_derivation_key: undefined as undefined | null | number,
    onchain_txn_count: undefined as undefined | null | number,

    created_datetime: undefined as undefined | null | string,
    last_active_datetime: undefined as undefined | null | string,
    deleted_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _AssetWalletAddress extends _Wrapper_ implements Omit<typeof _AssetWalletAddressRespObj, casts_t> {
    id: number | null = null
    asset_wallet_id: number | null = null
    blockchain_address: string | null = null
    tatum_derivation_key: number | null = null
    onchain_txn_count: number | null = null

    created_datetime: _DateTime | null = null
    last_active_datetime: _DateTime | null = null
    deleted_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _AssetWalletAddressRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _AssetWalletAddressRespObj) {
        this._populate(args)
        this.created_datetime = typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.last_active_datetime = typeof args.last_active_datetime === 'string' ? new _DateTime(args.last_active_datetime) : null
        this.deleted_datetime = typeof args.deleted_datetime === 'string' ? new _DateTime(args.deleted_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _AssetWalletAddressRespObj) {
        return this._mainLaravelDBAPICreate('banking/asset_wallet_addresses', args)
    }

    /* Readers */

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('banking/asset_wallet_addresses', params, page_select, per_page)
    }
}