import React from "react"

import UserProfileScreen from 'app/views/screens/user_profile_menu/UserProfile.screen'
import DepositsScreen from 'app/views/screens/user_profile_menu/Deposits.screen'
import WithdrawalsScreen from 'app/views/screens/user_profile_menu/Withdrawals.screen'
import TransactionsListViewScreen from 'app/views/screens/user_profile_menu/TransactionsListView.screen'

export const user_profile_menu = {
    slug: 'user_profile_menu',
    menu_title: 'Profile',
    auth_state_required: true,
    visible_in_menu: true,
    menu_items: [
        {
            title: 'Dashboard',
            path: '/user_profile/dashboard',
            element: (props) => <UserProfileScreen nav_menus={props.nav_menus} />,
            faicon_class: "fas fa-gavel",
        },
        {
            title: 'Deposit',
            path: '/user_profile/deposit',
            element: (props) => <DepositsScreen nav_menus={props.nav_menus} />,
            faicon_class: "fas fa-gavel",
        },
        {
            title: 'Withdraw',
            path: '/user_profile/withdraw',
            element: (props) => <WithdrawalsScreen nav_menus={props.nav_menus} />,
            faicon_class: "fas fa-gavel",
        },
        {
            title: 'Transactions',
            path: '/user_profile/transactions',
            element: (props) => <TransactionsListViewScreen nav_menus={props.nav_menus} />,
            faicon_class: "fas fa-user-tie",
        },
    ]
}
