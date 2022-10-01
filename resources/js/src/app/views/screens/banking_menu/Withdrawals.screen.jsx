import React from "react"
import { connect } from 'react-redux'

import SideBar from 'app/views/components/SideBar'

import { _User } from 'app/controller'

class WithdrawalsScreen extends React.Component {

    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container py-3">
                <div className="row">
                    <div className="col-2">
                        <SideBar nav_menus={[this.props.nav_menus.find(menu => menu.slug === 'banking_menu')]} />
                    </div>
                    <div className="col-10">
                        Withdrawal Options Appear here
                    </div>
                </div>
            </div>
        </this.props.PageWrapper>
    }
}

const mapStateToProps = (state) => {
    return {
        auth_user: state.auth_user_data ? new _User(state.auth_user_data, ['active_navigation_screens', 'profile_image']) : null,
    }
}

export default connect(mapStateToProps)(WithdrawalsScreen)