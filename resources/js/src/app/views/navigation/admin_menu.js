import React from "react"
import PlatformWalletManagementScreen from 'app/views/screens/admin_menu/funds-admin/PlatformWalletManagement.screen'
import DepositTokensViewListScreen from 'app/views/screens/admin_menu/funds-admin/DepositTokensViewList.screen'
import DepositTokensCreateNewScreen from 'app/views/screens/admin_menu/funds-admin/DepositTokensCreateNew.screen'
import RegTokensViewListScreen from 'app/views/screens/admin_menu/accounts-admin/RegTokensViewList.screen'
import DatalistViewListScreen from "app/views/screens/admin_menu/datalists/DatalistViewList.screen"
import AssetsViewSingleScreen from "app/views/screens/admin_menu/datalists/AssetsViewSingle.screen"
import SysToolsViewListScreen from "app/views/screens/admin_menu/systools/SysToolsViewList.screen"

import EditSysConfigParamsScreen from "app/views/screens/admin_menu/sysconfig/EditSysConfigParams.screen"

import SideBar from 'app/views/components/SideBar'

class ExampleElement extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-xl py-3">
                <div className="row">
                    <div className="col-lg-2">
                        <SideBar nav_menus={this.props.nav_menus.filter(menu => menu.slug === 'admin_menu')} />
                    </div>
                    <div className="col-lg-10">
                        {this.props.title} screen
                    </div>
                </div>
            </div>
        </this.props.PageWrapper>
    }
}

export const admin_menu = {
    slug: 'admin_menu',
    menu_title: 'Admin Menu',
    subdomain: 'admin',
    show_in_menu: true,
    show_when_auth_state_is: true,
    required_active_user_group_membership_slugs: ['administrators'],
    menu_items: [
        {
            title: 'Dashboard',
            path: '/dashboard',
            element: (props) => <ExampleElement {...props} />,
            show_in_menu: true,
        },
        {
            title: 'Analytics',
            path: '/analytics',
            children: [
                {
                    title: 'User analytics',
                    path: '/analytics/users',
                    required_active_user_group_membership_slugs: ['user_administrators'],
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: true,
                },
                {
                    title: 'Funds Analytics',
                    path: '/analytics/funds',
                    required_active_user_group_membership_slugs: ['business_administrators', 'system_administrators'],
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: true,
                },
                {
                    title: 'Ankelli Pay Analytics',
                    path: '/analytics/pay',
                    required_active_user_group_membership_slugs: ['business_administrators'],
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: true,
                },
                {
                    title: 'P2P Analytics',
                    path: '/analytics/p2p',
                    required_active_user_group_membership_slugs: ['business_administrators'],
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: true,
                },
            ]
        },
        {
            title: 'Funds admin',
            path: '/funds-admin',
            required_active_user_group_membership_slugs: ['business_administrators'],
            restricted_for_default_users: true,
            children: [
                {
                    title: 'Manage platform wallets',
                    path: '/funds-admin/platform-wallets-management',
                    element: (props) => <PlatformWalletManagementScreen {...props} />,
                    required_active_user_group_membership_slugs: ['business_administrators'],
                    show_in_menu: true,
                },
                // Deposit tokens management
                {
                    title: 'Deposit Tokens',
                    path: '/funds-admin/deposit-tokens',
                    element: (props) => <DepositTokensViewListScreen {...props} />,
                    required_active_user_group_membership_slugs: ['business_administrators'],
                    show_in_menu: true,
                },
                {
                    title: 'New Deposit Token',
                    path: '/funds-admin/deposit-tokens/new',
                    element: (props) => <DepositTokensCreateNewScreen {...props} />,
                    required_active_user_group_membership_slugs: ['business_administrators'],
                    show_in_menu: false,
                },
                {
                    title: 'Edit Deposit Token',
                    path: '/funds-admin/deposit-tokens/:deposit_token_id/edit',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
            ]
        },
        {
            title: 'Accounts admin',
            path: '/accounts-admin',
            required_active_user_group_membership_slugs: ['user_administrators'],
            children: [
                {
                    title: 'Registration Tokens',
                    path: '/accounts-admin/reg_tokens',
                    element: (props) => <RegTokensViewListScreen {...props} />,
                    show_in_menu: true,
                },
                {
                    title: 'Users',
                    path: '/accounts-admin/users',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: true,
                },
                {
                    title: 'View Profile',
                    path: '/accounts-admin/users/:username/profile',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'View User\'s Groups',
                    path: '/accounts-admin/users/:username/user-group-memberships',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'Edit User\'s Groups',
                    path: '/accounts-admin/users/:username/user-group-memberships/:user_group_membership_id/edit',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'View User\'s Permissions',
                    path: '/accounts-admin/users/:username/permission-instances',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'Edit User\'s Permissions',
                    path: '/accounts-admin/users/:username/permission-instances/:permission_instance_id/edit',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
            ]
        },
        {
            title: 'System config',
            path: '/sysconfig',
            required_active_user_group_membership_slugs: ['system_administrators'],
            children: [
                {
                    title: 'Edit SysConfig params',
                    path: '/sysconfig',
                    element: (props) => <EditSysConfigParamsScreen {...props} />,
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
                    path: '/systools/user-groups',
                    element: (props) => <SysToolsViewListScreen {...props} />,
                    show_in_menu: true,
                },
                {
                    title: 'View User Group',
                    path: '/systools/user-groups/:slug',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'Edit User Group',
                    path: '/systools/user-groups/:slug/edit',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'New User Group',
                    path: '/systools/user-groups/new',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'View User Group Members',
                    path: '/systools/user-groups/:slug/user-group-memberships',
                    element: (props) => <SysToolsViewListScreen {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'Add User Group Member',
                    path: '/systools/user-groups/:slug/user-group-memberships/new',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                // Permissions
                {
                    title: 'Permissions',
                    path: '/systools/permissions',
                    element: (props) => <SysToolsViewListScreen {...props} />,
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
                    path: '/systools/permissions/:permission_slug/permission-instances',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'Add Permission User',
                    path: '/systools/permissions/:permission_slug/permission-instances/new',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
            ]
        },
        {
            title: 'Helper modules',
            path: '/helper_modules',
            required_active_user_group_membership_slugs: ['system_administrators'],
            children: [
                // Posts
                {
                    title: 'Edit Post',
                    path: '/helper_modules/posts/:post_id/edit',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'New Post',
                    path: '/helper_modules/posts/new',
                    element: (props) => <ExampleElement {...props} />,
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
            restricted_for_default_users: true,
            children: [
                {
                    title: 'Assets List',
                    path: '/datalists/assets',
                    element: (props) => <DatalistViewListScreen {...props} />,
                    show_in_menu: true,
                },
                {
                    title: 'Assets List',
                    path: '/datalists/assets/:id',
                    element: (props) => <AssetsViewSingleScreen {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'Currencies List',
                    path: '/datalists/currencies',
                    element: (props) => <DatalistViewListScreen {...props} />,
                    show_in_menu: true,
                },
                {
                    title: 'Payment Methods List',
                    path: '/datalists/payment_methods',
                    element: (props) => <DatalistViewListScreen {...props} />,
                    show_in_menu: true,
                },
                {
                    title: 'Countries List',
                    path: '/datalists/countries',
                    element: (props) => <DatalistViewListScreen {...props} />,
                    show_in_menu: true,
                },
            ]
        },
    ]
}
