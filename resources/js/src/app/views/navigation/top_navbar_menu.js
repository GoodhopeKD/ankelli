import React from 'react'

import OffersListViewScreen from 'app/views/screens/OffersListView.screen'
import OffersSingleViewScreen from 'app/views/screens/OffersSingleView.screen'
import OffersCreateNewScreen from 'app/views/screens/OffersCreateNew.screen'
import TradesListViewScreen from 'app/views/screens/TradesListView.screen'
import TradesSingleViewScreen from 'app/views/screens/TradesSingleView.screen'
import LearnScreen from 'app/views/screens/Learn.screen'

class ExampleElement extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container py-3">
                {this.props.title} screen
            </div>
        </this.props.PageWrapper>
    }
}

export const top_navbar_menu = {
    slug: 'top_navbar_menu',
    menu_title: 'Top Navbar Menu',
    subdomain: 'p2p',
    show_in_menu: true,
    menu_items: [
        {
            title: 'P2P',
            path: '/',
            subdomain: 'default',
            element: (props) => <OffersListViewScreen {...props} />,
            show_in_menu: false
        },
        {
            title: 'P2P',
            path: '/offers',
            path_alias: '/',
            element: (props) => <OffersListViewScreen {...props} />,
        },
        {
            title: 'View Offer',
            path: '/offers/:ref_code',
            path_alias: '/offers/:ref_code/:currency_amount',
            element: (props) => <OffersSingleViewScreen {...props} />,
            restricted_for_default_users: true,
            show_in_menu: false
        },
        {
            title: 'Create an Offer',
            path: '/offers/new',
            element: (props) => <OffersCreateNewScreen {...props} />,
            restricted_for_default_users: true,
        },
        {
            title: 'Learn',
            path: '/learn',
            subdomain: 'default',
            element: (props) => <LearnScreen {...props} />,
            restricted_for_default_users: true,
        },
        {
            title: 'Pay',
            path: '/home',
            subdomain: 'pay',
            restricted_for_default_users: true,
        },
        {
            title: 'Trades',
            path: '/trades',
            element: (props) => <TradesListViewScreen {...props} />,
            show_when_auth_state_is: true,
            restricted_for_default_users: true,
        },
        {
            title: 'View Trade',
            path: '/trades/:ref_code',
            element: (props) => <TradesSingleViewScreen {...props} />,
            show_when_auth_state_is: true,
            restricted_for_default_users: true,
            show_in_menu: false
        },
        {
            title: 'My offers',
            path: '/my-offers',
            show_when_auth_state_is: true,
            element: (props) => <OffersListViewScreen {...props} screen_mode="my-offers" />,
            restricted_for_default_users: true,
        },
        {
            title: 'View Offer',
            path: '/my-offers/:ref_code',
            element: (props) => <OffersSingleViewScreen {...props} screen_mode="my-offers" />,
            show_when_auth_state_is: true,
            restricted_for_default_users: true,
            show_in_menu: false
        },
    ]
}
