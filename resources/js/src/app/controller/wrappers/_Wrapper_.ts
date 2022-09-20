/* Auxilliary Imports */
import _Date from 'app/controller/wrappers/auxilliary/_Date'
/* Actions, Configs imports */
import { store } from 'app/controller/config/central_state.config'
import { app_backend_api } from 'app/controller/config/app_backend_api.config'
import { mainLaravelDBRestAPICallWrapper } from 'app/controller/actions/rest_api.actions'
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'
import { _resource_collection_wrapper, _dataless_resource_collection_wrapper } from 'app/controller/redux_reducers/_resource_collection_wrapper'

/*
    Type Definitions
*/
type get_collection_params = { [key: string]: unknown }

const Gettable_Wrapper_CollectionAddonPropsRespObj: { [key: string]: unknown } = {}

/*
    Exported Default Class
*/
export default class _Wrapper_ {

    public static collection = _resource_collection_wrapper
    protected gettable_collection_addon_props_page_selects_data = {} as any

    protected recreateGCAPPPD(args: typeof Gettable_Wrapper_CollectionAddonPropsRespObj) {
        if (!Object.keys(this.gettable_collection_addon_props_page_selects_data).length) {
            // Set stage for collection addons
            Object.keys(args).forEach((collection_name) => {
                if (Array.isArray(args[collection_name as keyof typeof args])) {
                    this.gettable_collection_addon_props_page_selects_data[collection_name as keyof typeof args] = _dataless_resource_collection_wrapper
                }
            })
        }
    }

    /* Placeholder function */
    protected populate(args: any) {
        throw new Error('Method not implemented.')
    }

    protected _populate(args: any) {
        // Dereference args object, Delete empty values and arrays, Load Inline
        args = JSON.parse(JSON.stringify(args))
        var key: keyof typeof args
        for (key in args) { if (args.hasOwnProperty(key)) { if (!(window as any).isset(args[key]) || (Array.isArray(args[key]) && !(args[key] as any).length)) delete args[key] } }
        Object.assign(this, args)
    }

    /* Creator(s) */
    protected static async _mainLaravelDBAPICreate(
        endpoint: string, // Filled by Child class
        data: any,
        get_data_to_preserve: any = null,
        data_has_files: boolean | undefined = undefined
    ) {
        return await mainLaravelDBRestAPICallWrapper
            .dispatch({
                type: data_has_files ? 'APP_BACKEND_API_CALL_WITH_FILES' : 'APP_BACKEND_API_CALL',
                method: 'POST',
                endpoint,
                get_data_to_preserve,
                data_has_files,
                data
            })
            .then((resp: any) => { return Promise.resolve(resp) })
            .catch((e: any) => { return Promise.reject(e) })
    }

    /* Readers */

    protected static instanceToRespObj = (obj: any): any => {
        if (null === obj || 'object' != typeof obj) return obj
        var copy
        if (obj instanceof _Date) {
            copy = obj.toString()
            return copy
        }
        if (obj instanceof Array && obj.length) {
            copy = []
            for (var i = 0, len = obj.length; i < len; i++) {
                copy[i] = _Wrapper_.instanceToRespObj(obj[i])
            }
            return copy
        }
        if (obj instanceof Object && Object.keys(obj).length) {
            copy = {}
            for (var attr in obj) {
                var copy_2 = _Wrapper_.instanceToRespObj(obj[attr])
                if (obj.hasOwnProperty(attr) && copy_2) (copy as any)[attr] = copy_2
            }
            return copy
        }
    }

    public toRespObj(): Object {
        return _Wrapper_.instanceToRespObj(this)
    }

    protected async _mainLaravelDBAPIRead(
        endpoint: string, // Filled by Child class
        data?: { id?: number, [key: string]: unknown }, // Filled by Child class
    ) {
        return await mainLaravelDBRestAPICallWrapper
            .dispatch({
                type: 'APP_BACKEND_API_CALL',
                method: 'GET',
                endpoint,
                data,
            })
            .then((resp: any) => { this.populate(resp); return Promise.resolve({ message: 'Read complete' }) })
            .catch((e: any) => { return Promise.reject(e) })
    }

    protected static async _mainLaravelDBAPIGetOne(
        endpoint: string, // Filled by Child class
        data?: { id?: number | string, [key: string]: unknown },
    ) {
        return await mainLaravelDBRestAPICallWrapper
            .dispatch({
                type: 'APP_BACKEND_API_CALL',
                method: 'GET',
                endpoint,
                data,
            })
    }

