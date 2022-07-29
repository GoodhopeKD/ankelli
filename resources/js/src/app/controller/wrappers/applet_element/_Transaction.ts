/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/main_laravel_db_rest_api.actions'

/*
    Type Definitions
*/
type casts_t = 'transfer_datetime'
type get_collection_params = {
    get_with_meta?: boolean,
    search_query_string?: string,
}

/* Result Objects */
type transfer_result_t = {
    user_username : string,
    initial_value : number,
    final_value : number,
}[]

/* 
    ResponseObject Export
*/
export const _TransactionResponseObject = {
    id: undefined as undefined | null | number,
    reference_code: undefined as undefined | null | string,
    session_id: undefined as undefined | null | number,
    source_user_username: undefined as undefined | null | string,
    destination_user_username: undefined as undefined | null | string,
    asset_name: undefined as undefined | null | string,
    transfer_value: undefined as undefined | null | number,
    transfer_result: undefined as undefined | null | transfer_result_t,
    transfer_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _Transaction extends _Wrapper_ implements Omit<typeof _TransactionResponseObject, casts_t> {
    id: number | null = null
    reference_code: string | null = null
    session_id: number | null = null
    source_user_username: string | null = null
    destination_user_username: string | null = null
    asset_name: string | null = null
    transfer_value: number | null = null
    transfer_result: transfer_result_t | null = null
    transfer_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _TransactionResponseObject) { super(); this.populate(args) }

    protected populate(args: typeof _TransactionResponseObject) {
        this._populate(args)
        this.transfer_datetime = new _DateTime(args.transfer_datetime)
    }

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('transactions', params, page_select, per_page)
    }
}