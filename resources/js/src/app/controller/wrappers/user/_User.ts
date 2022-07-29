/* Auxilliary Imports */
import _Date from 'app/controller/wrappers/auxilliary/_Date'
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Element Imports */
import _EmailAddress, { _EmailAddressResponseObject } from 'app/controller/wrappers/addons/_EmailAddress'
import _PhoneNumber, { _PhoneNumberResponseObject } from 'app/controller/wrappers/addons/_PhoneNumber'
import _Session, { _SessionResponseObject } from 'app/controller/wrappers/addons/_Session'
import _Notification, { _NotificationResponseObject } from 'app/controller/wrappers/addons/_Notification'
import _PreferenceItem, { _PreferenceItemResponseObject } from 'app/controller/wrappers/addons/_PreferenceItem'
import _UserGroupMembership, { _UserGroupMembershipResponseObject } from 'app/controller/wrappers/addons/_UserGroupMembership'
import _AssetAccount, { _AssetAccountResponseObject } from 'app/controller/wrappers/applet_element/_AssetAccount'
import _Transaction, { _TransactionResponseObject } from 'app/controller/wrappers/applet_element/_Transaction'
import _AdminExtension, { _AdminExtensionResponseObject } from 'app/controller/wrappers/user/_AdminExtension'
import _SellerExtension, { _SellerExtensionResponseObject } from 'app/controller/wrappers/user/_SellerExtension'
import _BuyerExtension, { _BuyerExtensionResponseObject } from 'app/controller/wrappers/user/_BuyerExtension'
/* Logger Imports */
import _Log, { _LogResponseObject } from 'app/controller/wrappers/addons/_Log'
/* Actions, Configs imports */
import { mainLaravelDBRestAPICallWrapper } from 'app/controller/actions/rest_api.actions'
import { laravel_api_page_selection_t } from 'app/controller/actions/main_laravel_db_rest_api.actions'
import { _dataless_resource_collection_wrapper } from 'app/controller/redux_reducers/_resource_collection_wrapper'

