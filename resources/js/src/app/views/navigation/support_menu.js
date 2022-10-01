import React from "react"

import SideBar from 'app/views/components/SideBar'

class ExampleElement extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container py-3">
                <div className="row">
                    <div className="col-2">
                        <SideBar nav_menus={[this.props.nav_menus.find(menu => menu.slug === 'support_menu')]} />
                    </div>
                    <div className="col-10">
                        {this.props.title} screen
                    </div>
                </div>
            </div>
        </this.props.PageWrapper>
    }
}

export const support_menu = {
    slug: 'support_menu',
    menu_title: 'Support',
    subdomain: 'support',
    show_in_menu: true,
    restricted_for_default_users: true,
    menu_items: [
        {
            title: 'Customer support',
            path: '/home',
            element: (props) => <ExampleElement {...props} />,
        },
        {
            title: 'Submit Feedback',
            path: '/feedback-reports/new',
            element: (props) => <ExampleElement {...props} />,
        },
        {
            title: 'Feedback reports',
            path: '/feedback-reports',
            element: (props) => <ExampleElement {...props} />,
            required_active_user_group_membership_slugs: ['moderators'],
        },
        {
            title: 'Feedback report',
            path: '/feedback-reports/:ticket_code',
            element: (props) => <ExampleElement {...props} />,
            required_active_user_group_membership_slugs: ['moderators'],
            show_in_menu: false,
        },
        {
            title: 'Flagged elements',
            path: '/flagged-elements',
            required_active_user_group_membership_slugs: ['moderators'],
            children: [
                {
                    title: 'Flagged users',
                    path: '/flagged-elements/users',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Flagged user',
                    path: '/flagged-elements/users/:username',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'Flagged trades',
                    path: '/flagged-elements/trades',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Flagged trade',
                    path: '/flagged-elements/trades/:ref_code',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
            ]
        },
        {
            title: 'Chat with rep',
            path: '/chats',
            element: (props) => <ExampleElement {...props} />,
            required_active_user_group_membership_slugs: ['moderators'],
        },
        {
            title: 'Chat with rep',
            path: '/chats/:chat_id',
            element: (props) => <ExampleElement {...props} />,
            required_active_user_group_membership_slugs: ['moderators'],
            show_in_menu: false,
        },
    ]
}
