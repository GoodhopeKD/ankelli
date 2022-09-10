import React from "react"

import UserProfileScreen from 'app/views/screens/account_menu/UserProfile.screen'
import DepositTokenTopupScreen from 'app/views/screens/account_menu/DepositTokenTopup.screen'
import WithdrawalsScreen from 'app/views/screens/account_menu/Withdrawals.screen'
import TransactionsListViewScreen from 'app/views/screens/account_menu/TransactionsListView.screen'

import SideBar from 'app/views/components/SideBar'

class ExampleElement extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-fluid py-3">
                <div className="row">
                    <div className="col-2">
                        <SideBar nav_menus={[this.props.nav_menus.find(menu => menu.slug === 'account_menu')]} />
                    </div>
                    <div className="col-10">
                        {this.props.title} Screen
                    </div>
                </div>
            </div>
        </this.props.PageWrapper>
    }
}

export const account_menu = {
    slug: 'account_menu',
    menu_title: 'My Account',
    show_when_auth_state_is: true,
    show_in_menu: true,
    menu_items: [
        {
            title: 'Dashboard',
            path: '/account/dashboard',
            element: (props) => <UserProfileScreen {...props} />,
        },
        {
            title: 'Deposit',
            path: '/account/deposits',
            children: [
                {
                    title: 'Internalisations',
                    path: '/account/deposits/internalisations',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Token topup',
                    path: '/account/deposits/token-toput',
                    element: (props) => <DepositTokenTopupScreen {...props} />,
                    restricted_for_default_users: true,
                },
            ]
        },
        {
            title: 'Withdraw',
            path: '/account/withdrawals',
            children: [
                {
                    title: 'Externalisations',
                    path: '/account/withdrawals/externalisations',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Assisted withdrawal',
                    path: '/account/withdrawals/assisted',
                    element: (props) => <WithdrawalsScreen {...props} />,
                    restricted_for_default_users: true,
                },
            ]
        },
        {
            title: 'Transactions',
            path: '/account/transactions',
            element: (props) => <TransactionsListViewScreen {...props} />,
        },
    ]
}
