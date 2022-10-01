import React from "react"

import SideBar from 'app/views/components/SideBar'

class ExampleElement extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container py-3">
                <div className="row">
                    <div className="col-2">
                        <SideBar nav_menus={[this.props.nav_menus.find(menu => menu.slug === 'pay_menu')]} />
                    </div>
                    <div className="col-10">
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
            title: 'Merchants',
            path: '/merchants',
            element: (props) => <ExampleElement {...props} />,
        },
        {
            title: 'Registered store',
            path: '/merchants/:username',
            element: (props) => <ExampleElement {...props} />,
            show_in_menu: false,
        },
        {
            title: 'Virtual cards',
            path: '/virtual-cards',
            element: (props) => <ExampleElement {...props} />,
            show_when_auth_state_is: true,
        },
        {
            title: 'Virtual card',
            path: '/virtual-cards/:virtual_card_id',
            element: (props) => <ExampleElement {...props} />,
            show_when_auth_state_is: true,
            show_in_menu: false,
        },
        {
            title: 'QR payments',
            path: '/qr-payments',
            show_when_auth_state_is: true,
            children: [
                {
                    title: 'Receive payment',
                    path: '/qr-payments/receive',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Send payment',
                    path: '/qr-payments/send',
                    element: (props) => <ExampleElement {...props} />,
                },
            ]
        },
    ]
}
