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
    show_in_menu: true,
    show_when_auth_state_is: true,
    menu_items: [
        {
            title: 'Dashboard',
            path: '/admin_dashboard',
            required_permissions: ['handle_business_ops', 'manage_deposit_tokens', 'handle_withdrawals', 'handle_flagged_business_elems'],
            children: [
                {
                    title: 'Daily users',
                    path: '/admin_dashboard/daily_users',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    show_in_menu: true,
                },
                {
                    title: 'Asset Analytics',
                    path: '/admin_dashboard/asset_analytics',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    show_in_menu: true,
                },
                {
                    title: 'Business Analytics',
                    path: '/admin_dashboard/business_analytics',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    show_in_menu: true,
                },
            ]
        },
        {
            title: 'Business Management',
            path: '/business_management',
            required_permissions: ['handle_business_ops', 'manage_deposit_tokens', 'handle_withdrawals', 'handle_flagged_business_elems'],
            children: [
                // Deposits management
                {
                    title: 'Deposit Tokens',
                    path: '/business_management/deposit_tokens',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_deposit_tokens'],
                    show_in_menu: true,
                },
                {
                    title: 'New Deposit Token',
                    path: '/business_management/deposit_tokens/new',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_deposit_tokens'],
                    show_in_menu: false,
                },
                {
                    title: 'Edit Deposit Token',
                    path: '/business_management/deposit_tokens/:deposit_token_id/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_deposit_tokens'],
                    show_in_menu: false,
                },
                // Withdrawals management
                {
                    title: 'Withdrawal Requests',
                    path: '/business_management/withdrawal_requests',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['handle_business_ops'],
                    show_in_menu: true,
                },
                {
                    title: 'Handle Withdrawal Request',
                    path: '/business_management/withdrawal_requests/:withdrawal_request_id/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['handle_withdrawals'],
                    show_in_menu: false,
                },
                // Trade management
                {
                    title: 'Trades Administration',
                    path: '/business_management/trades',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['handle_flagged_business_elems'],
                    show_in_menu: true,
                },
                {
                    title: 'Handle Trade',
                    path: '/business_management/trades/:trade_id',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['handle_flagged_business_elems'],
                    show_in_menu: false,
                },
            ]
        },
        {
            title: 'User Management',
            path: '/user_management',
            required_permissions: ['manage_reg_tokens'],
            children: [
                {
                    title: 'Registration Tokens',
                    path: '/user_management/reg_tokens',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_reg_tokens'],
                    show_in_menu: true,
                },
                {
                    title: 'View Registration Token',
                    path: '/user_management/reg_tokens/:reg_token_id',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_reg_tokens'],
                    show_in_menu: false,
                },
                {
                    title: 'Edit Registration Token',
                    path: '/user_management/reg_tokens/:reg_token_id/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_reg_tokens'],
                    show_in_menu: false,
                },
                {
                    title: 'New Registration Token',
                    path: '/user_management/reg_tokens/new',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_reg_tokens'],
                    show_in_menu: false,
                },
                {
                    title: 'Users',
                    path: '/user_management/users',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_reg_tokens'],
                    show_in_menu: true,
                },
                {
                    title: 'View Profile',
                    path: '/user_management/users/:username/profile',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_reg_tokens'],
                    show_in_menu: false,
                },
                {
                    title: 'View User\'s Groups',
                    path: '/user_management/users/:username/user_group_memberships',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_reg_tokens'],
                    show_in_menu: false,
                },
                {
                    title: 'Edit User\'s Groups',
                    path: '/user_management/users/:username/user_group_memberships/:user_group_membership_id/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_reg_tokens'],
                    show_in_menu: false,
                },
                {
                    title: 'View User\'s Permissions',
                    path: '/user_management/users/:username/permission_instances',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_reg_tokens'],
                    show_in_menu: false,
                },
                {
                    title: 'Edit User\'s Permissions',
                    path: '/user_management/users/:username/permission_instances/:permission_instance_id/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_reg_tokens'],
                    show_in_menu: false,
                },
            ]
        },
        {
            title: 'System Configuration',
            path: '/sysconfig',
            required_permissions: ['update_sysconfig_params'],
            children: [
                {
                    title: 'Edit system configuration params',
                    path: '/sysconfig/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['update_sysconfig_params'],
                    show_in_menu: true,
                },
            ]
        },
        {
            title: 'System Tools',
            path: '/systools',
            required_permissions: ['manage_systools'],
            children: [
                // User Groups
                {
                    title: 'User Groups',
                    path: '/systools/user_groups',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_systools'],
                    show_in_menu: true,
                },
                {
                    title: 'View User Group',
                    path: '/systools/user_groups/:user_group_slug',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_systools'],
                    show_in_menu: false,
                },
                {
                    title: 'Edit User Group',
                    path: '/systools/user_groups/:user_group_slug/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_systools'],
                    show_in_menu: false,
                },
                {
                    title: 'New User Group',
                    path: '/systools/user_groups/new',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_systools'],
                    show_in_menu: false,
                },
                {
                    title: 'View User Group Members',
                    path: '/systools/user_groups/:user_group_slug/user_group_memberships',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_systools'],
                    show_in_menu: false,
                },
                {
                    title: 'Add User Group Member',
                    path: '/systools/user_groups/:user_group_slug/user_group_memberships/new',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_systools'],
                    show_in_menu: false,
                },
                // Permissions
                {
                    title: 'Permissions',
                    path: '/systools/permissions',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_systools'],
                    show_in_menu: true,
                },
                {
                    title: 'View Permission',
                    path: '/systools/permissions/:permission_slug',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_systools'],
                    show_in_menu: false,
                },
                {
                    title: 'Edit Permission',
                    path: '/systools/permissions/:permission_slug/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_systools'],
                    show_in_menu: false,
                },
                {
                    title: 'New Permission',
                    path: '/systools/permissions/new',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_systools'],
                    show_in_menu: false,
                },
                {
                    title: 'View Permission Users',
                    path: '/systools/permissions/:permission_slug/permission_instances',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_systools'],
                    show_in_menu: false,
                },
                {
                    title: 'Add Permission User',
                    path: '/systools/permissions/:permission_slug/permission_instances/new',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_systools'],
                    show_in_menu: false,
                },
                // Exportables
                {
                    title: 'Exportables',
                    path: '/systools/exportables',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_systools'],
                    show_in_menu: true,
                },
                {
                    title: 'View Exportable',
                    path: '/systools/exportables/:exportable_id',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_systools'],
                    show_in_menu: false,
                },
                {
                    title: 'Edit Exportable',
                    path: '/systools/exportables/:exportable_id/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_systools'],
                    show_in_menu: false,
                },
                {
                    title: 'New Exportable',
                    path: '/systools/exportables/new',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_systools'],
                    show_in_menu: false,
                },
            ]
        },
        {
            title: 'Helper modules',
            path: '/helper_modules',
            required_permissions: ['handle_feedback_reports', 'handle_customer_service_chats', 'view_all_logs'],
            children: [
                // Feedback Reports
                {
                    title: 'Feedback Reports',
                    path: '/helper_modules/feedback_reports',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['handle_feedback_reports'],
                    show_in_menu: true,
                },
                {
                    title: 'View Feedback Report',
                    path: '/helper_modules/feedback_reports/:feedback_report_id',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['handle_feedback_reports'],
                    show_in_menu: false,
                },
                {
                    title: 'Edit Feedback Report',
                    path: '/helper_modules/feedback_reports/:feedback_report_id/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['handle_feedback_reports'],
                    show_in_menu: false,
                },
                // Chats
                {
                    title: 'Chats',
                    path: '/helper_modules/chats',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['handle_customer_service_chats'],
                    show_in_menu: true,
                },
                {
                    title: 'Chat Messages',
                    path: '/helper_modules/chats/:chat_id/messages',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['handle_customer_service_chats'],
                    show_in_menu: false,
                },
                // Posts
                {
                    title: 'Edit Post',
                    path: '/helper_modules/posts/:post_id/edit',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_update_posts'],
                    show_in_menu: false,
                },
                {
                    title: 'New Post',
                    path: '/helper_modules/posts/new',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_update_posts'],
                    show_in_menu: false,
                },
                // Log Viewer
                {
                    title: 'Log Viewer',
                    path: '/helper_modules/log_viewer',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['view_all_logs'],
                    show_in_menu: true,
                },
            ]
        },
        {
            title: 'Datalists',
            path: '/datalists',
            required_permissions: ['manage_datalists'],
            children: [
                {
                    title: 'Assets Datalist',
                    path: '/datalists/assets',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_datalists'],
                    show_in_menu: true,
                },
                {
                    title: 'Currencies Datalist',
                    path: '/datalists/currencies',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_datalists'],
                    show_in_menu: true,
                },
                {
                    title: 'Payment Methods Datalist',
                    path: '/datalists/payment_methods',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_datalists'],
                    show_in_menu: true,
                },
                {
                    title: 'Cities Datalist',
                    path: '/datalists/cities',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_datalists'],
                    show_in_menu: true,
                },
                {
                    title: 'Provinces Datalist',
                    path: '/datalists/provinces',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />,
                    required_permissions: ['manage_datalists'],
                    show_in_menu: true,
                },
            ]
        },
    ]
}
