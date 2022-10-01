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
type parent_table_t = '__users' | '__stores' | '__email_addresses'
type get_collection_params = {
    get_with_meta?: boolean,
    parent_table?: string,
    parent_uid?: string | number,
}


/* 
    RespObj Export
*/
export const _PrefItemRespObj = {
    id: undefined as undefined | null | number,
    key_name: undefined as undefined | null | string,
    key_slug: undefined as undefined | null | string,
    value: undefined as undefined | null | string | number | boolean | object,
    value_type: undefined as undefined | null | string,
    parent_table: undefined as undefined | null | parent_table_t,
    parent_uid: undefined as undefined | null | string | number,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _PrefItem extends _Wrapper_ implements Omit<typeof _PrefItemRespObj, casts_t> {
    id: number | null = null
    key_name: string | null = null
    key_slug: string | null = null
    value: string | number | boolean | object | null = null
    value_type: string | null = null
    parent_table: parent_table_t | null = null
    parent_uid: string | number | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _PrefItemRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _PrefItemRespObj) {
        this._populate(args)
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = args.updated_datetime && typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _PrefItemRespObj) {
        return this._mainLaravelDBAPICreate('content/pref_items', args)
    }

    /* Readers */

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('content/pref_items', params, page_select, per_page)
    }

    public static async getSysConfigParams() {
        return mainLaravelDBRestAPICallWrapper
            .dispatch({
                type: 'APP_BACKEND_API_CALL',
                method: 'GET',
                endpoint: 'content/sysconfig_params',
            })
            .then((collection: any) => {
                return Promise.resolve(collection);
            })
            .catch((e: any) => { return Promise.reject(e); })
    }

    public static async getSysConfigParamsEnumOptions() {
        return mainLaravelDBRestAPICallWrapper
            .dispatch({
                type: 'APP_BACKEND_API_CALL',
                method: 'GET',
                endpoint: 'content/sysconfig_params_enum_options',
            })
            .then((collection: any) => {
                return Promise.resolve(collection);
            })
            .catch((e: any) => { return Promise.reject(e); })
    }
}
