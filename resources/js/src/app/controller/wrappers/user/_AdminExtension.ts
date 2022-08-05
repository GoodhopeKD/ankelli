/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Element Imports */
import _PermissionInstance, { _PermissionInstanceRespObj } from 'app/controller/wrappers/addons/_PermissionInstance'
/* Logger Imports */
import _Log, { _LogRespObj } from 'app/controller/wrappers/addons/_Log'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/main_laravel_db_rest_api.actions'
import { _dataless_resource_collection_wrapper } from 'app/controller/redux_reducers/_resource_collection_wrapper'

/*
	Type Definitions
*/
type casts_t = 'created_datetime' | 'updated_datetime' | 'deleted_datetime'
type status_t = 'active' | 'suspended' | 'deactivated'
type addable_addon_args_t = typeof _PermissionInstanceRespObj

/* 
	RespObj Export
*/
export const _AdminExtensionRespObj = {
	id: undefined as undefined | null | number,
	user_username:  undefined as undefined | null | string,
	post_title:  undefined as undefined | null | string,
	status: undefined as undefined | null | status_t,

	creator_username: undefined as undefined | null | string,
	created_datetime: undefined as undefined | null | string,
	updated_datetime: undefined as undefined | null | string,
	deleted_datetime: undefined as undefined | null | string,
}

/* 
	Addable AddonProps 
*/
const AddableAddonPropsRespObj = {
	permission_instances: [] as typeof _PermissionInstanceRespObj[],
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
export default class _AdminExtension extends _Wrapper_ implements Omit<typeof _AdminExtensionRespObj, casts_t> {
	id: number | null = null
	user_username: string | null = null
	post_title: string | null = null
	status: status_t | null = null

	creator_username: string | null = null
	created_datetime: _DateTime | null = null
	updated_datetime: _DateTime | null = null
	deleted_datetime: _DateTime | null = null

	protected collections_pagination_params_data = {} as { [collection_name in keyof typeof GettableCollectionAddonPropsRespObj]: typeof _dataless_resource_collection_wrapper }

	permission_instances: _PermissionInstance[] = []
	logs: _Log[] = []

	/*
		Class Constructor
	*/
	constructor(args: typeof _AdminExtensionRespObj) { super(); this.populate(args) }

	protected populate(args: typeof _AdminExtensionRespObj) {
		this._populate(args)
		this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
		this.updated_datetime = args.updated_datetime && typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
		this.deleted_datetime = args.deleted_datetime && typeof args.deleted_datetime === 'string' ? new _DateTime(args.deleted_datetime) : null
	}

	/* Creator(s) */

	public static async create(args: typeof _AdminExtensionRespObj) {
		return this._mainLaravelDBAPICreate('users/' + args.user_username + 'admin_extensions', args)
	}

	/* Readers */

	public async getAddonProp(addon_prop_name: keyof typeof GettableAddonPropsRespObj, page_select?: laravel_api_page_selection_t, per_page?: number) {
		this.recreateGCAPPPD(GettableCollectionAddonPropsRespObj);
		const prop_types = {
			'permission_instances': _PermissionInstance,
			'logs': _Log,
		}
		if (Object.keys(prop_types).includes(addon_prop_name)) {
			return this._mainLaravelDBAPIGetAddonPropCollection(prop_types[addon_prop_name], { addon_prop_name, addon_prop_parent_table: '__admin_extensions', addon_prop_parent_pmkey: this.user_username as string }, page_select, per_page)
		} else {
			return Promise.reject({ message: 'Addon not recognized' })
		}
	}

	/* Updaters */

	public async addAddonProp(prop_name: keyof typeof AddableAddonPropsRespObj, args: addable_addon_args_t) {
		switch (prop_name) {
			case 'permission_instances':
				return _PermissionInstance.create({
					...args,
					parent_table: '__admin_extensions',
					parent_pmkey: this.user_username
				} as typeof _PermissionInstanceRespObj)

			default:
				return Promise.reject({ message: 'Addon not recognized' })
		}
	}
}