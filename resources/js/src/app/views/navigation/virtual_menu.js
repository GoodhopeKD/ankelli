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
            title: 'Recovery',
            path: '/recovery',
            element: (props) => <div>Placeholder</div>,
            show_when_auth_state_is: false,
        },
    ]
}