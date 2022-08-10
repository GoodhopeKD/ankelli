import React from "react"
import { connect } from 'react-redux'

import SideBar from 'app/views/components/SideBar'

import { _User } from 'app/controller'

class TransactionsListViewScreen extends React.Component {

    render() {
        return <div className="container-fluid py-3">
            <div className="row">
                <div className="col-2">
                    <SideBar nav_menus={[this.props.nav_menus.find(menu => menu.slug === 'account_menu')]} />
                </div>
                <div className="col-10">
                    User Transactions Show Here
                </div>
            </div>
        </div>
    }
}

const mapStateToProps = (state) => {
    return {
        auth_user: state.auth_user_data ? new _User(state.auth_user_data, ['active_navigation_screens', 'profile_image']) : null,
    }
}

export default connect(mapStateToProps)(TransactionsListViewScreen)