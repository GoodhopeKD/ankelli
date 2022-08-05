import OffersListViewScreen from 'app/views/screens/OffersListView.screen'
import OffersSingleViewScreen from 'app/views/screens/OffersSingleView.screen'
import OffersCreateNewScreen from 'app/views/screens/OffersCreateNew.screen'
import TradesListViewScreen from 'app/views/screens/TradesListView.screen'
import TradesSingleViewScreen from 'app/views/screens/TradesSingleView.screen'
import LearnScreen from 'app/views/screens/Learn.screen'

export const top_navbar_menu = {
    slug: 'top_navbar_menu',
    menu_title: 'Top Navbar Menu',
    show_in_menu: true,
    menu_items: [
        {
            title: 'P2P',
            path: '/offers',
            path_alias: '/',
            element: (props) => <OffersListViewScreen />,
        },
        {
            title: 'View Offer',
            path: '/offers/:offer_id',
            element: (props) => <OffersSingleViewScreen />,
            show_in_menu: false
        },
        {
            title: 'Create an Offer',
            path: '/offers/new',
            element: (props) => <OffersCreateNewScreen />,
        },
        {
            title: 'Trades',
            path: '/trades',
            element: (props) => <TradesListViewScreen />,
            show_when_auth_state_is: true,
        },
        {
            title: 'View Trade',
            path: '/trades/:trade_id',
            element: (props) => <TradesSingleViewScreen />,
            show_when_auth_state_is: true,
            show_in_menu: false
        },
        {
            title: 'Learn',
            path: '/learn',
            element: (props) => <LearnScreen />,
        },
    ]
}
