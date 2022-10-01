/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Element Imports */
import { __UserDisplayCardRespObj } from 'app/controller/wrappers/auxilliary/__UserDisplayCardRespObj'
import _Message, { _MessageRespObj } from 'app/controller/wrappers/addons/_Message'
/* Logger Imports */
import _Log, { _LogRespObj } from 'app/controller/wrappers/addons/_Log'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'
import { _dataless_resource_collection_wrapper } from 'app/controller/redux_reducers/_resource_collection_wrapper'

/*
    Type Definitions
*/
type casts_t = 'last_sent_message' | 'created_datetime' | 'closed_datetime'
type addable_addon_args_t = typeof _MessageRespObj
type get_collection_params = {
    get_with_meta?: boolean,
    get_closed?: boolean,
    search_query_string?: string,
    participant_username?: string,
}

/* 
    RespObj Export
*/
export const _ChatRespObj = {
    id: undefined as undefined | null | string,
    participant_one_username: undefined as undefined | null | string,
    participant_one: undefined as undefined | null | typeof __UserDisplayCardRespObj,
    participant_one_visible: undefined as undefined | null | boolean,
    participant_two_username: undefined as undefined | null | string,
    participant_two: undefined as undefined | null | typeof __UserDisplayCardRespObj,
    participant_two_visible: undefined as undefined | null | boolean,
    last_sent_message: undefined as undefined | null | typeof _MessageRespObj,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
}

/* 
    Addable AddonProps 
*/
const AddableAddonPropsRespObj = {
    messages: [] as typeof _MessageRespObj[]
}

/*
    Gettable AddonProps
*/
const GettableCollectionAddonPropsRespObj = {
    messages: [] as typeof _MessageRespObj[],
    logs: [] as typeof _LogRespObj[]
}

const GettableAddonPropsRespObj = GettableCollectionAddonPropsRespObj

/*
    Exported Default Class
*/
export default class _Chat extends _Wrapper_ implements Omit<typeof _ChatRespObj, casts_t> {
    id: string | null = null
    participant_one_username: string | null = null
    participant_one: typeof __UserDisplayCardRespObj | null = null
    participant_one_visible: boolean | null = null
    participant_two_username: string | null = null
    participant_two: typeof __UserDisplayCardRespObj | null = null
    participant_two_visible: boolean | null = null
    last_sent_message: _Message | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null

    protected gettable_collection_addon_props_page_selects_data = {} as { [collection_name in keyof typeof GettableCollectionAddonPropsRespObj]: typeof _dataless_resource_collection_wrapper }

    messages: _Message[] = []
    logs: _Log[] = []

    /* Class Constructor */
    constructor(args: typeof _ChatRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _ChatRespObj) {
        this._populate(args)
        this.last_sent_message = args.last_sent_message && typeof args.last_sent_message === typeof _MessageRespObj ? new _Message(args.last_sent_message) : null
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _ChatRespObj) {
        return this._mainLaravelDBAPICreate('support/chats', args)
    }

    /* Readers */
    
    public async read() {
        return this._mainLaravelDBAPIRead('support/chats/' + this.id)
    }

    public static async getOne(params: { id: number }) {
        return this._mainLaravelDBAPIGetOne('support/chats/' + params.id)
    }

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('support/chats', params, page_select, per_page)
    }

    public async getAddonProp(addon_prop_name: keyof typeof GettableAddonPropsRespObj, page_select?: laravel_api_page_selection_t, per_page?: number) {
        this.recreateGCAPPPD(GettableCollectionAddonPropsRespObj);
        const prop_types = {
            'messages': _Message,
            'logs': _Log,
        }
        if (Object.keys(prop_types).includes(addon_prop_name)) {
            return this._mainLaravelDBAPIGetAddonPropCollection(prop_types[addon_prop_name], { addon_prop_name, addon_prop_parent_table: '__chats', addon_prop_parent_uid: this.id as string }, page_select, per_page)
        } else {
            return Promise.reject({ message: 'Addon not recognized' })
        }
    }

    /* Updaters */

    public async addAddonProp(prop_name: keyof typeof AddableAddonPropsRespObj, args: addable_addon_args_t) {
        const prop_types = {
            'messages': _Message
        }
        args = { ...args, parent_table: '__chats', parent_uid: this.id }
        if (Object.keys(prop_types).includes(prop_name)) {
            return prop_types[prop_name].create(args)
        } else {
            return Promise.reject({ message: 'Addon not recognized' })
        }
    }

    public async update() {

    }
}