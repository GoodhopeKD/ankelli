import { batch } from 'react-redux'

export type laravel_api_page_selection_t = 'next' | 'prev' | 'first' | 'last' | { page: number }

export const connectivityBoot = () => {
    return (dispatch: (args: any) => Promise<any>) => {
        dispatch({ type: 'APP_INSTANCE_STATE_RESET_CONNECTIVITY_INDICATORS' })
        return dispatch({ type: 'APP_BACKEND_API_CALL', method: 'POST', endpoint: 'accounts' })
            .then(() => { dispatch({ type: 'APP_INSTANCE_STATE_SET_APP_BACKEND_API_CONNECTIVITY_INDICATOR', app_backend_api_connectivity_indicator: true }); return Promise.resolve() })
            .catch((e: any) => {
                dispatch({ type: 'APP_INSTANCE_STATE_SET_APP_BACKEND_API_CONNECTIVITY_INDICATOR', app_backend_api_connectivity_indicator: false })
                return Promise.reject(e)
            })
    }
}

export const mainLaravelDBAPICallMiddleware = (store: any) => (next: any) => (action: any) => {

    if (action.type === 'APP_BACKEND_API_CALL_MULTIPLE' && action.requests) {
        if (!action.is_boot) {
            let core_state_request_action = {
                method: 'POST',
                endpoint: 'accounts'
            }
            action.requests.push(core_state_request_action)
        }

        const tasks = action.requests.map((request: any) => {
            request.type = 'APP_BACKEND_API_CALL'
            return store.dispatch(request)
        })

        return Promise.allSettled(tasks)
    }

    if (action.type === 'APP_BACKEND_API_CALL' || action.type === 'APP_BACKEND_API_CALL_WITH_FILES') {
        return store.dispatch((dispatch: (args: any) => Promise<any>, getState: any, { app_backend_api }: any) => {

            if (!app_backend_api.config.accepted_methods.some((x: string) => x.toLowerCase() === action.method.toLowerCase())) {
                return Promise.reject({
                    failed: true,
                    message: 'Method "' + action.method + '" not accepted',
                    endpoint: action.endpoint
                })
            }

            const active_session_data = getState().active_session_data

            if (app_backend_api.config.endpoint_filtering.strictly_auth_clear_endpoints.some((x: string) => x.toLowerCase() === action.endpoint.toLowerCase()) && (window as any).isset(active_session_data.auth_token)) {
                return Promise.reject({
                    failed: true,
                    message: 'Action can\'t be performed with while logged in',
                    endpoint: action.endpoint
                })
            }

            // For protected endpoints, active_session should exist
            const endpoint_without_GET_variables = action.endpoint.split('?')[0]
            if (!active_session_data.auth_token && !(
                app_backend_api.config.endpoint_filtering.auth_clear_endpoints.some((x: string) => x.toLowerCase() === endpoint_without_GET_variables.toLowerCase()) ||
                (app_backend_api.config.endpoint_filtering.auth_clear_on_GET_endpoints.some((x: string) => x.toLowerCase() === endpoint_without_GET_variables.toLowerCase()) && action.method === 'GET')
            )) {
                return Promise.reject({
                    failed: true,
                    message: 'Action can\'t be performed with while logged out',
                    endpoint: action.endpoint,
                })
            }

            // Use authorization if its there
            if (active_session_data.auth_token) {
                app_backend_api.handle.defaults.headers.common['Authorization'] = `Bearer ${active_session_data.auth_token}`
            } else {
                delete app_backend_api.handle.defaults.headers.common['Authorization']
            }

            // Rewrite endpoint containing parameter(s)
            const reParamFinder = /\{(.*?)\}/g
            const params = []
            var found
            while ((found = reParamFinder.exec(action.endpoint))) { params.push(found[1]) }

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

            const sent_active_session_data = {
                token: active_session_data.token, // We know what to update or whether to create a new one
                device_info: active_session_data.device_info,
                agent_app_info: active_session_data.agent_app_info,
                utc_offset: active_session_data.utc_offset
            }

            // Use session_token if its there
            if (active_session_data.token) {
                app_backend_api.handle.defaults.headers.common['x-session-token'] = active_session_data.token
            } else {
                delete app_backend_api.handle.defaults.headers.common['x-session-token']
            }

            const request_object = {
                method: action.method,
                url: action.endpoint,
                data: action.data_has_files ? action.data : { ...action.data, active_session_data: sent_active_session_data }
            } as any

            if (action.data_has_files) request_object.headers = { 'content-Type': 'multipart/form-data' }

            if (action.method === 'GET') delete request_object.data

            return app_backend_api.handle(request_object)
                .then((resp: any) => {
                    batch(() => {
                        if ((action.endpoint === 'accounts' && active_session_data.auth_token && !resp.data.auth_user_data) || (action.endpoint === 'accounts/auth/signout' && !resp.data.auth_user_data))
                            dispatch({ type: 'AUTH_DATA_CLEAR_ALL' })

                        if (app_backend_api.config.endpoint_filtering.auth_token_returning_endpoints.some((x: string) => x.toLowerCase() === action.endpoint.toLowerCase()) && resp.data.auth_token) {
                            dispatch({ type: 'ACTIVE_SESSION_DATA_SET_AUTH_TOKEN', auth_token: resp.data.auth_token })
                            delete resp.data.auth_token
                        }

                        if (resp.data.auth_user_data) {
                            dispatch({ type: 'AUTH_USER_DATA_UPDATE', auth_user_data: resp.data.auth_user_data })
                            delete resp.data.auth_user_data
                        }

                        if (resp.data.sysconfig_params_data) {
                            dispatch({ type: 'SYSCONFIG_PARAMS_DATA_UPDATE', sysconfig_params_data: resp.data.sysconfig_params_data })
                            delete resp.data.sysconfig_params_data
                        }

                        if (resp.data.active_session_data) {
                            dispatch({ type: 'ACTIVE_SESSION_DATA_UPDATE', active_session_data: resp.data.active_session_data })
                            delete resp.data.active_session_data
                        }
                    })
                    return Promise.resolve(resp.data)
                })
                .catch(async (e: any) => {
                    var error = {} as any
                    if (e.resp) {
                        // client received an error resp (5xx, 4xx)
                        error = {
                            _status: e.resp._status ?? '',
                            message: e.resp.statusText ?? (e.resp.data ? e.resp.data.message : ''),
                            data: e.resp.data ? e.resp.data : {},
                            page: e.resp.config ? e.resp.config.url.replace(active_session_data.token + '/', '') : ''
                        }
                    } else if (e.response) {
                        // request was sent, but didn't get to server, or server returned an internal error
                        error = {
                            message: e.message,
                            request: {
                                _status: e.request.status,
                                _url: e.request.url ?? e.request.responseURL,
                                _response: (window as any).isJson(e.request.response) ? JSON.parse(e.request.response) : (typeof e.request.response === 'string' && e.request.response.length < 500 ? e.request.response : undefined),
                                _method: e.request.method,
                            },
                            response: e.response.data ? {
                                message: e.response.data.message,
                                file: e.response.data.file,
                                line: e.response.data.line,
                            } : undefined,
                        }
                        if (error.message.includes('Request failed with status code') && error.response) {
                            error.message = error.response.message
                        }
                    } else {
                        error = {
                            message: e.message
                        }
                    }
                    if (error.response && error.response.message == 'Invalid session token provided') {
                        await dispatch({ type: 'APP_BACKEND_API_CALL', method: 'POST', endpoint: 'accounts' })
                        return dispatch(action)
                    }
                    console.log(error)
                    return Promise.reject(error)
                })
        })
    }

    return next(action)
}
