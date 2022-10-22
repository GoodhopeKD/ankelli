import React from "react"
import { connect } from 'react-redux'
import _ from 'lodash'

import { _User, _Notification, _Transaction, _DateTime, _Input } from 'app/controller'

import SideBar from 'app/views/components/SideBar'
import withRouter from 'app/views/navigation/withRouter'

class TransactionsViewSingleScreen extends React.Component {

    state = {
        focused_transaction_loaded: false,
    }

    focused_transaction = null

    componentDidMount = () => {
        _Transaction.getOne({ ref_code: this.props.params.ref_code })
            .then(transaction => {
                this.focused_transaction = new _Transaction(transaction)
                this.setState({ focused_transaction_loaded: true, })
            })
            .catch(e => {
                _Notification.flash({ message: e.message, duration: 5000 });
                if (e.request && e.request._status == 404) { this.setState({ single_item_not_found: true }) }
            })
    }

    render() {

        const load_condition = this.state.focused_transaction_loaded
        const asset = load_condition ? this.props.datalists.active_assets[this.focused_transaction.asset_code] : null
        const debit = load_condition && this.focused_transaction.sender_username == this.props.auth_user.username

        if (this.state.single_item_not_found)
            return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
                <div className="container-xl py-5">
                    <div className="d-flex align-items-center justify-content-center">
                        <div className="text-center">
                            <h1 className="display-1 fw-bold">404</h1>
                            <p className="fs-3"> <span className="text-danger">Opps!</span> Page not found.</p>
                            <p className="lead">
                                The page you’re looking for doesn’t exist.
                            </p>
                        </div>
                    </div>
                </div>
            </this.props.PageWrapper>

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-xl py-3">
                <div className="row">
                    <div className="col-lg-2">
                        <SideBar nav_menus={this.props.nav_menus.filter(menu => menu.slug === 'funds_menu')} />
                    </div>
                    <div className="col-lg-10">
                        {load_condition ? <>
                            <div className="row">
                                <div className="col">
                                    <h5>Ref code: {this.focused_transaction.ref_code}</h5>
                                    <br />
                                    <p>Datetime: {window.ucfirst(this.focused_transaction.transfer_datetime.prettyDatetime())}</p>
                                    <p>Asset name: {asset.name}</p>
                                    <p>Asset value: {window.assetValueString(this.focused_transaction.asset_value, asset)}</p>
                                    <p>Total balance after transaction: {this.focused_transaction._status === 'completed' ? window.assetValueString(this.focused_transaction.transfer_result.find(tr => tr.user_username == this.props.auth_user.username).new_total_balance_asset_value, asset) : <span className={"text-" + (this.focused_transaction._status === 'pending' ? "warning" : "danger")}>Transfer {this.focused_transaction._status}</span>}</p>
                                    <p>Transaction note: {debit ? this.focused_transaction.sender_note : this.focused_transaction.recipient_note}</p>
                                    {this.focused_transaction._status_note && <p>Failure note: {this.focused_transaction._status_note}</p>}
                                    <p>Status: {this.focused_transaction._status}</p>
                                    <p>Transaction type: {debit ? 'Debit' : 'Credit'}</p>
                                    {(!debit && this.focused_transaction.sender_bc_address) && <p>Sender address: {this.focused_transaction.sender_bc_address}</p>}
                                    {(debit && this.focused_transaction.recipient_bc_address) && <p>Recipient address: {this.focused_transaction.recipient_bc_address}</p>}
                                    {(!debit && this.focused_transaction.sender_username && !['busops', 'reserves'].includes(this.focused_transaction.sender_username)) && <p>Sender username: {this.focused_transaction.sender_username}</p>}
                                    {(debit && this.focused_transaction.recipient_username && !['busops', 'reserves'].includes(this.focused_transaction.recipient_username)) && <p>Recipient username: {this.focused_transaction.recipient_username}</p>}
                                    {this.focused_transaction.bc_txn_id && <p>Transaction hash: <a href={asset.bc_txn_id_scan_url.replace('{bc_txn_id}', this.focused_transaction.bc_txn_id)} style={{ textDecoration: 'none' }} target='_blank'>{this.focused_transaction.bc_txn_id}</a></p>}
                                </div>
                            </div>
                        </> :
                            <div style={{ alignItems: 'center', padding: 40 }} className='d-grid'>
                                <div className="spinner-grow text-danger" style={{ justifySelf: 'center', width: 50, height: 50 }}></div>
                            </div>
                        }
                    </div>
                </div>
            </div>
        </this.props.PageWrapper>
    }
}

const mapStateToProps = (state) => {
    return {
        datalists: state.datalists_data,
        sysconfig_params: state.sysconfig_params_data,
        auth_user: state.auth_user_data ? new _User(state.auth_user_data) : null,
    }
}

export default connect(mapStateToProps)(withRouter(TransactionsViewSingleScreen))