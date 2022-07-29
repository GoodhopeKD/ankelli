import React from "react"

import SideBar from 'app/views/components/SideBar'

class ExampleElement extends React.Component {
    render() {
        return <div className="container-fluid py-3">
            <div className="row">
                <div className="col-2">
                    <SideBar nav_menus={this.props.nav_menus} />
                </div>
                <div className="col-10">
                    {this.props.title} Screen
                </div>
            </div>
        </div>
    }
}

export const admin_menu = {
    slug: 'admin_menu',
    menu_title: 'Admin Menu',
    visible_in_menu: true,
    auth_state_required: true,
    menu_items: [
        {
            title: 'Dashboard',
            path: '/dashboard',
            faicon_class: "fas fa-th",
            required_permissions: ['handle_business_operations', 'manage_deposit_tokens', 'handle_withdrawals', 'handle_flagged_business_elements'],
            children: [
                {
                    title: 'Daily users',
                    path: '/dashboard/daily_users',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-file",
                    visible_in_menu: true,
                },
                {
                    title: 'Asset Analytics',
                    path: '/dashboard/asset_analytics',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-file",
                    visible_in_menu: true,
                },
                {
                    title: 'Business Analytics',
                    path: '/dashboard/business_analytics',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-file",
                    visible_in_menu: true,
                },
            ]
        },
        {
            title: 'Business Management',
            path: '/business_management',
            faicon_class: "fas fa-th",
            required_permissions: ['handle_business_operations', 'manage_deposit_tokens', 'handle_withdrawals', 'handle_flagged_business_elements'],
            children: [
                // Deposits management
                {
                    title: 'Deposit Tokens',
                    path: '/business_management/deposit_tokens',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-file",
                    required_permissions: ['manage_deposit_tokens'],
                    visible_in_menu: true,
                },
                {
                    title: 'New Deposit Token',
                    path: '/business_management/deposit_tokens/new',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-file",
                    required_permissions: ['manage_deposit_tokens'],
                    visible_in_menu: false,
                },
                {
                    title: 'Edit Deposit Token',
                    path: '/business_management/deposit_tokens/:deposit_token_id/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-file",
                    required_permissions: ['manage_deposit_tokens'],
                    visible_in_menu: false,
                },
                // Withdrawals management
                {
                    title: 'Withdrawal Requests',
                    path: '/business_management/withdrawal_requests',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-certificate",
                    required_permissions: ['handle_business_operations'],
                    visible_in_menu: true,
                },
                {
                    title: 'Handle Withdrawal Request',
                    path: '/business_management/withdrawal_requests/:withdrawal_request_id/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-certificate",
                    required_permissions: ['handle_withdrawals'],
                    visible_in_menu: false,
                },
                // Trade management
                {
                    title: 'Trades Administration',
                    path: '/business_management/trades',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-comments",
                    required_permissions: ['handle_flagged_business_elements'],
                    visible_in_menu: true,
                },
                {
                    title: 'Handle Trade',
                    path: '/business_management/trades/:trade_id',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-comment",
                    required_permissions: ['handle_flagged_business_elements'],
                    visible_in_menu: false,
                },
            ]
        },
        {
            title: 'User Management',
            path: '/user_management',
            faicon_class: "fas fa-users-cog",
            required_permissions: ['manage_registration_tokens'],
            children: [
                {
                    title: 'Registration Tokens',
                    path: '/user_management/registration_tokens',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-home",
                    required_permissions: ['manage_registration_tokens'],
                    visible_in_menu: true,
                },
                {
                    title: 'View Registration Token',
                    path: '/user_management/registration_tokens/:registration_token_id',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-passport",
                    required_permissions: ['manage_registration_tokens'],
                    visible_in_menu: false,
                },
                {
                    title: 'Edit Registration Token',
                    path: '/user_management/registration_tokens/:registration_token_id/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-passport",
                    required_permissions: ['manage_registration_tokens'],
                    visible_in_menu: false,
                },
                {
                    title: 'New Registration Token',
                    path: '/user_management/registration_tokens/new',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-passport",
                    required_permissions: ['manage_registration_tokens'],
                    visible_in_menu: false,
                },
                {
                    title: 'Users',
                    path: '/user_management/users',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-users",
                    required_permissions: ['manage_registration_tokens'],
                    visible_in_menu: true,
                },
                {
                    title: 'View Profile',
                    path: '/user_management/users/:username/profile',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-user",
                    required_permissions: ['manage_registration_tokens'],
                    visible_in_menu: false,
                },
                {
                    title: 'View User\'s Groups',
                    path: '/user_management/users/:username/user_group_memberships',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-user-friends",
                    required_permissions: ['manage_registration_tokens'],
                    visible_in_menu: false,
                },
                {
                    title: 'Edit User\'s Groups',
                    path: '/user_management/users/:username/user_group_memberships/:user_group_membership_id/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-user-friends",
                    required_permissions: ['manage_registration_tokens'],
                    visible_in_menu: false,
                },
                {
                    title: 'View User\'s Permissions',
                    path: '/user_management/users/:username/permission_instances',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-user-lock",
                    required_permissions: ['manage_registration_tokens'],
                    visible_in_menu: false,
                },
                {
                    title: 'Edit User\'s Permissions',
                    path: '/user_management/users/:username/permission_instances/:permission_instance_id/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-user-lock",
                    required_permissions: ['manage_registration_tokens'],
                    visible_in_menu: false,
                },
            ]
        },
        {
            title: 'System Configuration',
            path: '/system_configuration',
            faicon_class: "fas fa-user",
            required_permissions: ['update_system_configuration_settings'],
            children: [
                {
                    title: 'Edit system configuration',
                    path: '/system_configuration/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-user-edit",
                    required_permissions: ['update_system_configuration_settings'],
                    visible_in_menu: true,
                },
            ]
        },
        {
            title: 'System Tools',
            path: '/system_tools',
            faicon_class: "fas fa-tools",
            required_permissions: ['manage_system_tools'],
            children: [
                // User Groups
                {
                    title: 'User Groups',
                    path: '/system_tools/user_groups',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-users",
                    required_permissions: ['manage_system_tools'],
                    visible_in_menu: true,
                },
                {
                    title: 'View User Group',
                    path: '/system_tools/user_groups/:user_group_slug',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-users",
                    required_permissions: ['manage_system_tools'],
                    visible_in_menu: false,
                },
                {
                    title: 'Edit User Group',
                    path: '/system_tools/user_groups/:user_group_slug/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-users-cog",
                    required_permissions: ['manage_system_tools'],
                    visible_in_menu: false,
                },
                {
                    title: 'New User Group',
                    path: '/system_tools/user_groups/new',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-users",
                    required_permissions: ['manage_system_tools'],
                    visible_in_menu: false,
                },
                {
                    title: 'View User Group Members',
                    path: '/system_tools/user_groups/:user_group_slug/user_group_memberships',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-users",
                    required_permissions: ['manage_system_tools'],
                    visible_in_menu: false,
                },
                {
                    title: 'Add User Group Member',
                    path: '/system_tools/user_groups/:user_group_slug/user_group_memberships/new',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-user-plus",
                    required_permissions: ['manage_system_tools'],
                    visible_in_menu: false,
                },
                // Permissions
                {
                    title: 'Permissions',
                    path: '/system_tools/permissions',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-lock",
                    required_permissions: ['manage_system_tools'],
                    visible_in_menu: true,
                },
                {
                    title: 'View Permission',
                    path: '/system_tools/permissions/:permission_slug',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-lock",
                    required_permissions: ['manage_system_tools'],
                    visible_in_menu: false,
                },
                {
                    title: 'Edit Permission',
                    path: '/system_tools/permissions/:permission_slug/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-lock",
                    required_permissions: ['manage_system_tools'],
                    visible_in_menu: false,
                },
                {
                    title: 'New Permission',
                    path: '/system_tools/permissions/new',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-lock",
                    required_permissions: ['manage_system_tools'],
                    visible_in_menu: false,
                },
                {
                    title: 'View Permission Users',
                    path: '/system_tools/permissions/:permission_slug/permission_instances',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-user-lock",
                    required_permissions: ['manage_system_tools'],
                    visible_in_menu: false,
                },
                {
                    title: 'Add Permission User',
                    path: '/system_tools/permissions/:permission_slug/permission_instances/new',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-user-plus",
                    required_permissions: ['manage_system_tools'],
                    visible_in_menu: false,
                },
                // Exportables
                {
                    title: 'Exportables',
                    path: '/system_tools/exportables',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-file-export",
                    required_permissions: ['manage_system_tools'],
                    visible_in_menu: true,
                },
                {
                    title: 'View Exportable',
                    path: '/system_tools/exportables/:exportable_id',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-file-export",
                    required_permissions: ['manage_system_tools'],
                    visible_in_menu: false,
                },
                {
                    title: 'Edit Exportable',
                    path: '/system_tools/exportables/:exportable_id/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-file-export",
                    required_permissions: ['manage_system_tools'],
                    visible_in_menu: false,
                },
                {
                    title: 'New Exportable',
                    path: '/system_tools/exportables/new',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-file-export",
                    required_permissions: ['manage_system_tools'],
                    visible_in_menu: false,
                },
            ]
        },
        {
            title: 'Helper modules',
            path: '/helper_modules',
            faicon_class: "fas fa-th",
            required_permissions: ['handle_feedback_reports', 'handle_customer_service_chats', 'view_all_logs'],
            children: [
                // Feedback Reports
                {
                    title: 'Feedback Reports',
                    path: '/helper_modules/feedback_reports',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-envelope-open-text",
                    required_permissions: ['handle_feedback_reports'],
                    visible_in_menu: true,
                },
                {
                    title: 'View Feedback Report',
                    path: '/helper_modules/feedback_reports/:feedback_report_id',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-envelope-open-text",
                    required_permissions: ['handle_feedback_reports'],
                    visible_in_menu: false,
                },
                {
                    title: 'Edit Feedback Report',
                    path: '/helper_modules/feedback_reports/:feedback_report_id/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-envelope-open-text",
                    required_permissions: ['handle_feedback_reports'],
                    visible_in_menu: false,
                },
                // Chats
                {
                    title: 'Chats',
                    path: '/helper_modules/chats',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-comments",
                    required_permissions: ['handle_customer_service_chats'],
                    visible_in_menu: true,
                },
                {
                    title: 'Chat Messages',
                    path: '/helper_modules/chats/:chat_id/messages',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-comment",
                    required_permissions: ['handle_customer_service_chats'],
                    visible_in_menu: false,
                },
                // Posts
                {
                    title: 'Edit Post',
                    path: '/helper_modules/posts/:post_id/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-file-alt",
                    required_permissions: ['manage_update_posts'],
                    visible_in_menu: false,
                },
                {
                    title: 'New Post',
                    path: '/helper_modules/posts/new',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-plus-square",
                    required_permissions: ['manage_update_posts'],
                    visible_in_menu: false,
                },
                // Log Viewer
                {
                    title: 'Log Viewer',
                    path: '/helper_modules/log_viewer',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-person-booth",
                    required_permissions: ['view_all_logs'],
                    visible_in_menu: true,
                },
            ]
        },
        {
            title: 'Datalists',
            path: '/datalists',
            faicon_class: "fas fa-list-alt",
            required_permissions: ['manage_datalists'],
            children: [
                {
                    title: 'Assets Datalist',
                    path: '/datalists/assets',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-school",
                    required_permissions: ['manage_datalists'],
                    visible_in_menu: true,
                },
                {
                    title: 'Currencies Datalist',
                    path: '/datalists/currencies',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-school",
                    required_permissions: ['manage_datalists'],
                    visible_in_menu: true,
                },
                {
                    title: 'Payment Methods Datalist',
                    path: '/datalists/payment_methods',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-graduation-cap",
                    required_permissions: ['manage_datalists'],
                    visible_in_menu: true,
                },
                {
                    title: 'Cities Datalist',
                    path: '/datalists/cities',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-city",
                    required_permissions: ['manage_datalists'],
                    visible_in_menu: true,
                },
                {
                    title: 'Provinces Datalist',
                    path: '/datalists/provinces',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    faicon_class: "fas fa-city",
                    required_permissions: ['manage_datalists'],
                    visible_in_menu: true,
                },
            ]
        },
    ]
}
