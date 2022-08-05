import UserNotificationsListViewScreen from 'app/views/screens/UserNotificationsListView.screen'

export const top_navbar_user_menu = {
    slug: 'top_navbar_user_menu',
    menu_title: 'Top Navbar User Menu',
    show_when_auth_state_is: true,
    show_in_menu: true,
    menu_items: [
        {
            title: 'Notifications',
            path: '/user_notifications',
            element: (props) => <UserNotificationsListViewScreen />,
        },
        {
            title: 'My Account',
            path: '/account_operations/dashboard',
        },
        {
            title: 'Settings',
            path: '/account_settings/email_addresses',
        },
        {
            title: 'Admin Area',
            path: '/admin_dashboard/daily_users',
            has_divider_below: true,
        },
        {
            title: 'Sign out',
            path: '/#/logout',
        },
    ]
}
