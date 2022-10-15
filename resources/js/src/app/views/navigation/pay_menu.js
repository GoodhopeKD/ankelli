import React from "react"

import SideBar from 'app/views/components/SideBar'

class ExampleElement extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-xl py-3">
                <div className="row">
                    <div className="col-lg-2">
                        <SideBar nav_menus={this.props.nav_menus.filter(menu => menu.slug === 'pay_menu')} />
                    </div>
                    <div className="col-lg-10">
                        {this.props.title} screen
                    </div>
                </div>
            </div>
        </this.props.PageWrapper>
    }
}

export const pay_menu = {
    slug: 'pay_menu',
    menu_title: 'Ankelli Pay',
    subdomain: 'pay',
    show_in_menu: true,
    restricted_for_default_users: true,
    menu_items: [
        {
            title: 'Home',
            path: '/home',
            element: (props) => <ExampleElement {...props} />,
        },
        {
            disabled: true,
            title: 'Merchants',
            path: '/merchants',
            element: (props) => <ExampleElement {...props} />,
        },
        {
            disabled: true,
            title: 'Registered merchant',
            path: '/merchants/:username',
            element: (props) => <ExampleElement {...props} />,
            show_in_menu: false,
        },
        {
            disabled: true,
            title: 'Virtual cards',
            path: '/virtual-cards',
            element: (props) => <ExampleElement {...props} />,
            show_when_auth_state_is: true,
        },
        {
            disabled: true,
            title: 'Virtual card',
            path: '/virtual-cards/:virtual_card_id',
            element: (props) => <ExampleElement {...props} />,
            show_when_auth_state_is: true,
            show_in_menu: false,
        },
        {
            title: 'Platform payments',
            path: '/platform-payments',
            show_when_auth_state_is: true,
            children: [
                {
                    title: 'Receive payment',
                    path: '/platform-payments/receive',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Send payment',
                    path: '/platform-payments/send',
                    element: (props) => <ExampleElement {...props} />,
                },
            ]
        }
    ]
}
