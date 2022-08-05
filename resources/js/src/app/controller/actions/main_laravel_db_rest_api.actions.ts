import { batch } from 'react-redux'

export type laravel_api_page_selection_t = 'next' | 'prev' | 'first' | 'last' | { page: number }

export const connectivityBoot = () => {
    return (dispatch: (args: any) => Promise<any>) => {
        dispatch({ type: 'APP_INSTANCE_STATE_RESET_CONNECTIVITY' }).finally(() => {

            dispatch({ type: 'MAIN_LARAVEL_DB_REST_API_CALL', method: 'POST', endpoint: '' })
                .then(() => { dispatch({ type: 'APP_INSTANCE_STATE_SET_MAIN_LARAVEL_DB_REST_API_CONNECTIVITY', main_laravel_db_rest_api_connectivity: true }) })
                .catch((e: any) => {
                    dispatch({ type: 'APP_INSTANCE_STATE_SET_MAIN_LARAVEL_DB_REST_API_CONNECTIVITY', main_laravel_db_rest_api_connectivity: false })
                })

        })
    }
}

export const mainLaravelDBAPICallMiddleware = (store: any) => (next: any) => (action: any) => {

    if (action.type === 'MAIN_LARAVEL_DB_REST_API_CALL_MULTIPLE' && action.requests) {
        if (!action.is_boot) {
            let core_state_request_action = {
                method: 'POST',
                endpoint: ''
            }
            action.requests.push(core_state_request_action)
        }

        const tasks = action.requests.map((request: any) => {
            request.type = 'MAIN_LARAVEL_DB_REST_API_CALL'
            return store.dispatch(request)
        })

        return Promise.allSettled(tasks)
    }

    if (action.type === 'MAIN_LARAVEL_DB_REST_API_CALL' || action.type === 'MAIN_LARAVEL_DB_REST_API_CALL_WITH_FILES') {
        return store.dispatch((dispatch: any, getState: any, { main_laravel_db_rest_api }: any) => {

            if (!main_laravel_db_rest_api.config.accepted_methods.some((x: string) => x.toLowerCase() === action.method.toLowerCase())) {
                return Promise.reject({
                    failed: true,
                    message: 'Method "' + action.method + '" not accepted',
                    endpoint: action.endpoint
                })
            }

            let active_session_data = getState().active_session_data

            if (main_laravel_db_rest_api.config.endpoint_filtering.strictly_auth_clear_endpoints.some((x: string) => x.toLowerCase() === action.endpoint.toLowerCase()) && active_session_data.auth_token !== null) {
                return Promise.reject({
                    failed: true,
                    message: 'Action can\'t be performed with while logged in',
                    endpoint: action.endpoint
                })
            }

            // For protected endpoints, active_session should exist
            const endpoint_without_page_selects = action.endpoint.split('?')[0]
            if (!active_session_data.auth_token && !(
                main_laravel_db_rest_api.config.endpoint_filtering.auth_clear_endpoints.some((x: string) => x.toLowerCase() === endpoint_without_page_selects.toLowerCase()) ||
                (main_laravel_db_rest_api.config.endpoint_filtering.auth_clear_on_GET_endpoints.some((x: string) => x.toLowerCase() === endpoint_without_page_selects.toLowerCase()) && action.method === 'GET')
            )) {
                return Promise.reject({
                    failed: true,
                    message: 'Action can\'t be performed with while logged out',
                    endpoint: action.endpoint,
                })
            }

            // Use authorization if its there
            if (active_session_data.auth_token) {
                main_laravel_db_rest_api.handle.defaults.headers.common['Authorization'] = `Bearer ${active_session_data.auth_token}`
            } else {
                delete main_laravel_db_rest_api.handle.defaults.headers.common['Authorization']
            }

            // Rewrite endpoint containing parameter(s)
            var reParamFinder = /\{(.*?)\}/g
            var params = []
            var found
            while ((found = reParamFinder.exec(action.endpoint))) {
                params.push(found[1])
            }

            if (params.length) {
                params.forEach((element) => {
                    action.endpoint = action.endpoint.replace('{' + element + '}', action.data[element])
                    if (!(action.get_data_to_preserve && action.get_data_to_preserve.length && action.get_data_to_preserve.some((x: string) => x.toLowerCase() === element.toLowerCase())))
                        delete action.data[element]
                })
            }

            if (action.method === 'GET' && action.get_data_to_preserve && action.get_data_to_preserve.length) {
                var concat_operator = action.endpoint.includes('?') ? '&' : '?'
                action.get_data_to_preserve.forEach((get_param: string) => {
                    action.endpoint = action.endpoint + concat_operator + get_param + '=' + action.data[get_param]
                    concat_operator = '&'
                });
            }

            let active_session = {
                id: active_session_data.id, // We know what to update or whether to create a new one
                device_info: active_session_data.device_info,
                agent_app_info: active_session_data.agent_app_info,
                utc_offset: active_session_data.utc_offset
            }

            let request_object = {
                method: action.method,
                url: action.endpoint === '' ? action.endpoint : active_session_data.token + '/' + action.endpoint,
                data: action.data_has_files ? action.data : { ...action.data, active_session }
            } as any

            if (action.data_has_files) {
                request_object.headers = {
                    'content-Type': 'multipart/form-data'
                }
            }

            if (action.method === 'GET')
                delete request_object.data

            return main_laravel_db_rest_api.handle(request_object)
                .then((resp: any) => {
                    batch(() => {
                        if (
                            (action.endpoint === '' &&
                                active_session_data.auth_token &&
                                !(resp.data.active_session_data && resp.data.auth_user_data)) ||
                            (action.endpoint === 'users/signout' && !resp.data.auth_user_data)
                        ) {
                            dispatch({ type: 'AUTH_DATA_CLEAR_ALL' })
                        }

                        if (main_laravel_db_rest_api.config.endpoint_filtering.auth_token_returning_endpoints.some((x: string) => x.toLowerCase() === action.endpoint.toLowerCase()) && resp.data.auth_token) {
                            dispatch({ type: 'ACTIVE_CONNECT_INSTANCE_DATA_SET_AUTH_ACCESS_TOKEN', auth_token: resp.data.auth_token })
                        }

                        if (resp.data.auth_user_data)
                            dispatch({ type: 'AUTH_USER_DATA_UPDATE', auth_user_data: resp.data.auth_user_data })

                        if (resp.data.sysconfig_params_data)
                            dispatch({ type: 'SYSCONFIG_PARAMS_UPDATE', sysconfig_params_data: resp.data.sysconfig_params_data })

                        if (resp.data.active_session_data)
                            dispatch({ type: 'ACTIVE_CONNECT_INSTANCE_DATA_UPDATE', active_session_data: resp.data.active_session_data })

                    })
                    return Promise.resolve(resp.data)
                })
                .catch((e: any) => {
                    let error = {} as any
                    if (e.resp) {
                        // client received an error resp (5xx, 4xx)
                        error = {
                            status: e.resp.status ? e.resp.status : '',
                            message: e.resp.statusText ? e.resp.statusText : e.resp.data ? e.resp.data.message : '',
                            data: e.resp.data ? e.resp.data : {},
                            page: e.resp.config ? e.resp.config.url.replace(active_session_data.token + '/', '') : ''
                        }
                    } else if (e.response) {
                        // request was sent, but didn't get to server, or server returned an internal error
                        error = {
                            message: e.message,
                            request: {
                                status: e.request.status,
                                _url: e.request._url,
                                _response: typeof e.request._response === 'string' && e.request._response.length < 500 ? e.request._response : null,
                                _method: e.request._method,
                            },
                            response: e.response.data ? {
                                message: e.response.data.message,
                                file: e.response.data.file,
                                line: e.response.data.line,
                            } : null
                        }

                        if (error.message.includes('Request failed with status code') && error.response) {
                            error.message = error.response.message
                        }
                    } else {
                        error = {
                            message: e.message
                        }
                    }
                    console.log(error)
                    return Promise.reject(error)
                })
        })
    }

    return next(action)
}
