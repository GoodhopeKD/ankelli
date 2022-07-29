export const top_navbar_user_menu = {
    slug: 'top_navbar_user_menu',
    menu_title: 'Top Navbar User Menu',
    auth_state_required: true,
    visible_in_menu: true,
    menu_items: [
        {
            title: 'Notifications',
            path: '/user_notifications',
            faicon_class: "fas fa-question-circle",
        },
        {
            title: 'Profile Management',
            path: '/user_profile/dashboard',
            faicon_class: "fas fa-question-circle",
        },
        {
            title: 'Account Settings',
            path: '/user_account/email_addresses',
            faicon_class: "fas fa-user-tie",
        },
        {
            title: 'Admin Dashboard',
            path: '/dashboard/daily_users',
            faicon_class: "fas fa-user-tie",
            has_divider_below: true,
        },
        {
            title: 'Sign out',
            path: '/#/logout',
            faicon_class: "fas fa-gavel",
        },
    ]
}
