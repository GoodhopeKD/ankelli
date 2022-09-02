import React from "react"
import { connect } from 'react-redux'

import { _User, _Trade, _Notification, _DateTime } from 'app/controller'
import withRouter from 'app/views/navigation/withRouter'

class TradesSingleViewScreen extends React.Component {

    state = {
        focused_trade_loaded: false,
        input: {},
        errors: [],
    }

    focused_trade = null

    handleInputChange(field = 'field.deep_field', value, use_raw = false) {
        const input = this.state.input
        const fields = field.split('.')
        const val = use_raw ? value : new _Input(value)
        if (fields.length === 1) {
            input[fields] = val
        } else {
            input[fields[0]][fields[1]] = val
        }
        this.setState({ input })
    }

    componentDidMount = () => {
        _Trade.getOne({ ref_code: this.props.params.ref_code })
            .then(trade => {
                this.focused_trade = new _Trade(trade)
                this.setState({ focused_trade_loaded: true, input: { pymt_details: trade.pymt_details } })
            })
            .catch(e => console.log(e))
    }

    render() {

        const cond = this.state.focused_trade_loaded
        const pymt_method = cond ? this.props.datalists.active_pymt_methods[this.focused_trade.pymt_method_slug] : null
        const asset = cond ? this.props.datalists.active_assets[this.focused_trade.asset_code] : null
        const currency = cond ? this.props.datalists.active_currencies[this.focused_trade.currency_code] : null

        // User is seller
        const auth_user_is_buyer = cond && ((this.focused_trade.was_offer_to == 'sell' && this.focused_trade.creator_username == this.props.auth_user.username) || (this.focused_trade.was_offer_to == 'buy' && this.focused_trade.offer_creator_username == this.props.auth_user.username))
        const auth_user_is_seller = cond && ((this.focused_trade.was_offer_to == 'buy' && this.focused_trade.creator_username == this.props.auth_user.username) || (this.focused_trade.was_offer_to == 'sell' && this.focused_trade.offer_creator_username == this.props.auth_user.username))

        var btn_class = 'success'
        if (cond)
            switch (this.focused_trade._status) {
                case 'active': btn_class = 'primary'; break;
                case 'flagged': btn_class = 'warning'; break;
                case 'cancelled': btn_class = 'danger'; break;
                case 'completed': btn_class = 'success'; break;
            }

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container py-4">
                {this.state.focused_trade_loaded ? <>
                    <div className="col-4">
                        <div className="card mb-3">
                            <div className="card-header">
                                Trade Details
                            </div>
                            <div className="card-body">
                                <div className="progress mb-3">
                                    <div className={"progress-bar bg-" + btn_class + " w-" + this.focused_trade.progress} role="progressbar" aria-valuenow={this.focused_trade.progress} aria-valuemin="0" aria-valuemax="100">{this.focused_trade.progress}%</div>
                                </div>
                                <p>Status: {window.ucfirst(this.focused_trade._status)}</p>
                                <p>{this.focused_trade.was_offer_to == 'buy' && <>Purchase</>} {this.focused_trade.was_offer_to == 'sell' && <>Sale</>} amount: {window.currencyAmountString(this.focused_trade.currency_amount, currency)} ({currency.code})</p>
                                <p>
                                    <>Asset value on sale: {window.assetValueString((1 - this.focused_trade.platform_charge_asset_factor) * this.focused_trade.asset_value, asset)} </>
                                    (@ {window.currencyAmountString(this.focused_trade.offer_price, currency)})
                                </p>
                                {this.focused_trade._status !== 'completed' && <>
                                    <p>{pymt_method.name} <img src={pymt_method.icon.uri} alt={pymt_method.name + " icon"} width="24" height="24" className="mx-2" /> payment details:</p>
                                    {Object.keys(this.state.input.pymt_details).map((detail_key, index) => {
                                        return <div key={index} className="input-group mb-3">
                                            <div className="form-floating">
                                                <input type="password" className="form-control roundd-3" id={'input_pymt_method_detail_' + detail_key}
                                                    required
                                                    disabled
                                                    value={this.state.input.pymt_details[detail_key]}
                                                    onChange={e => this.handleInputChange('pymt_details.' + detail_key, e.target.value, true)}
                                                />
                                                <label htmlFor={'input_pymt_method_detail_' + detail_key} className="form-label">{detail_key.replace(/_/g, " ").capitalize()}</label>
                                            </div>
                                            <button type="button" className="btn btn-sm btn-outline-secondary" onClick={() => document.getElementById('input_pymt_method_detail_' + detail_key).setAttribute('type', document.getElementById('input_pymt_method_detail_' + detail_key).getAttribute('type') == 'text' ? 'password' : 'text')}>
                                                V/H
                                            </button>
                                        </div>
                                    })}
                                </>}
                                {this.focused_trade._status == 'completed' && <div>Payment method: {pymt_method.name} <img src={pymt_method.icon.uri} alt={pymt_method.name + " icon"} width="24" height="24" className="mx-2" /></div>}
                            </div>
                        </div>
                        <div className="card mb-3">
                            <div className="card-header">
                                Trade Actions
                            </div>
                            <div className="card-body">
                                {auth_user_is_buyer && this.focused_trade.pymt_declared_datetime == null && <>
                                    <p>As the buyer, when you have processed the payment, you should declare it with the button below</p>
                                    <button className="w-100 mb-2 btn rounded-3 btn-primary" disabled={this.state.btn_declare_pymt_working}
                                        onClick={() => { this.setState({ btn_declare_pymt_working: true }, () => this.focused_trade.declarePymt().catch(e => console.log(e)).finally(() => this.setState({ btn_declare_pymt_working: false }, () => _Notification.flash({ message: 'Payment declared', duration: 2000 })))) }} >
                                        {this.state.btn_declare_pymt_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Declare payment</>}
                                    </button>
                                </>}

                                {auth_user_is_seller && this.focused_trade.pymt_confirmed_datetime == null && <>
                                    <p>As the seller, when the payment has been processed, you should confirm it with the button below</p>
                                    <button className="w-100 mb-2 btn rounded-3 btn-success" disabled={this.state.btn_confirm_pymt_working}
                                        onClick={() => { this.setState({ btn_confirm_pymt_working: true }, () => this.focused_trade.confirmPymt().catch(e => console.log(e)).finally(() => this.setState({ btn_confirm_pymt_working: false }, () => _Notification.flash({ message: 'Payment confirmed', duration: 2000 })))) }}  >
                                        {this.state.btn_confirm_pymt_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Confirm payment</>}
                                    </button>
                                    <button className="w-100 mb-2 btn rounded-3 btn-danger" disabled={this.state.btn_flag_trade_working}
                                        onClick={() => { this.setState({ btn_flag_trade_working: true }, () => this.focused_trade.flag().catch(e => console.log(e)).finally(() => this.setState({ btn_flag_trade_working: false }, () => _Notification.flash({ message: 'Trade flagged', duration: 2000 })))) }}  >
                                        {this.state.btn_flag_trade_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Flag trade</>}
                                    </button>
                                </>}

                                {auth_user_is_seller && this.focused_trade._status == 'flagged' && <>
                                    <button className="w-100 mb-2 btn rounded-3 btn-primary" disabled={this.state.btn_flag_trade_working}
                                        onClick={() => { this.setState({ btn_flag_trade_working: true }, () => this.focused_trade.unFlag().catch(e => console.log(e)).finally(() => this.setState({ btn_flag_trade_working: false }, () => _Notification.flash({ message: 'Trade unflagged', duration: 2000 })))) }}  >
                                        {this.state.btn_flag_trade_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Unflag trade</>}
                                    </button>
                                </>}

                                {this.focused_trade.visible_to_creator && this.focused_trade.creator_username == this.props.auth_user.username && this.focused_trade._status == 'completed' && <>
                                    <button className="w-100 mb-2 btn rounded-3 btn-warning" disabled={this.state.btn_set_creator_visibility_working}
                                        onClick={() => { this.setState({ btn_set_creator_visibility_working: true }, () => this.focused_trade.creatorHide().catch(e => console.log(e)).finally(() => this.setState({ btn_set_creator_visibility_working: false }, () => { _Notification.flash({ message: 'Trade hidden', duration: 2000 }); this.props.navigate(-1) }))) }} >
                                        {this.state.btn_set_creator_visibility_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Hide</>}
                                    </button>
                                </>}

                                {this.focused_trade.visible_to_offer_creator && this.focused_trade.offer_creator_username == this.props.auth_user.username && this.focused_trade._status == 'completed' && <>
                                    <button className="w-100 mb-2 btn rounded-3 btn-warning" disabled={this.state.btn_set_offer_creator_visibility_working}
                                        onClick={() => { this.setState({ btn_set_offer_creator_visibility_working: true }, () => this.focused_trade.offerCreatorHide().catch(e => console.log(e)).finally(() => this.setState({ btn_set_offer_creator_visibility_working: false }, () => { _Notification.flash({ message: 'Trade hidden', duration: 2000 }); this.props.navigate(-1) }))) }} >
                                        {this.state.btn_set_offer_creator_visibility_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Hide</>}
                                    </button>
                                </>}
                            </div>
                        </div>
                    </div>
                    <div className="col-8"></div>
                </> :
                    <div style={{ alignItems: 'center', padding: 40 }} className='d-grid'>
                        <div className="spinner-grow text-danger" style={{ justifySelf: 'center', width: 50, height: 50 }}></div>
                    </div>
                }
            </div>
        </this.props.PageWrapper >
    }
}

const mapStateToProps = (state) => {
    return {
        datalists: state.datalists_data,
        sysconfig_params: state.sysconfig_params_data,
        auth_user: state.auth_user_data ? new _User(state.auth_user_data, ['asset_accounts']) : null,
    }
}

export default connect(mapStateToProps)(withRouter(TradesSingleViewScreen))