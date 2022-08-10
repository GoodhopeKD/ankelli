/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Logger Imports */
import _Log, { _LogRespObj } from 'app/controller/wrappers/addons/_Log'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'
import { _dataless_resource_collection_wrapper } from 'app/controller/redux_reducers/_resource_collection_wrapper'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'updated_datetime'
type status_t = 'open' | 'closed'
type type_t = 'bug_report' | 'crash_report' | 'vulnerability_report' | 'abuse_report' | 'appreciation_message' | 'contact_form_message'
type get_collection_params = {
    get_with_meta?: boolean,
    get_closed?: boolean,
    search_query_string?: string,
    type?: type_t,
}

/* 
    RespObj Export
*/
export const _FeedbackReportRespObj = {
    ticket_code: undefined as undefined | null | string,
    session_token: undefined as undefined | null | string,
    status: undefined as undefined | null | status_t,
    type: undefined as undefined | null | type_t,
    title: undefined as undefined | null | string,
    message: undefined as undefined | null | string,
    creator_name: undefined as undefined | null | string,
    creator_email: undefined as undefined | null | string,
    closing_note: undefined as undefined | null | string,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
}

/*
    Gettable AddonProps
*/
const GettableCollectionAddonPropsRespObj = {
    logs: [] as typeof _LogRespObj[]
}

const GettableAddonPropsRespObj = GettableCollectionAddonPropsRespObj

/*
    Exported Default Class
*/
export default class _FeedbackReport extends _Wrapper_ implements Omit<typeof _FeedbackReportRespObj, casts_t> {
    ticket_code: string | null = null
    session_token: string| null = null
    status: status_t | null = null
    type: type_t | null = null
    title: string | null = null
    message: string | null = null
    creator_name: string | null = null
    creator_email: string | null = null
    closing_note: string | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null

    protected gettable_collection_addon_props_page_selects_data = {} as { [collection_name in keyof typeof GettableCollectionAddonPropsRespObj]: typeof _dataless_resource_collection_wrapper }

    logs: _Log[] = []

    /* Class Constructor */
    constructor(args: typeof _FeedbackReportRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _FeedbackReportRespObj) {
        this._populate(args)
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = args.updated_datetime && typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _FeedbackReportRespObj) {
        return this._mainLaravelDBAPICreate('feedback_reports', args)
    }

    /* Readers */

    public async read() {
        return this._mainLaravelDBAPIRead('feedback_reports/' + this.ticket_code)
    }

    public static async getOne(params: { id?: number, ticket_code?: string }) {
        return this._mainLaravelDBAPIGetOne('feedback_reports/' + (params.ticket_code ? params.ticket_code : params.id))
    }

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('feedback_reports', params, page_select, per_page)
    }

    public async getAddonProp(addon_prop_name: keyof typeof GettableAddonPropsRespObj, page_select?: laravel_api_page_selection_t, per_page?: number) {
        this.recreateGCAPPPD(GettableCollectionAddonPropsRespObj);
        const prop_types = {
            'logs': _Log
        }
        if (Object.keys(prop_types).includes(addon_prop_name)) {
            return this._mainLaravelDBAPIGetAddonPropCollection(prop_types[addon_prop_name], { addon_prop_name, addon_prop_parent_table: '__feedback_reports', addon_prop_parent_uid: this.ticket_code as string }, page_select, per_page)

        } else {
            return Promise.reject({ message: 'Addon not recognized' })
        }
    }
}