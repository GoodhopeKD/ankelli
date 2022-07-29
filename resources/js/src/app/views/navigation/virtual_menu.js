import React from 'react'
import SignInScreen from 'app/views/screens/virtual_menu/SignIn.screen'
import SignUpScreen from 'app/views/screens/virtual_menu/SignUp.screen'
import UserNotificationsListViewScreen from 'app/views/screens/virtual_menu/UserNotificationsListView.screen'

export const virtual_menu = {
    slug: 'virtual_menu',
    menu_title: 'Virtual Menu',
    menu_items: [
        {
            title: 'Sign In',
            path: '/signin',
            element: (props) => <SignInScreen />,
            auth_state_required: false,
        },
        {
            title: 'Sign Up',
            path: '/signup',
            element: (props) => <SignUpScreen />,
            auth_state_required: false,
        },
        {
            title: 'Recovery',
            path: '/recovery',
            element: (props) => <div>Placeholder</div>,
            auth_state_required: false,
        },
        {
            title: 'User Notifications',
            path: '/user_notifications',
            element: (props) => <UserNotificationsListViewScreen />,
            auth_state_required: true,
        },
    ]
}