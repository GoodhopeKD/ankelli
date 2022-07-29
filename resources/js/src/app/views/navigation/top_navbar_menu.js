import OffersListViewScreen from 'app/views/screens/OffersListView.screen'
import OffersSingleViewScreen from 'app/views/screens/OffersSingleView.screen'
import OffersCreateNewScreen from 'app/views/screens/OffersCreateNew.screen'
import TradesListViewScreen from 'app/views/screens/TradesListView.screen'
import TradesSingleViewScreen from 'app/views/screens/TradesSingleView.screen'

export const top_navbar_menu = {
    slug: 'top_navbar_menu',
    menu_title: 'Top Navbar Menu',
    auth_state_required: null,
    visible_in_menu: true,
    menu_items: [
        {
            title: 'P2P',
            path: '/offers',
            path_alias: '/',
            element: (props) => <OffersListViewScreen />,
            auth_state_required: null,
        },
        {
            title: 'View Offer',
            path: '/offers/:offer_id',
            element: (props) => <OffersSingleViewScreen />,
            auth_state_required: null,
            visible_in_menu: false
        },
        {
            title: 'Create an Offer',
            path: '/offers/new',
            element: (props) => <OffersCreateNewScreen />,
            auth_state_required: null,
        },
        {
            title: 'Trades',
            path: '/trades',
            element: (props) => <TradesListViewScreen />,
            auth_state_required: true,
        },
        {
            title: 'View Trade',
            path: '/trades/:trade_id',
            element: (props) => <TradesSingleViewScreen />,
            auth_state_required: null,
            visible_in_menu: false
        },
    ]
}
