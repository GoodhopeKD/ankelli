/* Auxilliary Imports */
import _Date from 'app/controller/wrappers/auxilliary/_Date'
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Element Imports */
import _EmailAddress, { _EmailAddressRespObj } from 'app/controller/wrappers/addons/_EmailAddress'
import _PhoneNo, { _PhoneNoRespObj } from 'app/controller/wrappers/addons/_PhoneNo'
import _Session, { _SessionRespObj } from 'app/controller/wrappers/addons/_Session'
import _Notification, { _NotificationRespObj } from 'app/controller/wrappers/addons/_Notification'
import _PrefItem, { _PrefItemRespObj } from 'app/controller/wrappers/addons/_PrefItem'
import _UserGroupMembership, { _UserGroupMembershipRespObj } from 'app/controller/wrappers/addons/_UserGroupMembership'
import _AssetWallet, { _AssetWalletRespObj } from 'app/controller/wrappers/applet_element/_AssetWallet'
import _Transaction, { _TransactionRespObj } from 'app/controller/wrappers/applet_element/_Transaction'
import _AdminExtension, { _AdminExtensionRespObj } from 'app/controller/wrappers/user/_AdminExtension'
import _SellerExtension, { _SellerExtensionRespObj } from 'app/controller/wrappers/user/_SellerExtension'
import _BuyerExtension, { _BuyerExtensionRespObj } from 'app/controller/wrappers/user/_BuyerExtension'
/* Logger Imports */
import _Log, { _LogRespObj } from 'app/controller/wrappers/addons/_Log'
/* Actions, Configs imports */
import { mainLaravelDBRestAPICallWrapper } from 'app/controller/actions/rest_api.actions'
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'
import { _dataless_resource_collection_wrapper } from 'app/controller/redux_reducers/_resource_collection_wrapper'

/*
	Type Definitions
*/
type casts_t = 'asset_wallets' | 'pref_items' | 'last_active_datetime' | 'created_datetime' | 'updated_datetime' | 'deleted_datetime'
type _status_t = 'active' | 'inactive' | 'suspended' | 'deactivated' | 'deleted'
type addable_addon_args_t = typeof _EmailAddressRespObj | typeof _PhoneNoRespObj | typeof _UserGroupMembershipRespObj
type extension_args_t = typeof _AdminExtensionRespObj | typeof _SellerExtensionRespObj | typeof _BuyerExtensionRespObj
type get_collection_params = {
	get_with_meta?: string,
	search_query_string?: string,
	_status?: _status_t,
	user_group_membership_slug?: string,
}

const signin_data = {
	email_address: undefined as undefined | null | string,
	password: undefined as undefined | null | string,
}

const signup_data = {
	surname: undefined as undefined | null | string,
	name_s: undefined as undefined | null | string,
	email_address: undefined as undefined | null | string,
	password: undefined as undefined | null | string,
	password_confirmation: undefined as undefined | null | string,
}

const _UserExtensionsRespObj = {
	admin_extension: undefined as undefined | null | typeof _AdminExtensionRespObj,
	seller_extension: undefined as undefined | null | typeof _SellerExtensionRespObj,
	buyer_extension: undefined as undefined | null | typeof _BuyerExtensionRespObj,
}

/* 
	RespObj Export
*/
export const _UserRespObj = {
	// Hardcoded
	id: undefined as undefined | null | number,
	username: undefined as undefined | null | string,
	email_address: undefined as undefined | null | string,
	_status: undefined as undefined | null | _status_t,

	created_datetime: undefined as undefined | null | string,
	updated_datetime: undefined as undefined | null | string,
	deleted_datetime: undefined as undefined | null | string,

	// Placeholder for typescript validation
	meta: undefined,

	// Related
	avatar_image_id: undefined as undefined | null | number,
	email_addresses: undefined as undefined | null | typeof _EmailAddressRespObj[],
	phone_nos: undefined as undefined | null | typeof _PhoneNoRespObj[],

	asset_wallets: undefined as undefined | null | typeof _AssetWalletRespObj[],
	// Extensions
	..._UserExtensionsRespObj,

	// Compiled in middleware 
	last_active_datetime: undefined as undefined | null | string,
	prefs: undefined,
	pref_items: undefined as undefined | null | typeof _PrefItemRespObj[],
	active_user_group_membership_slugs: undefined as undefined | null | string[],
	active_permission_instances: undefined as undefined | null | string[],
}


/* 
	Addable AddonProps 
*/
const AddableAddonPropsRespObj = {
	// Singular
	avatar_image_id: undefined as undefined | null | number,
	// Collection
	email_addresses: [] as typeof _EmailAddressRespObj[],
	phone_nos: [] as typeof _PhoneNoRespObj[],
	user_group_memberships: [] as typeof _UserGroupMembershipRespObj[],
}

