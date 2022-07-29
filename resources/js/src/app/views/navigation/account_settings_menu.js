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

export const account_settings_menu = {
    slug: 'account_settings_menu',
    menu_title: 'Account Settings',
    auth_state_required: true,
    visible_in_menu: true,
    menu_items: [
        {
            title: 'Email Settings',
            path: '/user_account/email_addresses',
            element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'account_settings_menu')]} />,
        },
        {
            title: 'Change Password',
            path: '/user_account/change_password',
            element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'account_settings_menu')]} />,
        },
        {
            title: 'Avatar Image',
            path: '/user_profile/avatar_image',
            element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'account_settings_menu')]} />,
        },
        {
            title: 'User Group Memberships',
            path: '/user_account/actions/user_group_memberships',
            element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'account_settings_menu')]} />,
        },
        {
            title: 'Permissions',
            path: '/user_account/actions/permission_instances',
            element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'account_settings_menu')]} />,
        },
        {
            title: 'Session Info',
            path: '/user_account/session_info',
            element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'account_settings_menu')]} />,
            children: [
                {
                    title: 'Recent Sessions',
                    path: '/user_account/session_info/recent_sessions',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'account_settings_menu')]} />,
                },
                {
                    title: 'Recent Session Info',
                    path: '/user_account/session_info/recent_sessions/:session_id',
                    element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'account_settings_menu')]} />,
                },
            ]
        },
        {
            title: 'Log Viewer',
            path: '/user_account/log_viewer',
            element: (props) => <ExampleElement title={props.title} nav_menus={[props.nav_menus.find(menu => menu.slug === 'account_settings_menu')]} />,
        }
    ]
}
