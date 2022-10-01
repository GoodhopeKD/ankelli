import UserNotificationsListViewScreen from 'app/views/screens/UserNotificationsListView.screen'
import UserNotificationsSingleViewScreen from 'app/views/screens/UserNotificationsSingleView.screen'

export const top_navbar_user_menu = {
    slug: 'top_navbar_user_menu',
    menu_title: 'Top Navbar User Menu',
    subdomain: 'accounts',
    show_when_auth_state_is: true,
    show_in_menu: true,
    menu_items: [
        {
            title: 'Notifications',
            path: '/notifications',
            element: (props) => <UserNotificationsListViewScreen {...props} />,
        },
        {
            title: 'View notification',
            path: '/notifications/:notification_id',
            show_in_menu: false,
            element: (props) => <UserNotificationsSingleViewScreen {...props} />,
        },
        {
            title: 'My profile',
            path: '/profile',
        },
        {
            title: 'Banking',
            subdomain: 'banking',
            path: '/overview',
        },
        {
            title: 'Support center',
            path: '/home',
            subdomain: 'support',
            required_active_user_group_membership_slugs: ['administrators', 'moderators'],
            restricted_for_default_users: true,
        },
        {
            title: 'Admin Area',
            subdomain: 'admin',
            path: '/dashboard',
            required_active_user_group_membership_slugs: ['administrators'],
        },
        {
            has_divider_above: true,
            title: 'Sign out',
            path: '/#/accounts/auth/signout',
            subdomain: 'default',
        },
    ]
}
