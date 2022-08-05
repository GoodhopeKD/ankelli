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
    search_query_string?: string,
    country?: string,
}

/* 
    RespObj Export
*/
export const _ProvinceRespObj = {
    id: undefined as undefined | null | number,
    name: undefined as undefined | null | string,
    country: undefined as undefined | null | string,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _Province extends _Wrapper_ implements Omit<typeof _ProvinceRespObj, casts_t> {
    id: number | null = null
    name: string | null = null
    country: string | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _ProvinceRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _ProvinceRespObj) {
        this._populate(args)
        this.created_datetime = typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _ProvinceRespObj) {
        return this._mainLaravelDBAPICreate('datalists/provinces', args)
    }

    /* Readers */

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('datalists/provinces', params, page_select, per_page)
    }
}