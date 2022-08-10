/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Element Imports */
import _PermissionInstance, { _PermissionInstanceRespObj } from 'app/controller/wrappers/addons/_PermissionInstance'
/* Logger Imports */
import _Log, { _LogRespObj } from 'app/controller/wrappers/addons/_Log'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'
import { _dataless_resource_collection_wrapper } from 'app/controller/redux_reducers/_resource_collection_wrapper'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'updated_datetime'
type status_t = 'active' | 'deactivated'
type get_collection_params = {
    get_with_meta?: boolean,
    status?: status_t,
}

/* 
    RespObj Export
*/
export const _PermissionRespObj = {
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
    permission_instances: [] as typeof _PermissionInstanceRespObj[],
    logs: [] as typeof _LogRespObj[]
}
const GettableAddonPropsRespObj = GettableCollectionAddonPropsRespObj

/*
    Exported Default Class
*/

export default class _Permission extends _Wrapper_ implements Omit<typeof _PermissionRespObj, casts_t> {
    id: number | null = null
    name: string | null = null
    slug: string | null = null
    description: string | null = null
    status: status_t | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null

    protected collections_pagination_params_data = {} as { [collection_name in keyof typeof GettableCollectionAddonPropsRespObj]: typeof _dataless_resource_collection_wrapper }

    permission_instances: _PermissionInstance[] = []
    logs: _Log[] = []

    /* Class Constructor */
    constructor(args: typeof _PermissionRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _PermissionRespObj) {
        this._populate(args)
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = args.updated_datetime && typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _PermissionRespObj) {
        return this._mainLaravelDBAPICreate('systools/permissions', args)
    }

    /* Readers */

    public static async getOne(params: { id?: number, slug?: string }) {
        return this._mainLaravelDBAPIGetOne('systools/permissions/' + (params.slug ? params.slug : params.id))
    }

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('systools/permissions', params, page_select, per_page)
    }

    public async getAddonProp(addon_prop_name: keyof typeof GettableAddonPropsRespObj, page_select?: laravel_api_page_selection_t, per_page?: number) {
        this.recreateGCAPPPD(GettableCollectionAddonPropsRespObj);
        const prop_types = {
            'permission_instances': _PermissionInstance,
            'logs': _Log,
        }
        if (Object.keys(prop_types).includes(addon_prop_name)) {
            return this._mainLaravelDBAPIGetAddonPropCollection(prop_types[addon_prop_name], { addon_prop_name, addon_prop_parent_table: '__permissions', addon_prop_parent_uid: this.id as number }, page_select, per_page)
        } else {
            return Promise.reject({ message: 'Addon not recognized' })
        }
    }
}