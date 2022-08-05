import React from "react"

import UserProfileScreen from 'app/views/screens/account_ops_menu/UserProfile.screen'
import DepositsScreen from 'app/views/screens/account_ops_menu/Deposits.screen'
import WithdrawalsScreen from 'app/views/screens/account_ops_menu/Withdrawals.screen'
import TransactionsListViewScreen from 'app/views/screens/account_ops_menu/TransactionsListView.screen'

export const account_ops_menu = {
    slug: 'account_ops_menu',
    menu_title: 'My Account',
    show_when_auth_state_is: true,
    show_in_menu: true,
    menu_items: [
        {
            title: 'Dashboard',
            path: '/account_operations/dashboard',
            element: (props) => <UserProfileScreen nav_menus={props.nav_menus} />,
        },
        {
            title: 'Deposit',
            path: '/account_operations/deposit',
            element: (props) => <DepositsScreen nav_menus={props.nav_menus} />,
        },
        {
            title: 'Withdraw',
            path: '/account_operations/withdraw',
            element: (props) => <WithdrawalsScreen nav_menus={props.nav_menus} />,
        },
        {
            title: 'Transactions',
            path: '/account_operations/transactions',
            element: (props) => <TransactionsListViewScreen nav_menus={props.nav_menus} />,
        },
    ]
}
