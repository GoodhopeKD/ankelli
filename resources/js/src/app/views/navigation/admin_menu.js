import React from "react"
import DepositTokensListViewScreen from 'app/views/screens/admin_menu/business_management/DepositTokensListView.screen'
import DepositTokensCreateNewScreen from 'app/views/screens/admin_menu/business_management/DepositTokensCreateNew.screen'
import RegTokensListViewScreen from 'app/views/screens/admin_menu/user_management/RegTokensListView.screen'
import DatalistListViewScreen from "app/views/screens/admin_menu/datalists/DatalistListView.screen"
import SysToolsListViewScreen from "app/views/screens/admin_menu/systools/SysToolsListView.screen"

import SideBar from 'app/views/components/SideBar'

class ExampleElement extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-fluid py-3">
                <div className="row">
                    <div className="col-2">
                        <SideBar nav_menus={[this.props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />
                    </div>
                    <div className="col-10">
                        {this.props.title} Screen
                    </div>
                </div>
            </div>
        </this.props.PageWrapper>
    }
}

export const admin_menu = {
    slug: 'admin_menu',
    menu_title: 'Admin Menu',
    show_in_menu: true,
    show_when_auth_state_is: true,
    required_active_user_group_membership_slugs: ['administrators', 'platform_moderators'],
    menu_items: [
        {
            title: 'Dashboard',
            path: '/admin_dashboard',
            children: [
                {
                    title: 'Admin Dashboard Home',
                    path: '/admin_dashboard/home',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: true,
                },
                {
                    title: 'Daily users',
                    path: '/admin_dashboard/daily_users',
                    required_active_user_group_membership_slugs: ['user_administrators'],
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: true,
                },
                {
                    title: 'Asset Analytics',
                    path: '/admin_dashboard/asset_analytics',
                    required_active_user_group_membership_slugs: ['business_administrators', 'system_administrators'],
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: true,
                },
                {
                    title: 'Business Analytics',
                    path: '/admin_dashboard/business_analytics',
                    required_active_user_group_membership_slugs: ['business_administrators'],
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: true,
                },
            ]
        },
        {
            title: 'Business Management',
            path: '/business_management',
            required_active_user_group_membership_slugs: ['business_administrators', 'platform_moderators'],
            children: [
                // Deposits management
                {
                    title: 'Deposit Tokens',
                    path: '/business_management/deposit_tokens',
                    element: (props) => <DepositTokensListViewScreen {...props} />,
                    required_active_user_group_membership_slugs: ['business_administrators'],
                    show_in_menu: true,
                },
                {
                    title: 'New Deposit Token',
                    path: '/business_management/deposit_tokens/new',
                    element: (props) => <DepositTokensCreateNewScreen {...props} />,
                    required_active_user_group_membership_slugs: ['business_administrators'],
                    restricted_for_default_users: true,
                    show_in_menu: false,
                },
                {
                    title: 'Edit Deposit Token',
                    path: '/business_management/deposit_tokens/:deposit_token_id/edit',
                    element: (props) => <ExampleElement {...props} />,
                    restricted_for_default_users: true,
                    show_in_menu: false,
                },
                // Withdrawals management
                {
                    title: 'Withdrawal Requests',
                    path: '/business_management/withdrawal_requests',
                    element: (props) => <ExampleElement {...props} />,
                    required_active_user_group_membership_slugs: ['business_administrators'],
                    show_in_menu: true,
                },
                {
                    title: 'Handle Withdrawal Request',
                    path: '/business_management/withdrawal_requests/:withdrawal_request_id/edit',
                    element: (props) => <ExampleElement {...props} />,
                    required_active_user_group_membership_slugs: ['business_administrators'],
                    restricted_for_default_users: true,
                    show_in_menu: false,
                },
                // Trade management
                {
                    title: 'Trades Administration',
                    path: '/business_management/trades',
                    element: (props) => <ExampleElement {...props} />,
                    required_active_user_group_membership_slugs: ['business_administrators', 'platform_moderators'],
                    show_in_menu: true,
                },
                {
                    title: 'Handle Trade',
                    path: '/business_management/trades/:ref_code',
                    element: (props) => <ExampleElement {...props} />,
                    required_active_user_group_membership_slugs: ['business_administrators', 'platform_moderators'],
                    restricted_for_default_users: true,
                    show_in_menu: false,
                },
            ]
        },
        {
            title: 'User Management',
            path: '/user_management',
            required_active_user_group_membership_slugs: ['user_administrators'],
            children: [
                {
                    title: 'Registration Tokens',
                    path: '/user_management/reg_tokens',
                    element: (props) => <RegTokensListViewScreen {...props} />,
                    show_in_menu: true,
                },
                {
                    title: 'Users',
                    path: '/user_management/users',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: true,
                },
                {
                    title: 'View Profile',
                    path: '/user_management/users/:username/profile',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'View User\'s Groups',
                    path: '/user_management/users/:username/user_group_memberships',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'Edit User\'s Groups',
                    path: '/user_management/users/:username/user_group_memberships/:user_group_membership_id/edit',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'View User\'s Permissions',
                    path: '/user_management/users/:username/permission_instances',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'Edit User\'s Permissions',
                    path: '/user_management/users/:username/permission_instances/:permission_instance_id/edit',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
            ]
        },
        {
            title: 'System Configuration',
            path: '/sysconfig',
            required_active_user_group_membership_slugs: ['system_administrators'],
            children: [
                {
                    title: 'Edit system configuration params',
                    path: '/sysconfig/edit',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: true,
                },
            ]
        },
        {
            title: 'System Tools',
            path: '/systools',
            required_active_user_group_membership_slugs: ['system_administrators'],
            children: [
                // User Groups
                {
                    title: 'User Groups',
                    path: '/systools/user_groups',
                    element: (props) => <SysToolsListViewScreen {...props} />,
                    show_in_menu: true,
                },
                {
                    title: 'View User Group',
                    path: '/systools/user_groups/:user_group_slug',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'Edit User Group',
                    path: '/systools/user_groups/:user_group_slug/edit',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'New User Group',
                    path: '/systools/user_groups/new',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'View User Group Members',
                    path: '/systools/user_groups/:user_group_slug/user_group_memberships',
                    element: (props) => <SysToolsListViewScreen {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'Add User Group Member',
                    path: '/systools/user_groups/:user_group_slug/user_group_memberships/new',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                // Permissions
                {
                    title: 'Permissions',
                    path: '/systools/permissions',
                    element: (props) => <SysToolsListViewScreen {...props} />,
                    show_in_menu: true,
                },
                {
                    title: 'View Permission',
                    path: '/systools/permissions/:permission_slug',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'Edit Permission',
                    path: '/systools/permissions/:permission_slug/edit',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'New Permission',
                    path: '/systools/permissions/new',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'View Permission Users',
                    path: '/systools/permissions/:permission_slug/permission_instances',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'Add Permission User',
                    path: '/systools/permissions/:permission_slug/permission_instances/new',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                // Exportables
                {
                    title: 'Exportables',
                    path: '/systools/exportables',
                    element: (props) => <SysToolsListViewScreen {...props} />,
                    show_in_menu: true,
                },
                {
                    title: 'View Exportable',
                    path: '/systools/exportables/:exportable_id',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'Edit Exportable',
                    path: '/systools/exportables/:exportable_id/edit',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'New Exportable',
                    path: '/systools/exportables/new',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
            ]
        },
        {
            title: 'Helper modules',
            path: '/helper_modules',
            required_active_user_group_membership_slugs: ['platform_moderators', 'system_administrators'],
            children: [
                // Feedback Reports
                {
                    title: 'Feedback Reports',
                    path: '/helper_modules/feedback_reports',
                    element: (props) => <ExampleElement {...props} />,
                    required_active_user_group_membership_slugs: ['platform_moderators'],
                    show_in_menu: true,
                },
                {
                    title: 'View Feedback Report',
                    path: '/helper_modules/feedback_reports/:ticket_code',
                    element: (props) => <ExampleElement {...props} />,
                    required_active_user_group_membership_slugs: ['platform_moderators'],
                    show_in_menu: false,
                },
                {
                    title: 'Edit Feedback Report',
                    path: '/helper_modules/feedback_reports/:ticket_code/edit',
                    element: (props) => <ExampleElement {...props} />,
                    required_active_user_group_membership_slugs: ['platform_moderators'],
                    show_in_menu: false,
                },
                // Chats
                {
                    title: 'Chats',
                    path: '/helper_modules/chats',
                    element: (props) => <ExampleElement {...props} />,
                    required_active_user_group_membership_slugs: ['platform_moderators'],
                    show_in_menu: true,
                },
                {
                    title: 'Chat Messages',
                    path: '/helper_modules/chats/:chat_id/messages',
                    element: (props) => <ExampleElement {...props} />,
                    required_active_user_group_membership_slugs: ['platform_moderators'],
                    show_in_menu: false,
                },
                // Posts
                {
                    title: 'Edit Post',
                    path: '/helper_modules/posts/:post_id/edit',
                    element: (props) => <ExampleElement {...props} />,
                    required_active_user_group_membership_slugs: ['platform_moderators'],
                    show_in_menu: false,
                },
                {
                    title: 'New Post',
                    path: '/helper_modules/posts/new',
                    element: (props) => <ExampleElement {...props} />,
                    required_active_user_group_membership_slugs: ['platform_moderators'],
                    show_in_menu: false,
                },
                // Log Viewer
                {
                    title: 'Log Viewer',
                    path: '/helper_modules/log_viewer',
                    element: (props) => <ExampleElement {...props} />,
                    required_active_user_group_membership_slugs: ['system_administrators'],
                    show_in_menu: true,
                },
            ]
        },
        {
            title: 'Datalists',
            path: '/datalists',
            required_active_user_group_membership_slugs: ['platform_moderators'],
            children: [
                {
                    title: 'Assets List',
                    path: '/datalists/assets',
                    element: (props) => <DatalistListViewScreen {...props} />,
                    show_in_menu: true,
                },
                {
                    title: 'Currencies List',
                    path: '/datalists/currencies',
                    element: (props) => <DatalistListViewScreen {...props} />,
                    show_in_menu: true,
                },
                {
                    title: 'Payment Methods List',
                    path: '/datalists/payment_methods',
                    element: (props) => <DatalistListViewScreen {...props} />,
                    show_in_menu: true,
                },
                {
                    title: 'Countries List',
                    path: '/datalists/countries',
                    element: (props) => <DatalistListViewScreen {...props} />,
                    show_in_menu: true,
                },
            ]
        },
    ]
}
