import UserNotificationsViewListScreen from 'app/views/screens/accounts_menu/UserNotificationsViewList.screen'
import UserNotificationsViewSingleScreen from 'app/views/screens/accounts_menu/UserNotificationsViewSingle.screen'

export const _top_navbar_user_menu = {
    slug: '_top_navbar_user_menu',
    menu_title: 'Top Navbar User Menu',
    subdomain: 'accounts',
    show_when_auth_state_is: true,
    show_in_menu: true,
    menu_items: [
        {
            title: 'Notifications',
            path: '/notifications',
            element: (props) => <UserNotificationsViewListScreen {...props} />,
        },
        {
            title: 'View notification',
            path: '/notifications/:notification_id',
            show_in_menu: false,
            element: (props) => <UserNotificationsViewSingleScreen {...props} />,
        },
        {
            title: 'My profile',
            path: '/profile',
        },
        {
            title: 'Funds',
            subdomain: 'funds',
            path: '/dashboard',
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
