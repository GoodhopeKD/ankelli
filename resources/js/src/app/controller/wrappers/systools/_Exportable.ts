/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Logger Imports */
import _Log, { _LogRespObj } from 'app/controller/wrappers/addons/_Log'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/main_laravel_db_rest_api.actions'
import { _dataless_resource_collection_wrapper } from 'app/controller/redux_reducers/_resource_collection_wrapper'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'updated_datetime'
type status_t = 'active' | 'deactivated'
type get_collection_params = {
    get_with_meta?: boolean,
    search_query_string?: string,
}

/* 
    RespObj Export
*/
export const _ExportableRespObj = {
    id: undefined as undefined | null | number,
    name: undefined as undefined | null | string,
    slug: undefined as undefined | null | string,
    description: undefined as undefined | null | string,
    status: undefined as undefined | null | status_t,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
}

/*
    Gettable AddonProps
*/
const GettableCollectionAddonPropsRespObj = {
    logs: [] as typeof _LogRespObj[]
}
const GettableAddonPropsRespObj = GettableCollectionAddonPropsRespObj

/*
    Exported Default Class
*/
export default class _Exportable extends _Wrapper_ implements Omit<typeof _ExportableRespObj, casts_t> {
    id: number | null = null
    name: string | null = null
    slug: string | null = null
    description: string | null = null
    status: status_t | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null

    protected gettable_collection_addon_props_page_selects_data = {} as { [collection_name in keyof typeof GettableCollectionAddonPropsRespObj]: typeof _dataless_resource_collection_wrapper }

    logs: _Log[] = []

    /* Class Constructor */
    constructor(args: typeof _ExportableRespObj) { super(); this.populate(args) }

    populate(args: typeof _ExportableRespObj) {
        this._populate(args)
        this.created_datetime = typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _ExportableRespObj) {
        return this._mainLaravelDBAPICreate('systools/exportables', args)
    }

    /* Readers */

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('systools/exportables', params, page_select, per_page)
    }

    public async getAddonProp(addon_prop_name: keyof typeof GettableAddonPropsRespObj, page_select?: laravel_api_page_selection_t, per_page?: number) {
        this.recreateGCAPPPD(GettableCollectionAddonPropsRespObj);
        const prop_types = {
            'logs': _Log,
        }
        if (Object.keys(prop_types).includes(addon_prop_name)) {
            return this._mainLaravelDBAPIGetAddonPropCollection(prop_types[addon_prop_name], { addon_prop_name, addon_prop_parent_table: '__exportables', addon_prop_parent_pmkey: this.id as number }, page_select, per_page)
        } else {
            return Promise.reject({ message: 'Addon not recognized' })
        }
    }
}