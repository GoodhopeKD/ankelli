import React from "react"

import SideBar from 'app/views/components/SideBar'

class ExampleElement extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-fluid py-3">
                <div className="row">
                    <div className="col-2">
                        <SideBar nav_menus={this.props.nav_menus} />
                    </div>
                    <div className="col-10">
                        {this.props.title} Screen
                    </div>
                </div>
            </div>
        </this.props.PageWrapper>
    }
}

export const account_settings_menu = {
    slug: 'account_settings_menu',
    menu_title: 'Settings',
    show_when_auth_state_is: true,
    show_in_menu: true,
    menu_items: [
        {
            title: 'Email Settings',
            path: '/account_settings/email_addresses',
            element: (props) => <ExampleElement {...props} nav_menus={[props.nav_menus.find(menu => menu.slug === 'account_settings_menu')]} />,
        },
        {
            title: 'Change Password',
            path: '/account_settings/change_password',
            element: (props) => <ExampleElement {...props} nav_menus={[props.nav_menus.find(menu => menu.slug === 'account_settings_menu')]} />,
        },
        {
            title: 'Display Settings',
            path: '/account_settings/display_settings',
            element: (props) => <ExampleElement {...props} nav_menus={[props.nav_menus.find(menu => menu.slug === 'account_settings_menu')]} />,
        },
        {
            title: 'Avatar Image',
            path: '/account_settings/avatar_image',
            element: (props) => <ExampleElement {...props} nav_menus={[props.nav_menus.find(menu => menu.slug === 'account_settings_menu')]} />,
        },
        {
            title: 'User Group Memberships',
            path: '/account_settings/actions/user_group_memberships',
            element: (props) => <ExampleElement {...props} nav_menus={[props.nav_menus.find(menu => menu.slug === 'account_settings_menu')]} />,
        },
        {
            title: 'Permissions',
            path: '/account_settings/actions/permission_instances',
            element: (props) => <ExampleElement {...props} nav_menus={[props.nav_menus.find(menu => menu.slug === 'account_settings_menu')]} />,
        },
        {
            title: 'Sessions',
            path: '/account_settings/session_info',
            children: [
                {
                    title: 'Recent Sessions',
                    path: '/account_settings/session_info/recent_sessions',
                    element: (props) => <ExampleElement {...props} nav_menus={[props.nav_menus.find(menu => menu.slug === 'account_settings_menu')]} />,
                },
                {
                    title: 'Recent Session Info',
                    path: '/account_settings/session_info/recent_sessions/:session_token',
                    element: (props) => <ExampleElement {...props} nav_menus={[props.nav_menus.find(menu => menu.slug === 'account_settings_menu')]} />,
                    show_in_menu: false,
                },
                {
                    title: 'Log Viewer',
                    path: '/account_settings/session_info/log_viewer',
                    element: (props) => <ExampleElement {...props} nav_menus={[props.nav_menus.find(menu => menu.slug === 'account_settings_menu')]} />,
                }
            ]
        },
    ]
}
