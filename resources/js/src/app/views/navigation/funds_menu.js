import React from "react"

import CryptoAssetWalletsScreen from 'app/views/screens/funds_menu/CryptoAssetWallets.screen'
import BCDepositScreen from "app/views/screens/funds_menu/BCDeposit.screen"
import BCWithdrawScreen from "app/views/screens/funds_menu/BCWithdraw.screen"
//import PlatformReceivePaymentScreen from "app/views/screens/pay_menu/PlatformReceivePayment.screen"
import PlatformSendPaymentScreen from "app/views/screens/pay_menu/PlatformSendPayment.screen"
import DepositTokenTopupScreen from 'app/views/screens/funds_menu/DepositTokenTopup.screen'
import TransactionsViewListScreen from 'app/views/screens/funds_menu/TransactionsViewList.screen'
import TransactionsViewSingleScreen from 'app/views/screens/funds_menu/TransactionsViewSingle.screen'

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
    menu_title: 'Funds Menu',
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
            title: 'Deposit',
            path: '/deposit',
            restricted_for_default_users: true,
            children: [
                {
                    title: 'Receive crypto',
                    path: '/deposit/receive-crypto',
                    element: (props) => <BCDepositScreen {...props} />,
                },
                {
                    title: 'Token topup',
                    path: '/deposit/token-topup',
                    element: (props) => <DepositTokenTopupScreen {...props} />,
                },
            ]
        },
        {
            title: 'Withdraw',
            path: '/withdraw',
            restricted_for_default_users: true,
            element: (props) => <BCWithdrawScreen {...props} />,
        },
        {
            title: 'Convert crypto',
            path: '/crypto-conversion',
            restricted_for_default_users: true,
            element: (props) => <ExampleElement {...props} />,
        },
        {
            title: 'Transactions',
            path: '/transactions',
            element: (props) => <TransactionsViewListScreen {...props} />,
        },
        {
            title: 'Transaction',
            path: '/transactions/:ref_code',
            show_in_menu: false,
            element: (props) => <TransactionsViewSingleScreen {...props} />,
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
