import React from "react"
import { connect } from 'react-redux'

import SideBar from 'app/views/components/SideBar'

import { _User, _Session } from 'app/controller'

class UserProfileScreen extends React.Component {

    componentDidMount = () => {
        _Session.refresh()
    }

    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-fluid py-3">
                <div className="row">
                    <div className="col-2">
                        <SideBar nav_menus={[this.props.nav_menus.find(menu => menu.slug === 'account_menu')]} />
                    </div>
                    <div className="col-10">
                        <h4>My asset wallets</h4>
                        <table className="table">
                            <thead>
                                <tr>
                                    <th scope="col">Asset Code</th>
                                    <th scope="col">Balance</th>
                                </tr>
                            </thead>
                            <tbody>
                                {this.props.auth_user.asset_wallets.map((asset_wallet, index) => {
                                    return <tr key={index} >
                                        <td className="align-middle">{asset_wallet.asset_code}</td>
                                        <td className="align-middle">{asset_wallet.asset_value}</td>
                                    </tr>
                                })}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </this.props.PageWrapper>
    }
}

const mapStateToProps = (state) => {
    return {
        auth_user: state.auth_user_data ? new _User(state.auth_user_data, ['asset_wallets']) : null,
    }
}

export default connect(mapStateToProps)(UserProfileScreen)