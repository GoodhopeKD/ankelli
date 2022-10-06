import React from 'react'

import OffersViewListScreen from 'app/views/screens/p2p_menu/OffersViewList.screen'
import OffersViewSingleScreen from 'app/views/screens/p2p_menu/OffersViewSingle.screen'
import OffersCreateNewScreen from 'app/views/screens/p2p_menu/OffersCreateNew.screen'
import TradesViewListScreen from 'app/views/screens/p2p_menu/TradesViewList.screen'
import TradesViewSingleScreen from 'app/views/screens/p2p_menu/TradesViewSingle.screen'
import LearnScreen from 'app/views/screens/Learn.screen'

export const _top_navbar_menu = {
    slug: '_top_navbar_menu',
    menu_title: 'Top Navbar Menu',
    subdomain: 'p2p',
    show_in_menu: true,
    menu_items: [
        {
            title: 'P2P',
            path: '/',
            subdomain: 'default',
            element: (props) => <OffersViewListScreen {...props} />,
            show_in_menu: false
        },
        {
            title: 'P2P',
            path: '/offers',
            path_alias: '/',
            element: (props) => <OffersViewListScreen {...props} />,
        },
        {
            title: 'View Offer',
            path: '/offers/:ref_code',
            path_alias: '/offers/:ref_code/:currency_amount',
            element: (props) => <OffersViewSingleScreen {...props} />,
            restricted_for_default_users: true,
            show_in_menu: false
        },
        {
            title: 'Create offer',
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
            title: 'Trades',
            path: '/trades',
            element: (props) => <TradesViewListScreen {...props} />,
            show_when_auth_state_is: true,
            restricted_for_default_users: true,
        },
        {
            title: 'View Trade',
            path: '/trades/:ref_code',
            element: (props) => <TradesViewSingleScreen {...props} />,
            show_when_auth_state_is: true,
            restricted_for_default_users: true,
            show_in_menu: false
        },
        {
            title: 'My offers',
            path: '/my-offers',
            show_when_auth_state_is: true,
            element: (props) => <OffersViewListScreen {...props} screen_mode="my-offers" />,
            restricted_for_default_users: true,
        },
        {
            title: 'View Offer',
            path: '/my-offers/:ref_code',
            element: (props) => <OffersViewSingleScreen {...props} screen_mode="my-offers" />,
            show_when_auth_state_is: true,
            restricted_for_default_users: true,
            show_in_menu: false
        },
    ]
}
