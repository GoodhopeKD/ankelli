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
            element: (props) => <UserNotificationsListViewScreen {...props} />,
        },
        {
            title: 'My Account',
            path: '/account/dashboard',
        },
        {
            title: 'Settings',
            path: '/account_settings/email_addresses',
        },
        {
            title: 'Admin Area',
            path: '/admin_dashboard/daily_users',
            required_active_user_group_membership_slugs: ['system_administrators', 'business_administrators', 'user_administrators', 'platform_moderators'],
        },
        {
            has_divider_above: true,
            title: 'Sign out',
            path: '/#/logout',
        },
    ]
}
