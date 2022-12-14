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
type _status_t = 'active' | 'deactivated'
type get_collection_params = {
    get_with_meta?: boolean,
}

/* 
    RespObj Export
*/
export const _AssetRespObj = {
    id: undefined as undefined | null | number,
    name: undefined as undefined | null | string,
    code: undefined as undefined | null | string,
    smallest_display_unit: undefined as undefined | null | number,
    _status: undefined as undefined | null | _status_t,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _Asset extends _Wrapper_ implements Omit<typeof _AssetRespObj, casts_t> {
    id: number | null = null
    name: string | null = null
    code: string | null = null
    smallest_display_unit: number | null = null
    _status: _status_t | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _AssetRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _AssetRespObj) {
        this._populate(args)
        this.created_datetime = typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _AssetRespObj) {
        return this._mainLaravelDBAPICreate('admin/datalists/assets', args)
    }

    /* Readers */

    public static async getOne(params: { id: string }) {
        return this._mainLaravelDBAPIGetOne('admin/datalists/assets/' + params.id)
    }

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('content/datalists/assets', params, page_select, per_page)
    }

    /* Updaters */
    public async activate_next_gp_addresses_batch(activation_batch_size: number) {
        return await mainLaravelDBRestAPICallWrapper
            .dispatch({
                type: 'APP_BACKEND_API_CALL',
                method: 'POST',
                endpoint: 'admin/datalists/assets/' + this.id + '/activate_next_gp_addresses_batch',
                data: { activation_batch_size }
            })
            .then((resp: any) => { return Promise.resolve(resp) })
            .catch((e: any) => { return Promise.reject(e) })
    }
}