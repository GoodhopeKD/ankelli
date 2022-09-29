import axios from 'axios'

/* Database Access Config */

// Endpoints that return an auth_token
const auth_token_returning_endpoints = ['users/signup', 'users/signin']

// Endpoints that require no auth_token i.e they shouldn't be accessed with the auth_token
const strictly_auth_clear_endpoints = [
    ...auth_token_returning_endpoints,
    'users/recovery/password/generate_reset_token/for_user/{username}/send_to/{recipient_addon_name}/{recipient_addon_value}',
    'users/recovery/password/reset',
    'users/recovery/username/get/send_to/{recipient_addon_name}/{recipient_addon_value}'
]

// Endpoints that don't require an auth_token i.e they work with or without the auth_token
const auth_clear_endpoints = [
    ...strictly_auth_clear_endpoints,
    '',
    'param_checks/availability/{param_name}/{param_value}', // param_checks username, email_address, reg_token
    'param_checks/usability/{param_name}/{param_value}', // param_checks reg_token
]

// Endpoints that require auth_token on all other methods except the GET method
const auth_clear_on_GET_endpoints = [
    // Offers
    'offers',
    'offers/{ref_code}',
    // Datalists
    'datalists/assets',
    'datalists/currencies',
    'datalists/cities',
]

const config = {
    accepted_methods: ['GET', 'POST', 'PUT', 'DELETE'],
    endpoint_filtering: {
        // All other endpoints require the auth_token except on all METHODS except
        auth_token_returning_endpoints,
        auth_clear_endpoints,
        strictly_auth_clear_endpoints,
        auth_clear_on_GET_endpoints
    },
    web_url : process.env.MIX_WEB_URL as string,
    api_url : process.env.MIX_API_URL as string,
}

export const app_backend_api = {
    config,
    handle: axios.create({
        baseURL: config.api_url
    })
}
