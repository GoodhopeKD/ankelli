import React from 'react'
import SignInScreen from 'app/views/screens/virtual_menu/SignIn.screen'
import SignUpScreen from 'app/views/screens/virtual_menu/SignUp.screen'

export const virtual_menu = {
    slug: 'virtual_menu',
    menu_title: 'Virtual Menu',
    menu_items: [
        {
            title: 'Sign In',
            path: '/signin',
            element: (props) => <SignInScreen />,
            show_when_auth_state_is: false,
        },
        {
            title: 'Sign Up',
            path: '/signup',
            element: (props) => <SignUpScreen />,
            show_when_auth_state_is: false,
        },
        {
            title: 'Reset lost password',
            path: '/reset_lost_password',
            element: (props) => <div>Placeholder</div>,
            show_when_auth_state_is: false,
        },
        {
            title: 'Recover lost username',
            path: '/recover_lost_username',
            element: (props) => <div>Placeholder</div>,
            show_when_auth_state_is: false,
        },
        {
            title: 'Error 403: Not authorized',
            path: '/403',
            element: (props) => <div>You are not authorized to view this page.</div>,
        },
        {
            title: 'Error 404: Page not found',
            path: '/404',
            element: (props) => <div>Page not found.</div>,
        },
    ]
}