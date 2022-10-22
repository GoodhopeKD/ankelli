import axios from 'axios'

/* Database Access Config */

// Endpoints that return an auth_token
const auth_token_returning_endpoints = ['accounts/auth/signup', 'accounts/auth/signin']

// Endpoints that require no auth_token i.e they shouldn't be accessed with the auth_token
const strictly_auth_clear_endpoints = [
    ...auth_token_returning_endpoints,
    'accounts/recovery/password/generate_reset_token/for_user/{username}/send_to/{receiving_addon_name}/{receiving_addon_value}',
    'accounts/recovery/password/reset',
    'accounts/recovery/username/get/send_to/{receiving_addon_name}/{receiving_addon_value}'
]

// Endpoints that don't require an auth_token i.e they work with or without the auth_token
const auth_clear_endpoints = [
    ...strictly_auth_clear_endpoints,
    'accounts',
    'content/param_checks/availability/{param_name}/{param_value}', // param_checks username, email_address, reg_token
    'content/param_checks/usability/{param_name}/{param_value}', // param_checks reg_token
]

// Endpoints that require auth_token on all other methods except the GET method
const auth_clear_on_GET_endpoints = [
    // Offers
    'p2p/offers',
    'p2p/offers/{ref_code}',
    // Datalists
    'content/datalists/assets',
    'content/datalists/currencies',
    'content/datalists/countries',
    'content/datalists/pymt_methods',
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
    API_URL: document.getElementById('app-api-url')?.getAttribute('content') as string,
}

export const app_backend_api = {
    config,
    handle: axios.create({
        baseURL: config.API_URL
    })
}
