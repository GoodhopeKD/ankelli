import React from "react"

import CryptoAssetWalletsScreen from 'app/views/screens/funds_menu/CryptoAssetWallets.screen'
import BCReceiveCryptoScreen from "app/views/screens/funds_menu/BCReceiveCrypto.screen"
import BCSendCryptoScreen from "app/views/screens/funds_menu/BCSendCrypto.screen"
//import PlatformReceivePaymentScreen from "app/views/screens/pay_menu/PlatformReceivePayment.screen"
import PlatformSendPaymentScreen from "app/views/screens/pay_menu/PlatformSendPayment.screen"
import DepositTokenTopupScreen from 'app/views/screens/funds_menu/DepositTokenTopup.screen'
import TransactionsViewListScreen from 'app/views/screens/funds_menu/TransactionsViewList.screen'

import SideBar from 'app/views/components/SideBar'

class ExampleElement extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-xl py-3">
                <div className="row">
                    <div className="col-lg-2">
                        <SideBar nav_menus={this.props.nav_menus.filter(menu => menu.slug === 'funds_menu')} />
                    </div>
                    <div className="col-lg-10">
                        {this.props.title} screen
                    </div>
                </div>
            </div>
        </this.props.PageWrapper>
    }
}

export const funds_menu = {
    slug: 'funds_menu',
    menu_title: 'Funds',
    subdomain: 'funds',
    show_when_auth_state_is: true,
    show_in_menu: true,
    menu_items: [
        {
            title: 'Dashboard',
            path: '/dashboard',
            element: (props) => <CryptoAssetWalletsScreen {...props} />,
        },
        {
            title: 'Deposits',
            path: '/deposits',
            children: [
                {
                    title: 'Receive crypto',
                    path: '/deposits/receive-crypto',
                    element: (props) => <BCReceiveCryptoScreen {...props} />,
                },
                {
                    title: 'Token topup',
                    path: '/deposits/token-topup',
                    element: (props) => <DepositTokenTopupScreen {...props} />,
                    restricted_for_default_users: true,
                },
            ]
        },
        {
            title: 'Withdrawals',
            path: '/withdrawals',
            element: (props) => <BCSendCryptoScreen {...props} />,
        },
        {
            title: 'Convert crypto',
            path: '/crypto-conversion',
            element: (props) => <ExampleElement {...props} />,
        },
        {
            title: 'Transactions',
            path: '/transactions',
            element: (props) => <TransactionsViewListScreen {...props} />,
        },
        {
            title: 'Ankelli Pay',
            path: '/platform-payments',
            restricted_for_default_users: true,
            children: [
                {
                    title: 'Receive payment',
                    path: '/platform-payments/receive',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Send payment',
                    path: '/platform-payments/send',
                    element: (props) => <PlatformSendPaymentScreen {...props} />,
                },
            ]
        },
    ]
}
