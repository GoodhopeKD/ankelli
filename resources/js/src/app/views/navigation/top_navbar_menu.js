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
            element: (props) => <OffersListViewScreen {...props} />,
        },
        {
            title: 'View Offer',
            path: '/offers/:ref_code',
            path_alias: '/offers/:ref_code/:currency_amount',
            element: (props) => <OffersSingleViewScreen {...props} />,
            show_in_menu: false
        },
        {
            title: 'Create an Offer',
            path: '/offers/new',
            element: (props) => <OffersCreateNewScreen {...props} />,
        },
        {
            title: 'Learn',
            path: '/learn',
            element: (props) => <LearnScreen {...props} />,
        },
        {
            title: 'Trades',
            path: '/trades',
            element: (props) => <TradesListViewScreen {...props} />,
            show_when_auth_state_is: true,
        },
        {
            title: 'View Trade',
            path: '/trades/:ref_code',
            element: (props) => <TradesSingleViewScreen {...props} />,
            show_when_auth_state_is: true,
            show_in_menu: false
        },
        {
            title: 'My offers',
            path: '/my-offers',
            show_when_auth_state_is: true,
            element: (props) => <OffersListViewScreen {...props} screen_mode="my-offers" />,
        },
        {
            title: 'View Offer',
            path: '/my-offers/:ref_code',
            element: (props) => <OffersSingleViewScreen {...props} screen_mode="my-offers" />,
            show_when_auth_state_is: true,
            show_in_menu: false
        },
    ]
}