/*
	Type Definitions
*/
type casts_t = 'asset_accounts' | 'preference_items' | 'last_active_datetime' | 'created_datetime' | 'updated_datetime' | 'deleted_datetime'
type account_status_t = 'active' | 'inactive' | 'suspended' | 'deactivated' | 'deleted'
type addable_addon_args_t = typeof _EmailAddressResponseObject | typeof _PhoneNumberResponseObject | typeof _UserGroupMembershipResponseObject
type extension_args_t = typeof _AdminExtensionResponseObject | typeof _SellerExtensionResponseObject | typeof _BuyerExtensionResponseObject
type get_collection_params = {
	get_with_meta?: string,
	search_query_string?: string,
	account_status?: account_status_t,
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

const _UserExtensionsResponseObject = {
	admin_extension: undefined as undefined | null | typeof _AdminExtensionResponseObject,
	seller_extension: undefined as undefined | null | typeof _SellerExtensionResponseObject,
	buyer_extension: undefined as undefined | null | typeof _BuyerExtensionResponseObject,
}

/* 
	ResponseObject Export
*/
export const _UserResponseObject = {
	// Hardcoded
	id: undefined as undefined | null | number,
	username: undefined as undefined | null | string,
	email_address: undefined as undefined | null | string,
	account_status: undefined as undefined | null | account_status_t,

	created_datetime: undefined as undefined | null | string,
	updated_datetime: undefined as undefined | null | string,
	deleted_datetime: undefined as undefined | null | string,

	// Placeholder for typescript validation
	meta: undefined,

	// Related
	avatar_image_id: undefined as undefined | null | number,
	email_addresses: undefined as undefined | null | typeof _EmailAddressResponseObject[],
	phone_numbers: undefined as undefined | null | typeof _PhoneNumberResponseObject[],

	asset_accounts: undefined as undefined | null | typeof _AssetAccountResponseObject[],
	// Extensions
	..._UserExtensionsResponseObject,

	// Compiled in middleware 
	last_active_datetime: undefined as undefined | null | string,
	preferences: undefined,
	preference_items: undefined as undefined | null | typeof _PreferenceItemResponseObject[],
	active_user_group_memberships: undefined as undefined | null | string[],
	active_permission_instances: undefined as undefined | null | string[],
}


/* 
	Addable AddonProps 
*/
const AddableAddonPropsResponseObject = {
	// Singular
	avatar_image_id: undefined as undefined | null | number,
	// Collection
	email_addresses: [] as typeof _EmailAddressResponseObject[],
	phone_numbers: [] as typeof _PhoneNumberResponseObject[],
	user_group_memberships: [] as typeof _UserGroupMembershipResponseObject[],
}

/*
	Gettable AddonProps
*/
const GettableCollectionAddonPropsResponseObject = {
	notifications: [] as typeof _NotificationResponseObject[],
	transactions: [] as typeof _TransactionResponseObject[],
	user_group_memberships: [] as typeof _UserGroupMembershipResponseObject[],
	active_sessions: [] as typeof _SessionResponseObject[],
	sessions: [] as typeof _SessionResponseObject[],
	failed_login_attempts: [] as typeof _LogResponseObject[],
	logs: [] as typeof _LogResponseObject[],
}

const GettableAddonPropsResponseObject = GettableCollectionAddonPropsResponseObject

/* 
	Exported Default Class
*/

export default class _User extends _Wrapper_ implements Omit<typeof _UserResponseObject, casts_t | keyof typeof _UserExtensionsResponseObject | keyof typeof AddableAddonPropsResponseObject | keyof typeof GettableCollectionAddonPropsResponseObject | 'meta'> {
	id: number | null = null
	username: string | null = null
	email_address: string | null = null

	account_status: account_status_t | null = null
	created_datetime: _DateTime | null = null
	updated_datetime: _DateTime | null = null
	deleted_datetime: _DateTime | null = null

	avatar_image_id: number | null = null
	email_addresses: _EmailAddress[] = []
	phone_numbers: _PhoneNumber[] = []

	asset_accounts: _AssetAccount[] = []

	admin_extension: _AdminExtension | null = null
	seller_extension: _SellerExtension | null = null
	buyer_extension: _BuyerExtension | null = null

	last_active_datetime: _DateTime | null = null
	preference_items: _PreferenceItem[] = []
	preferences: any = {}
	active_management_unit_memberships: string[] = []
	active_user_group_memberships: string[] = []
	active_permission_instances: string[] = []

	// Fetched AddonProps
	notifications: _Notification[] = []
	active_sessions: _Session[] = []
	sessions: _Session[] = []
	logs: _Log[] = []

	protected collections_pagination_params_data = {} as { [collection_name in keyof typeof GettableCollectionAddonPropsResponseObject]: typeof _dataless_resource_collection_wrapper }

	user_group_memberships: _UserGroupMembership[] = []

	/*
		Class Constructor
	*/
	constructor(args: typeof _UserResponseObject, loader: (keyof typeof _UserResponseObject)[] | null = null) {
		super(); this.populate(args, loader);
	}

	protected populate(args: typeof _UserResponseObject, loader: (keyof typeof _UserResponseObject)[] | null = null) {
		this._populate(args)

		// Clear Loaded properties
		this.email_addresses = []
		this.phone_numbers = []
		this.asset_accounts = []
		this.preference_items = []

		// Load Array AddonProps
		if ((loader && loader.length && loader.includes('email_addresses')) && args.email_addresses && args.email_addresses.length) {
			args.email_addresses.forEach((element: typeof _EmailAddressResponseObject) => {
				this.email_addresses.push(new _EmailAddress(element))
			})
		}
		if ((loader && loader.length && loader.includes('phone_numbers')) && args.phone_numbers && args.phone_numbers.length) {
			args.phone_numbers.forEach((element: typeof _PhoneNumberResponseObject) => {
				this.phone_numbers.push(new _PhoneNumber(element))
			})
		}
		if ((loader && loader.length && loader.includes('asset_accounts')) && args.asset_accounts && args.asset_accounts.length) {
			args.asset_accounts.forEach((element: typeof _AssetAccountResponseObject) => {
				this.asset_accounts.push(new _AssetAccount(element))
			})
		}
		if ((loader && loader.length && (loader.includes('preference_items') || loader.includes('preferences'))) && args.preference_items && args.preference_items.length) {
			for (var i = 0; i < args.preference_items.length; i++) {
				this.preference_items.push(new _PreferenceItem(args.preference_items[i]))
				this.preferences[args.preference_items[i].key_slug as string] = args.preference_items[i].value
			}
		}
		this.active_user_group_memberships = (loader && loader.length && loader.includes('active_user_group_memberships')) && args.active_user_group_memberships && args.active_user_group_memberships.length && typeof args.active_user_group_memberships === typeof _UserResponseObject.active_user_group_memberships ? args.active_user_group_memberships : []
		this.active_permission_instances = (loader && loader.length && loader.includes('active_permission_instances')) && args.active_permission_instances && args.active_permission_instances.length && typeof args.active_permission_instances === typeof _UserResponseObject.active_permission_instances ? args.active_permission_instances : []

		// Load DateTimes
		this.last_active_datetime = (loader && loader.length && loader.includes('last_active_datetime')) ? new _DateTime(args.last_active_datetime) : null
		this.created_datetime = (loader && loader.length && loader.includes('meta')) && args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
		this.updated_datetime = (loader && loader.length && loader.includes('meta')) && args.updated_datetime && typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
		this.deleted_datetime = (loader && loader.length && loader.includes('meta')) && args.deleted_datetime && typeof args.deleted_datetime === 'string' ? new _DateTime(args.deleted_datetime) : null

		// Load Extensions
		this.admin_extension = (loader && loader.length && loader.includes('admin_extension')) && args.admin_extension && typeof args.admin_extension === typeof _AdminExtensionResponseObject ? new _AdminExtension(args.admin_extension) : null
		this.seller_extension = (loader && loader.length && loader.includes('seller_extension')) && args.seller_extension && typeof args.seller_extension === typeof _SellerExtensionResponseObject ? new _SellerExtension(args.seller_extension) : null
		this.buyer_extension = (loader && loader.length && loader.includes('buyer_extension')) && args.buyer_extension && typeof args.buyer_extension === typeof _BuyerExtensionResponseObject ? new _BuyerExtension(args.buyer_extension) : null
	}

	/* Creator(s) */

	static async signUp(args: typeof signup_data) {
		return this._mainLaravelDBAPICreate('users/signup', args)
	}

	/* Readers */

	isIn_ManagementUnit(slug: string): boolean {
		return this.active_management_unit_memberships.includes(slug)
	}

	isIn_UserGroup(slug: string): boolean {
		return this.active_user_group_memberships.includes(slug)
	}

	has_Permission(permission_slug: string): boolean {
		return this.active_permission_instances.includes(permission_slug)
	}

	primaryEmailAddressIsVerified(): boolean {
		const primary_email_address = this.email_addresses.find((e: _EmailAddress) => e.isPrimary(this.email_address as string)) as _EmailAddress
		return primary_email_address.isVerified()
	}

	static async signIn(data: typeof signin_data) {
		return await mainLaravelDBRestAPICallWrapper
			.dispatch({
				type: 'MAIN_LARAVEL_DB_REST_API_CALL',
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
				type: 'MAIN_LARAVEL_DB_REST_API_CALL',
				method: 'POST',
				endpoint: 'users/signout'
			})
	}

	public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
		return this._mainLaravelDBAPIGetCollection('users', params, page_select, per_page)
	}

	public async getAddonProp(addon_prop_name: keyof typeof GettableAddonPropsResponseObject, page_select?: laravel_api_page_selection_t, per_page?: number) {
		this.recreateGCAPPPD(GettableCollectionAddonPropsResponseObject);
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

	public async update(args: typeof _UserResponseObject) {
		const data = {} as typeof args
		if (typeof args.email_address === typeof this.email_address && args.email_address !== this.email_address) data.email_address = args.email_address
		if (typeof args.account_status === typeof this.account_status && args.account_status !== this.account_status) data.account_status = args.account_status
		if (typeof args.avatar_image_id === typeof this.avatar_image_id && args.avatar_image_id !== this.avatar_image_id) data.avatar_image_id = args.avatar_image_id
		return this._mainLaravelDBAPIUpdate('users/' + this.id, data)
	}

	public async addAddonProp(prop_name: keyof typeof AddableAddonPropsResponseObject, args: addable_addon_args_t) {
		switch (prop_name) {
			case 'email_addresses':
				return _EmailAddress.create({
					...args,
					user_username: this.username
				} as typeof _EmailAddressResponseObject)

			case 'phone_numbers':
				return _PhoneNumber.create({
					...args,
					parent_table: '__users',
					parent_uid: this.username
				} as typeof _PhoneNumberResponseObject)

			case 'user_group_memberships':
				return _UserGroupMembership.create({
					...args,
					user_username: this.username
				} as typeof _UserGroupMembershipResponseObject)

			default:
				return Promise.reject({ message: 'Addon not recognized' })
		}
	}

	async addExtension(prop_name: keyof typeof _UserExtensionsResponseObject, args: extension_args_t) {
		switch (prop_name) {
			case 'admin_extension':
				return _AdminExtension.create({
					...args,
					user_username: this.username
				} as typeof _AdminExtensionResponseObject)

			case 'seller_extension':
				return _SellerExtension.create({
					...args,
					user_username: this.username
				} as typeof _SellerExtensionResponseObject)

			case 'buyer_extension':
				return _SellerExtension.create({
					...args,
					user_username: this.username
				} as typeof _BuyerExtensionResponseObject)

			default:
				return Promise.reject({ message: 'Extension not recognized' })
		}
	}
}