/*
	Gettable AddonProps
*/
const GettableCollectionAddonPropsRespObj = {
	notifications: [] as typeof _NotificationRespObj[],
	transactions: [] as typeof _TransactionRespObj[],
	user_group_memberships: [] as typeof _UserGroupMembershipRespObj[],
	active_sessions: [] as typeof _SessionRespObj[],
	sessions: [] as typeof _SessionRespObj[],
	failed_login_attempts: [] as typeof _LogRespObj[],
	logs: [] as typeof _LogRespObj[],
}

const GettableAddonPropsRespObj = GettableCollectionAddonPropsRespObj

/* 
	Exported Default Class
*/

export default class _User extends _Wrapper_ implements Omit<typeof _UserRespObj, casts_t | keyof typeof _UserExtensionsRespObj | keyof typeof AddableAddonPropsRespObj | keyof typeof GettableCollectionAddonPropsRespObj | 'meta'> {
	id: number | null = null
	username: string | null = null
	email_address: string | null = null

	_status: _status_t | null = null
	created_datetime: _DateTime | null = null
	updated_datetime: _DateTime | null = null
	deleted_datetime: _DateTime | null = null

	avatar_image_id: number | null = null
	email_addresses: _EmailAddress[] = []
	phone_nos: _PhoneNo[] = []

	asset_wallets: _AssetWallet[] = []

	admin_extension: _AdminExtension | null = null
	seller_extension: _SellerExtension | null = null
	buyer_extension: _BuyerExtension | null = null

	last_active_datetime: _DateTime | null = null
	pref_items: _PrefItem[] = []
	prefs: any = {}
	active_user_group_membership_slugs: string[] = []
	active_permission_instances: string[] = []

	// Fetched AddonProps
	notifications: _Notification[] = []
	active_sessions: _Session[] = []
	sessions: _Session[] = []
	logs: _Log[] = []

	protected collections_pagination_params_data = {} as { [collection_name in keyof typeof GettableCollectionAddonPropsRespObj]: typeof _dataless_resource_collection_wrapper }

	user_group_memberships: _UserGroupMembership[] = []

	/*
		Class Constructor
	*/
	constructor(args: typeof _UserRespObj, loader: (keyof typeof _UserRespObj)[] | null = null) {
		super(); this.populate(args, loader);
	}

	protected populate(args: typeof _UserRespObj, loader: (keyof typeof _UserRespObj)[] | null = null) {
		this._populate(args)

		// Clear Loaded properties
		this.email_addresses = []
		this.phone_nos = []
		this.asset_wallets = []
		this.pref_items = []

		// Load Array AddonProps
		if ((loader && loader.length && loader.includes('email_addresses')) && args.email_addresses && args.email_addresses.length) {
			args.email_addresses.forEach((element: typeof _EmailAddressRespObj) => {
				this.email_addresses.push(new _EmailAddress(element))
			})
		}
		if ((loader && loader.length && loader.includes('phone_nos')) && args.phone_nos && args.phone_nos.length) {
			args.phone_nos.forEach((element: typeof _PhoneNoRespObj) => {
				this.phone_nos.push(new _PhoneNo(element))
			})
		}
		if ((loader && loader.length && loader.includes('asset_wallets')) && args.asset_wallets && args.asset_wallets.length) {
			args.asset_wallets.forEach((element: typeof _AssetWalletRespObj) => {
				this.asset_wallets.push(new _AssetWallet(element))
			})
		}
		if ((loader && loader.length && (loader.includes('pref_items') || loader.includes('prefs'))) && args.pref_items && args.pref_items.length) {
			for (var i = 0; i < args.pref_items.length; i++) {
				this.pref_items.push(new _PrefItem(args.pref_items[i]))
				this.prefs[args.pref_items[i].key_slug as string] = args.pref_items[i].value
			}
		}
		this.active_user_group_membership_slugs = loader && loader.length && loader.includes('active_user_group_membership_slugs') && args.active_user_group_membership_slugs && args.active_user_group_membership_slugs.length ? args.active_user_group_membership_slugs : []
		this.active_permission_instances = loader && loader.length && loader.includes('active_permission_instances') && args.active_permission_instances && args.active_permission_instances.length ? args.active_permission_instances : []

		// Load DateTimes
		this.last_active_datetime = (loader && loader.length && loader.includes('last_active_datetime')) ? new _DateTime(args.last_active_datetime) : null
		this.created_datetime = (loader && loader.length && loader.includes('meta')) && args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
		this.updated_datetime = (loader && loader.length && loader.includes('meta')) && args.updated_datetime && typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
		this.deleted_datetime = (loader && loader.length && loader.includes('meta')) && args.deleted_datetime && typeof args.deleted_datetime === 'string' ? new _DateTime(args.deleted_datetime) : null

		// Load Extensions
		this.admin_extension = (loader && loader.length && loader.includes('admin_extension')) && args.admin_extension && typeof args.admin_extension === typeof _AdminExtensionRespObj ? new _AdminExtension(args.admin_extension) : null
		this.seller_extension = (loader && loader.length && loader.includes('seller_extension')) && args.seller_extension && typeof args.seller_extension === typeof _SellerExtensionRespObj ? new _SellerExtension(args.seller_extension) : null
		this.buyer_extension = (loader && loader.length && loader.includes('buyer_extension')) && args.buyer_extension && typeof args.buyer_extension === typeof _BuyerExtensionRespObj ? new _BuyerExtension(args.buyer_extension) : null
	}

