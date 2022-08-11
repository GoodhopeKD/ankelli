/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Element Imports */
import _File, { _FileRespObj } from 'app/controller/wrappers/addons/_File'
import _PermissionInstance, { _PermissionInstanceRespObj } from 'app/controller/wrappers/addons/_PermissionInstance'
import _UserGroupMembership, { _UserGroupMembershipRespObj } from 'app/controller/wrappers/addons/_UserGroupMembership'
/* Logger Imports */
import _Log, { _LogRespObj } from 'app/controller/wrappers/addons/_Log'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'
import { _dataless_resource_collection_wrapper } from 'app/controller/redux_reducers/_resource_collection_wrapper'

/*
    Type Definitions
*/
type casts_t = 'profile_image' | 'created_datetime' | 'updated_datetime' | 'deleted_datetime'
type _status_t = 'active' | 'deactivated'
type get_collection_params = {
    get_with_meta?: boolean,
    get_with_deleted?: boolean,
    _status?: _status_t,
}

/* 
    RespObj Export
*/
export const _UserGroupRespObj = {
    id: undefined as undefined | null | number,
    name: undefined as undefined | null | string,
    slug: undefined as undefined | null | string,
    description: undefined as undefined | null | string,
    profile_image: undefined as undefined | null | typeof _FileRespObj,
    _status: undefined as undefined | null | _status_t,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
    deleted_datetime: undefined as undefined | null | string,
}

/*
    Gettable AddonProps
*/
const GettableCollectionAddonPropsRespObj = {
    permission_instances: [] as typeof _PermissionInstanceRespObj[],
    user_group_memberships: [] as typeof _UserGroupMembershipRespObj[],
    logs: [] as typeof _LogRespObj[],
}
const GettableAddonPropsRespObj = GettableCollectionAddonPropsRespObj

/*
    Exported Default Class
*/
export default class _UserGroup extends _Wrapper_ implements Omit<typeof _UserGroupRespObj, casts_t> {
    id: number | null = null
    name: string | null = null
    slug: string | null = null
    description: string | null = null
    profile_image: _File | null = null
    _status: _status_t | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null
    deleted_datetime: _DateTime | null = null

    protected gettable_collection_addon_props_page_selects_data = {} as { [collection_name in keyof typeof GettableCollectionAddonPropsRespObj]: typeof _dataless_resource_collection_wrapper }

    permission_instances: _PermissionInstance[] = []
    user_group_memberships: _UserGroupMembership[] = []
    logs: _Log[] = []

    /* Class Constructor */
    constructor(args: typeof _UserGroupRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _UserGroupRespObj) {
        this._populate(args)
        this.profile_image = args.profile_image && typeof args.profile_image === typeof _FileRespObj ? new _File(args.profile_image) : null

        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = args.updated_datetime && typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
        this.deleted_datetime = args.deleted_datetime && typeof args.deleted_datetime === 'string' ? new _DateTime(args.deleted_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _UserGroupRespObj) {
        return this._mainLaravelDBAPICreate('systools/user_groups', args)
    }

    /* Readers */

    public static async getOne(params: { id?: number, slug?: string }) {
        return this._mainLaravelDBAPIGetOne('systools/user_groups/' + (params.slug ? params.slug : params.id))
    }

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('systools/user_groups', params, page_select, per_page)
    }

    public async getAddonProp(addon_prop_name: keyof typeof GettableAddonPropsRespObj, page_select?: laravel_api_page_selection_t, per_page?: number) {
        this.recreateGCAPPPD(GettableCollectionAddonPropsRespObj);
        const prop_types = {
            'permission_instances': _PermissionInstance,
            'user_group_memberships': _UserGroupMembership,
            'logs': _Log,
        }
        if (Object.keys(prop_types).includes(addon_prop_name)) {
            return this._mainLaravelDBAPIGetAddonPropCollection(prop_types[addon_prop_name], { addon_prop_name, addon_prop_parent_table: '__user_groups', addon_prop_parent_uid: this.slug as string }, page_select, per_page)
        } else {
            return Promise.reject({ message: 'Addon not recognized' })
        }
    }
}