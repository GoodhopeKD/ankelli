/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Element Imports */
import _Trade, { _TradeResponseObject } from 'app/controller/wrappers/applet_element/_Trade'
/* Logger Imports */
import _Log, { _LogResponseObject } from 'app/controller/wrappers/addons/_Log'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/main_laravel_db_rest_api.actions'
import { _dataless_resource_collection_wrapper } from 'app/controller/redux_reducers/_resource_collection_wrapper'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'updated_datetime' | 'deleted_datetime'
type status_t = 'active' | 'suspended' | 'deactivated'

/* 
    ResponseObject Export
*/
export const _BuyerExtensionResponseObject = {
    id: undefined as undefined | null | number,
    user_username: undefined as undefined | null | string,
    status: undefined as undefined | null | status_t,

    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
    deleted_datetime: undefined as undefined | null | string,
}

/*
    Gettable AddonProps
*/
const GettableCollectionAddonPropsResponseObject = {
    trades_accepted: [] as typeof _TradeResponseObject[],
    logs: [] as typeof _LogResponseObject[]
}

/* All addons */
const GettableAddonPropsResponseObject = GettableCollectionAddonPropsResponseObject

/*
    Exported Default Class
*/
export default class _BuyerExtension extends _Wrapper_ implements Omit<typeof _BuyerExtensionResponseObject, casts_t> {
    id: number | null = null
    user_username: string | null = null
    status: status_t | null = null

    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null
    deleted_datetime: _DateTime | null = null

    protected gettable_collection_addon_props_page_selects_data = {} as { [collection_name in keyof typeof GettableCollectionAddonPropsResponseObject]: typeof _dataless_resource_collection_wrapper }

    trades_accepted: _Trade[] = []
    logs: _Log[] = []

    /* Class Constructor */
    constructor(args: typeof _BuyerExtensionResponseObject) { super(); this.populate(args) }

    protected populate(args: typeof _BuyerExtensionResponseObject) {
        this._populate(args)
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = args.updated_datetime && typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
        this.deleted_datetime = args.deleted_datetime && typeof args.deleted_datetime === 'string' ? new _DateTime(args.deleted_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _BuyerExtensionResponseObject) {
        return this._mainLaravelDBAPICreate('users/' + args.user_username + '/buyer_extension', args)
    }

    /* Readers */

    public async getAddonProp(addon_prop_name: keyof typeof GettableAddonPropsResponseObject, page_select?: laravel_api_page_selection_t, per_page?: number) {
        this.recreateGCAPPPD(GettableCollectionAddonPropsResponseObject);
        const prop_types = {
            'trades_accepted': _Trade,
            'logs': _Log,
        }
        if (Object.keys(prop_types).includes(addon_prop_name)) {
            return this._mainLaravelDBAPIGetAddonPropCollection(prop_types[addon_prop_name], { addon_prop_name, addon_prop_parent_table: '__buyer_extensions', addon_prop_parent_uid: this.user_username as string }, page_select, per_page)
        } else {
            return Promise.reject({ message: 'Addon not recognized' })
        }
    }

    /* Updaters */
}