    protected static async _mainLaravelDBAPIGetOneWhere(
        endpoint: string, // Filled by Child class
        data: { [key: string]: unknown },
    ) {
        var concat_operator = endpoint.includes('?') ? '&' : '?'
        Object.keys(data).forEach((param: keyof typeof data) => {
            endpoint = endpoint + concat_operator + param + '=' + data[param]
            concat_operator = '&'
        });
        return await mainLaravelDBRestAPICallWrapper
            .dispatch({
                type: 'APP_BACKEND_API_CALL',
                method: 'GET',
                endpoint,
                data,
            })
            .then(resp => {
                if (resp.data.length) {
                    return Promise.resolve(resp.data[0]);
                } else {
                    return Promise.reject({ message: 'No result found' })
                }
            })
            .catch((e: any) => { return Promise.reject(e); })
    }

    protected static async _mainLaravelDBAPIGetCollection(
        endpoint: string, // Filled by Child class
        params: get_collection_params | null = null,
        page_select?: laravel_api_page_selection_t,
        per_page?: number
    ) {
        const data = {} as any

        var concat_operator = endpoint.includes('?') ? '&' : '?'
        if (params) {
            Object.keys(params).forEach((param: keyof typeof params) => {
                endpoint = endpoint + concat_operator + param + '=' + params[param]
                data[param] = params[param]
                concat_operator = '&'
            });
        }
        if (page_select) {
            const collection = this.collection
            if (typeof page_select === 'string') {
                const link = collection.links[page_select]
                if (!link) {
                    return Promise.reject({ message: 'Link not found' })
                }
                endpoint = link.split(app_backend_api.config.api_url + '/' + store.getState().active_session_data.token + '/')[1]
            } else if (typeof page_select === 'object' && (page_select as object).hasOwnProperty('page')) {
                if (page_select.page < 1 || (collection.meta.last_page > 0 && page_select.page > collection.meta.last_page)) {
                    return Promise.reject({ message: 'Page out of range' })
                }
                endpoint = endpoint + concat_operator + 'page=' + page_select.page
                concat_operator = '&'
            }
        }
        if (per_page && per_page > 1) {
            endpoint = endpoint + concat_operator + 'per_page=' + per_page
            concat_operator = '&'
        }
        return mainLaravelDBRestAPICallWrapper
            .dispatch({
                type: 'APP_BACKEND_API_CALL',
                method: 'GET',
                endpoint,
                data
            })
            .then((collection: any) => {
                this.collection = collection
                return Promise.resolve({ message: 'Get collection complete', collection });
            })
            .catch((e: any) => { return Promise.reject(e); })
    }

    protected async _mainLaravelDBAPIGetAddonPropCollection(
        _AddonType: any, // Filled by Child class
        data: { addon_prop_name: string, addon_prop_parent_table: string, addon_prop_parent_uid: string | number, [key: string]: unknown },
        page_select?: laravel_api_page_selection_t,
        per_page?: number,
    ) {
        await _AddonType.getCollection({ ...data, get_as_addon_prop: true }, page_select, per_page).catch((e: any) => { return Promise.reject(e) })
        const result = _AddonType.collection
        this.gettable_collection_addon_props_page_selects_data[data.addon_prop_name] = { meta: result.meta, links: result.links } as any
        (this as any)[data.addon_prop_name] = result.data
        return Promise.resolve({ message: 'Get addon prop complete' })
    }

    /* Updater */

    protected async _mainLaravelDBAPIUpdate(
        endpoint: string, // Filled by Child class 
        update_note: string,
        data: any,
        data_has_files: boolean | undefined = undefined
    ) {
        if (!Object.keys(data).length) return Promise.reject({ message: 'No values were changed' })

        return await mainLaravelDBRestAPICallWrapper
            .dispatch({
                type: 'APP_BACKEND_API_CALL',
                method: 'PUT',
                endpoint,
                data: { ...data, update_note },
                data_has_files,
            })
            .then((resp: any) => { this.populate(resp); return Promise.resolve({ message: 'Update complete' }) })
            .catch((e: any) => { return Promise.reject(e) })
    }

    /* Deleter */

    protected async _delete(
        endpoint: string, // Filled by Child class 
    ) {
        return await mainLaravelDBRestAPICallWrapper
            .dispatch({
                type: 'APP_BACKEND_API_CALL',
                method: 'DELETE',
                endpoint
            })
            .then((resp: any) => { this.populate(resp); return Promise.resolve({ message: 'Delete complete' }) })
            .catch((e: any) => { return Promise.reject(e) })
    }
}