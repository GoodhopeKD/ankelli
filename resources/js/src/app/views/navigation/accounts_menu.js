import React from "react"

import SideBar from 'app/views/components/SideBar'

class ExampleElement extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-xl py-3">
                <div className="row">
                    <div className="col-lg-2">
                        <SideBar nav_menus={[this.props.nav_menus.find(menu => menu.slug === 'accounts_menu')]} />
                    </div>
                    <div className="col-lg-10">
                        {this.props.title} screen
                    </div>
                </div>
            </div>
        </this.props.PageWrapper>
    }
}

export const accounts_menu = {
    slug: 'accounts_menu',
    menu_title: 'My profile',
    subdomain: 'accounts',
    show_when_auth_state_is: true,
    show_in_menu: true,
    menu_items: [
        {
            title: 'Profile',
            path: '/profile',
            path_alias: '/',
            element: (props) => <ExampleElement {...props} />,
        },
        {
            title: 'Settings',
            path: '/settings',
            children: [
                {
                    title: 'General',
                    path: '/settings/sessions',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Change Password',
                    path: '/settings/change-password',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Email addresses',
                    path: '/settings/email-addresses',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Phone numbers',
                    path: '/settings/phone-numbers',
                    element: (props) => <ExampleElement {...props} />,
                },
            ]
        },
        {
            title: 'User Groups',
            path: '/systools/user-group-memberships',
            element: (props) => <ExampleElement {...props} />,
        },
        {
            title: 'Permissions',
            path: '/systools/permission-instances',
            element: (props) => <ExampleElement {...props} />,
        },
        {
            title: 'Activity',
            path: '/activity',
            children: [
                {
                    title: 'Sessions',
                    path: '/activity/sessions',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Recent Session Info',
                    path: '/activity/sessions/:session_token',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'Log Viewer',
                    path: '/activity/logger',
                    element: (props) => <ExampleElement {...props} />,
                }
            ]
        },
        {
            title: 'Referral program',
            path: '/referral-program',
            element: (props) => <ExampleElement {...props} />,
        },
    ]
}
