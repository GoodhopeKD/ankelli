/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'

/*
    Type Definitions
*/
type casts_t = 'action_datetime'
type logged_action_type_t = 'entry_create' | 'entry_read' | 'entry_update' | 'entry_delete' | 'function_call' | 'batch_init'
type get_collection_params = {
    get_with_meta?: boolean,
    search_query_string?: string,
}

/* Result Objects */
type entry_update_result_t = {
    column_name : string,
    initial_value : string,
    final_value : string,
}[]

/* 
    RespObj Export
*/
export const _LogRespObj = {
    id: undefined as undefined | null | string,
    session_token: undefined as undefined | null | string,
    action_note: undefined as undefined | null | string,
    action_type: undefined as undefined | null | logged_action_type_t,
    action_user_username: undefined as undefined | null | string,
    action_datetime: undefined as undefined | null | string,
    batch_code: undefined as undefined | null | string,
    entry_table: undefined as undefined | null | string,
    entry_uid: undefined as undefined | null | string | number,
    entry_update_result: undefined as undefined | null | entry_update_result_t
}

/*
    Exported Default Class
*/
export default class _Log extends _Wrapper_ implements Omit<typeof _LogRespObj, casts_t> {
    id: string | null = null
    session_token: string| null = null
    action_note: string | null = null
    action_type: logged_action_type_t | null = null
    action_user_username: string | null = null
    action_datetime: _DateTime | null = null
    batch_code: string | null = null
    entry_table: string | null = null
    entry_uid: string | number | null = null
    entry_update_result: entry_update_result_t | null = null

    /* Class Constructor */
    constructor(args: typeof _LogRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _LogRespObj) {
        this._populate(args)
        this.action_datetime = new _DateTime(args.action_datetime)
    }

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('logs', params, page_select, per_page)
    }
}