import axios from 'axios'

/* Database Access Config */

// Endpoints that return an auth_token
const auth_token_returning_endpoints = ['users/signup', 'users/signin']

// Endpoints that require no auth_token i.e they shouldn't be accessed with the auth_token
const strictly_auth_clear_endpoints = [
    ...auth_token_returning_endpoints,
    'verif_tokens/password_reset',
    'verif_tokens/password_reset/verify_token', // returns user's username
    'users/{username}/unauth_password_update'
]

// Endpoints that don't require an auth_token i.e they work with or without the auth_token
const auth_clear_endpoints = [
    ...strictly_auth_clear_endpoints,
    '',
    'availability_check/{check_param_name}/{check_param_value}', // checks username, email_address
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
