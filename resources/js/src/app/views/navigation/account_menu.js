import React from "react"

import UserProfileScreen from 'app/views/screens/account_menu/UserProfile.screen'
import DepositsScreen from 'app/views/screens/account_menu/Deposits.screen'
import WithdrawalsScreen from 'app/views/screens/account_menu/Withdrawals.screen'
import TransactionsListViewScreen from 'app/views/screens/account_menu/TransactionsListView.screen'

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
            path: '/account/deposit',
            element: (props) => <DepositsScreen {...props} />,
        },
        {
            title: 'Withdraw',
            path: '/account/withdraw',
            element: (props) => <WithdrawalsScreen {...props} />,
        },
        {
            title: 'Transactions',
            path: '/account/transactions',
            element: (props) => <TransactionsListViewScreen {...props} />,
        },
    ]
}
