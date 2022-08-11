/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Element Imports */
import _Permission, { _PermissionRespObj } from 'app/controller/wrappers/systools/_Permission'
/* Logger Imports */
import _Log, { _LogRespObj } from 'app/controller/wrappers/addons/_Log'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'
import { _dataless_resource_collection_wrapper } from 'app/controller/redux_reducers/_resource_collection_wrapper'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'updated_datetime'
type _status_t = 'active' | 'revoked'
type parent_table_t = '__user_groups' | '__admin_extensions'
type get_collection_params = {
    get_with_meta?: boolean,
    parent_table?: parent_table_t,
    _status?: _status_t,
}

/* 
    RespObj Export
*/
export const _PermissionInstanceRespObj = {
    id: undefined as undefined | null | number,
    permission_slug: undefined as undefined | null | string,
    parent_table: undefined as undefined | null | parent_table_t,
    parent_uid: undefined as undefined | null | string | number,
    _status: undefined as undefined | null | _status_t,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
}

/*
    Gettable AddonProps
*/
const GettableSingularAddonPropsRespObj = {
    permission: undefined as undefined | null | typeof _PermissionRespObj,
}
const GettableCollectionAddonPropsRespObj = {
    logs: [] as typeof _LogRespObj[]
}
const GettableAddonPropsRespObj = {
    ...GettableSingularAddonPropsRespObj,
    ...GettableCollectionAddonPropsRespObj,
}

/*
    Exported Default Class
*/
export default class _PermissionInstance extends _Wrapper_ implements Omit<typeof _PermissionInstanceRespObj, casts_t> {
    id: number | null = null
    permission_slug: string | null = null
    parent_table: parent_table_t | null = null
    parent_uid: string | number | null = null
    _status: _status_t | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null

    permission: _Permission | null = null

    protected collections_pagination_params_data = {} as { [collection_name in keyof typeof GettableCollectionAddonPropsRespObj]: typeof _dataless_resource_collection_wrapper }

    /* Class Constructor */
    constructor(args: typeof _PermissionInstanceRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _PermissionInstanceRespObj) {
        this._populate(args)
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = args.updated_datetime && typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _PermissionInstanceRespObj) {
        return this._mainLaravelDBAPICreate('systools/permission_instances', args)
    }

    /* Readers */

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('systools/permission_instances', params, page_select, per_page)
    }

    public async getAddonProp(addon_prop_name: keyof typeof GettableAddonPropsRespObj, page_select?: laravel_api_page_selection_t, per_page?: number) {
        switch (addon_prop_name) {
            case 'permission':
                return _Permission.getOne({ slug: this.permission_slug as string })
                    .then((resp: any) => { this._populate({ [addon_prop_name]: resp }); return Promise.resolve(resp) })
                    .catch((e: any) => { return Promise.reject(e) })
        }
        this.recreateGCAPPPD(GettableCollectionAddonPropsRespObj);
        const prop_types = {
            //'permission': _Permission,
            'logs': _Log,
        }
        if (Object.keys(prop_types).includes(addon_prop_name)) {
            return this._mainLaravelDBAPIGetAddonPropCollection(prop_types[addon_prop_name], { addon_prop_name, addon_prop_parent_table: '__permission_instances', addon_prop_parent_uid: this.id as number }, page_select, per_page)
        } else {
            return Promise.reject({ message: 'Addon not recognized' })
        }
    }
}