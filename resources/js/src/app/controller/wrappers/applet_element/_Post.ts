/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Element Imports */
import _File, { _FileRespObj } from 'app/controller/wrappers/addons/_File'
/* Logger Imports */
import _Log, { _LogRespObj } from 'app/controller/wrappers/addons/_Log'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/main_laravel_db_rest_api.actions'
import { _dataless_resource_collection_wrapper } from 'app/controller/redux_reducers/_resource_collection_wrapper'

/*
    Type Definitions
*/
type casts_t = 'files' | 'post_datetime' | 'expiry_datetime' | 'created_datetime' | 'updated_datetime' | 'deleted_datetime'
type status_t = 'visible' | 'hidden'
type get_collection_params = {
    get_with_meta?: boolean,
    search_query_string?: string,
    status?: status_t,
    creator_username?: string,
}

/* 
    RespObj Export
*/
export const _PostRespObj = {
    id: undefined as undefined | null | number,
    title: undefined as undefined | null | string,
    exerpt: undefined as undefined | null | string,
    body: undefined as undefined | null | string,
    files: undefined as undefined | null | typeof _FileRespObj[],
    status: undefined as undefined | null | status_t,

    post_datetime: undefined as undefined | null | string,
    expiry_datetime: undefined as undefined | null | string,
    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
    deleted_datetime: undefined as undefined | null | string,
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
export default class _Post extends _Wrapper_ implements Omit<typeof _PostRespObj, casts_t> {
    id: number | null = null
    title: string | null = null
    exerpt: string | null = null
    body: string | null = null
    files: _File[] = []
    status: status_t | null = null

    post_datetime: _DateTime | null = null
    expiry_datetime: _DateTime | null = null
    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null
    deleted_datetime: _DateTime | null = null

    protected collections_pagination_params_data = {} as { [collection_name in keyof typeof GettableCollectionAddonPropsRespObj]: typeof _dataless_resource_collection_wrapper }

    /* Class Constructor */
    constructor(args: typeof _PostRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _PostRespObj) {
        this._populate(args)

        this.files = []

        if (args.files && args.files.length) {
            args.files.forEach((element: typeof _FileRespObj) => {
                this.files.push(new _File(element))
            })
        }

        this.expiry_datetime = args.expiry_datetime && typeof args.expiry_datetime === 'string' ? new _DateTime(args.expiry_datetime) : null
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = args.updated_datetime && typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
        this.deleted_datetime = args.deleted_datetime && typeof args.deleted_datetime === 'string' ? new _DateTime(args.deleted_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _PostRespObj) {
        return this._mainLaravelDBAPICreate('posts', args)
    }

    /* Readers */

    public async read() {
        return this._mainLaravelDBAPIRead('posts/' + this.id)
    }

    public static async getOne(params: { id: number }) {
        return this._mainLaravelDBAPIGetOne('posts/' + params.id)
    }

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('posts', params, page_select, per_page)
    }

    public async getAddonProp(addon_prop_name: keyof typeof GettableAddonPropsRespObj, page_select?: laravel_api_page_selection_t, per_page?: number) {
        this.recreateGCAPPPD(GettableCollectionAddonPropsRespObj);
        const prop_types = {
            'logs': _Log,
        }
        if (Object.keys(prop_types).includes(addon_prop_name)) {
            return this._mainLaravelDBAPIGetAddonPropCollection(prop_types[addon_prop_name], { addon_prop_name, addon_prop_parent_table: '__posts', addon_prop_parent_pmkey: this.id as number }, page_select, per_page)
        } else {
            return Promise.reject({ message: 'Addon not recognized' })
        }
    }
}