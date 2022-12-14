/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Element Imports */
import _UserGroup, { _UserGroupRespObj } from 'app/controller/wrappers/systools/_UserGroup'
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
type get_collection_params = {
    get_with_meta?: boolean,
    user_username?: string,
    user_group_slug?: string,
    _status?: _status_t,
}

/* 
    RespObj Export
*/
export const _UserGroupMembershipRespObj = {
    id: undefined as undefined | null | number,
    user_username: undefined as undefined | null | string,
    user_group_slug: undefined as undefined | null | string,
    _status: undefined as undefined | null | _status_t,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
}

/*
    Gettable AddonProps
*/
const GettableSingularAddonPropsRespObj = {
    user_group: undefined as undefined | null | typeof _UserGroupRespObj,
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
export default class _UserGroupMembership extends _Wrapper_ implements Omit<typeof _UserGroupMembershipRespObj, casts_t> {
    id: number | null = null
    user_username: string | null = null
    user_group_slug: string | null = null
    _status: _status_t | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null

    user_group: _UserGroup | null = null

    protected gettable_collection_addon_props_page_selects_data = {} as { [collection_name in keyof typeof GettableCollectionAddonPropsRespObj]: typeof _dataless_resource_collection_wrapper }

    logs: _Log[] = []

    /* Class Constructor */
    constructor(args: typeof _UserGroupMembershipRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _UserGroupMembershipRespObj) {
        this._populate(args)
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = args.updated_datetime && typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _UserGroupMembershipRespObj) {
        return this._mainLaravelDBAPICreate('admin/systools/user-group-memberships', args)
    }

    /* Readers */

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('accounts/systools/user-group-memberships', params, page_select, per_page)
    }

    public async getAddonProp(addon_prop_name: keyof typeof GettableAddonPropsRespObj, page_select?: laravel_api_page_selection_t, per_page?: number) {
        switch (addon_prop_name) {
            case 'user_group':
                return _UserGroup.getOne({ slug: this.user_group_slug as string })
                    .then((resp: any) => { this._populate({ [addon_prop_name]: resp }); return Promise.resolve(resp) })
                    .catch((e: any) => { return Promise.reject(e) })
        }
        this.recreateGCAPPPD(GettableCollectionAddonPropsRespObj);
        const prop_types = {
            //'user_group': _UserGroup,
            'logs': _Log,
        }
        if (Object.keys(prop_types).includes(addon_prop_name)) {
            return this._mainLaravelDBAPIGetAddonPropCollection(prop_types[addon_prop_name], { addon_prop_name, addon_prop_parent_table: '__user_group_memberships', addon_prop_parent_uid: this.id as number }, page_select, per_page)
        } else {
            return Promise.reject({ message: 'Addon not recognized' })
        }
    }
}