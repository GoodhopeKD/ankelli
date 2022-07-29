/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Element Imports */
import _File, { _FileResponseObject } from 'app/controller/wrappers/addons/_File'
import _PermissionInstance, { _PermissionInstanceResponseObject } from 'app/controller/wrappers/addons/_PermissionInstance'
import _UserGroupMembership, { _UserGroupMembershipResponseObject } from 'app/controller/wrappers/addons/_UserGroupMembership'
/* Logger Imports */
import _Log, { _LogResponseObject } from 'app/controller/wrappers/addons/_Log'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/main_laravel_db_rest_api.actions'
import { _dataless_resource_collection_wrapper } from 'app/controller/redux_reducers/_resource_collection_wrapper'

/*
    Type Definitions
*/
type casts_t = 'profile_image' | 'created_datetime' | 'updated_datetime' | 'deleted_datetime'
type status_t = 'active' | 'deactivated'
type get_collection_params = {
    get_with_meta?: boolean,
    get_with_deleted?: boolean,
    status?: status_t,
}

/* 
    ResponseObject Export
*/
export const _UserGroupResponseObject = {
    id: undefined as undefined | null | number,
    name: undefined as undefined | null | string,
    slug: undefined as undefined | null | string,
    description: undefined as undefined | null | string,
    profile_image: undefined as undefined | null | typeof _FileResponseObject,
    status: undefined as undefined | null | status_t,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
    deleted_datetime: undefined as undefined | null | string,
}

/*
    Gettable AddonProps
*/
const GettableCollectionAddonPropsResponseObject = {
    permission_instances: [] as typeof _PermissionInstanceResponseObject[],
    user_group_memberships: [] as typeof _UserGroupMembershipResponseObject[],
    logs: [] as typeof _LogResponseObject[],
}
const GettableAddonPropsResponseObject = GettableCollectionAddonPropsResponseObject

/*
    Exported Default Class
*/
export default class _UserGroup extends _Wrapper_ implements Omit<typeof _UserGroupResponseObject, casts_t> {
    id: number | null = null
    name: string | null = null
    slug: string | null = null
    description: string | null = null
    profile_image: _File | null = null
    status: status_t | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null
    deleted_datetime: _DateTime | null = null

    protected gettable_collection_addon_props_page_selects_data = {} as { [collection_name in keyof typeof GettableCollectionAddonPropsResponseObject]: typeof _dataless_resource_collection_wrapper }

    permission_instances: _PermissionInstance[] = []
    user_group_memberships: _UserGroupMembership[] = []
    logs: _Log[] = []

    /* Class Constructor */
    constructor(args: typeof _UserGroupResponseObject) { super(); this.populate(args) }

    protected populate(args: typeof _UserGroupResponseObject) {
        this._populate(args)
        this.profile_image = args.profile_image && typeof args.profile_image === typeof _FileResponseObject ? new _File(args.profile_image) : null

        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = args.updated_datetime && typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
        this.deleted_datetime = args.deleted_datetime && typeof args.deleted_datetime === 'string' ? new _DateTime(args.deleted_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _UserGroupResponseObject) {
        return this._mainLaravelDBAPICreate('system_tools/user_groups', args)
    }

    /* Readers */

    public static async getOne(params: { id?: number, slug?: string }) {
        return this._mainLaravelDBAPIGetOne('system_tools/user_groups/' + (params.slug ? params.slug : params.id))
    }

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('system_tools/user_groups', params, page_select, per_page)
    }

    public async getAddonProp(addon_prop_name: keyof typeof GettableAddonPropsResponseObject, page_select?: laravel_api_page_selection_t, per_page?: number) {
        this.recreateGCAPPPD(GettableCollectionAddonPropsResponseObject);
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