	/* Creator(s) */

	static async signUp(args: typeof signup_data) {
		return this._mainLaravelDBAPICreate('users/signup', args)
	}

	/* Readers */

	public async read() {
		return this._mainLaravelDBAPIRead('users/' + this.username)
	}

	public static async getOne(params: { username: string }) {
		return this._mainLaravelDBAPIGetOne('users/' + params.username)
	}

	isInUserGroup(slug: string): boolean {
		return this.active_user_group_membership_slugs.includes(slug)
	}

	hasPermission(permission_slug: string): boolean {
		return this.active_permission_instances.includes(permission_slug)
	}

	primaryEmailAddressIsVerified(): boolean {
		const primary_email_address = this.email_addresses.find((e: _EmailAddress) => e.isPrimary(this.email_address as string)) as _EmailAddress
		return primary_email_address.isVerified()
	}

	static async signIn(data: typeof signin_data) {
		return await mainLaravelDBRestAPICallWrapper
			.dispatch({
				type: 'APP_BACKEND_API_CALL',
				method: 'POST',
				endpoint: 'users/signin',
				data
			})
			.then((resp: any) => { return Promise.resolve(resp.auth_user) })
			.catch((e: any) => { return Promise.reject(e) })
	}

	async signOut() {
		return await mainLaravelDBRestAPICallWrapper
			.dispatch({
				type: 'APP_BACKEND_API_CALL',
				method: 'POST',
				endpoint: 'users/signout'
			})
	}

	public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
		return this._mainLaravelDBAPIGetCollection('users', params, page_select, per_page)
	}

	public async getAddonProp(addon_prop_name: keyof typeof GettableAddonPropsRespObj, page_select?: laravel_api_page_selection_t, per_page?: number) {
		this.recreateGCAPPPD(GettableCollectionAddonPropsRespObj);
		const prop_types = {
			'active_sessions': _Session,
			'sessions': _Session,
			'failed_login_attempts': _Log,
			'transactions': _Transaction,
			'notifications': _Notification,
			'user_group_memberships': _UserGroupMembership,
			'logs': _Log,
		}

		if (Object.keys(prop_types).includes(addon_prop_name)) {
			return this._mainLaravelDBAPIGetAddonPropCollection(prop_types[addon_prop_name], { addon_prop_name, addon_prop_parent_table: '__users', addon_prop_parent_uid: this.username as string }, page_select, per_page)
		} else {
			return Promise.reject({ message: 'Addon not recognized' })
		}
	}

	/* Updaters */

	public async update(args: typeof _UserRespObj, update_note: string) {
		const data = {} as typeof args
		if (typeof args.email_address === typeof this.email_address && args.email_address !== this.email_address) data.email_address = args.email_address
		if (typeof args._status === typeof this._status && args._status !== this._status) data._status = args._status
		if (typeof args.avatar_image_id === typeof this.avatar_image_id && args.avatar_image_id !== this.avatar_image_id) data.avatar_image_id = args.avatar_image_id
		return this._mainLaravelDBAPIUpdate('users/' + this.id, update_note, data)
	}

	public async addAddonProp(prop_name: keyof typeof AddableAddonPropsRespObj, args: addable_addon_args_t) {
		switch (prop_name) {
			case 'email_addresses':
				return _EmailAddress.create({
					...args,
					user_username: this.username
				} as typeof _EmailAddressRespObj)

			case 'phone_nos':
				return _PhoneNo.create({
					...args,
					parent_table: '__users',
					parent_uid: this.username
				} as typeof _PhoneNoRespObj)

			case 'user_group_memberships':
				return _UserGroupMembership.create({
					...args,
					user_username: this.username
				} as typeof _UserGroupMembershipRespObj)

			default:
				return Promise.reject({ message: 'Addon not recognized' })
		}
	}

	async addExtension(prop_name: keyof typeof _UserExtensionsRespObj, args: extension_args_t) {
		switch (prop_name) {
			case 'admin_extension':
				return _AdminExtension.create({
					...args,
					user_username: this.username
				} as typeof _AdminExtensionRespObj)

			case 'seller_extension':
				return _SellerExtension.create({
					...args,
					user_username: this.username
				} as typeof _SellerExtensionRespObj)

			case 'buyer_extension':
				return _SellerExtension.create({
					...args,
					user_username: this.username
				} as typeof _BuyerExtensionRespObj)

			default:
				return Promise.reject({ message: 'Extension not recognized' })
		}
	}
}