import React from "react"

import CryptoAssetAccountsScreen from 'app/views/screens/banking_menu/CryptoAssetAccounts.screen'
import BCReceiveCryptoScreen from "app/views/screens/banking_menu/BCReceiveCrypto.screen"
import BCSendCryptoScreen from "app/views/screens/banking_menu/BCSendCrypto.screen"
import DepositTokenTopupScreen from 'app/views/screens/banking_menu/DepositTokenTopup.screen'
import WithdrawalsScreen from 'app/views/screens/banking_menu/Withdrawals.screen'
import TransactionsViewListScreen from 'app/views/screens/banking_menu/TransactionsViewList.screen'

import SideBar from 'app/views/components/SideBar'

class ExampleElement extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-xl py-3">
                <div className="row">
                    <div className="col-lg-2">
                        <SideBar nav_menus={[this.props.nav_menus.find(menu => menu.slug === 'banking_menu')]} />
                    </div>
                    <div className="col-lg-10">
                        {this.props.title} screen
                    </div>
                </div>
            </div>
        </this.props.PageWrapper>
    }
}

export const banking_menu = {
    slug: 'banking_menu',
    menu_title: 'Banking',
    subdomain: 'banking',
    show_when_auth_state_is: true,
    show_in_menu: true,
    menu_items: [
        {
            title: 'Overview',
            path: '/overview',
            element: (props) => <ExampleElement {...props} />,
        },
        {
            title: 'My Accounts',
            path: '/e-wallets',
            children: [
                {
                    title: 'My crypto wallets',
                    path: '/e-wallets/crypto',
                    path_alias: '/',
                    element: (props) => <CryptoAssetAccountsScreen {...props} />,
                },
                {
                    title: 'My fiat accounts',
                    path: '/e-wallets/fiat',
                    element: (props) => <ExampleElement {...props} />,
                },
            ]
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
                    title: 'Receive fiat',
                    path: '/deposits/receive-fiat',
                    element: (props) => <ExampleElement {...props} />,
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
            children: [
                {
                    title: 'Send crypto',
                    path: '/withdrawals/send-crypto',
                    element: (props) => <BCSendCryptoScreen {...props} />,
                },
                {
                    title: 'Send fiat',
                    path: '/withdrawals/send-fiat',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Agent Withdrawal',
                    path: '/withdrawals/via-agent',
                    element: (props) => <WithdrawalsScreen {...props} />,
                    restricted_for_default_users: true,
                },
            ]
        },
        {
            title: 'Convert crypto-fiat',
            path: '/crypto-fiat-conversion',
            element: (props) => <ExampleElement {...props} />,
        },
        {
            title: 'Transactions',
            path: '/transactions',
            element: (props) => <TransactionsViewListScreen {...props} />,
        },
        {
            title: 'Ankelli Pay',
            path: '/',
            subdomain: 'pay',
        },
    ]
}
