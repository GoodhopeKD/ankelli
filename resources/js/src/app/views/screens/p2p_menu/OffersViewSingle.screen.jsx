import React from "react"
import { connect } from 'react-redux'
import { Link } from 'react-router-dom';
import _ from 'lodash'

import { _User, _Offer, _Notification, _DateTime, _Session, _Input } from 'app/controller'

import withRouter from 'app/views/navigation/withRouter'

class OffersViewSingleScreen extends React.Component {

    state = {
        focused_offer_loaded: false,
        asset_value: 0,
        currency_amount: 0,

        min_asset_value: 0,
        max_asset_value: 0,

        min_currency_amount: 0,
        max_currency_amount: 0,

        input: {
            sender_password: new _Input('Def-Pass#123'),
            pymt_details: {}
        },
        errors: [],
    }

    focused_offer = null

    assetToCurrency = (asset_value, key_prefix = '') => {
        const offer_price = this.focused_offer.offer_price
        const trade_txn_fee_fctr = this.props.sysconfig_params.trade_txn_fee_fctr
        const currency_amount = this.focused_offer.offer_to == 'buy' ? (asset_value * offer_price) / (1 + trade_txn_fee_fctr) : (asset_value * offer_price)
        const update_object = {}
        update_object[key_prefix + 'asset_value'] = asset_value
        update_object[key_prefix + 'currency_amount'] = currency_amount
        this.setState(update_object)
    }

    currencyToAsset = (currency_amount, key_prefix = '') => {
        const offer_price = this.focused_offer.offer_price
        const trade_txn_fee_fctr = this.props.sysconfig_params.trade_txn_fee_fctr
        const asset_value = this.focused_offer.offer_to == 'buy' ? (currency_amount / offer_price) * (1 + trade_txn_fee_fctr) : (currency_amount / offer_price)
        const update_object = {}
        update_object[key_prefix + 'asset_value'] = asset_value
        update_object[key_prefix + 'currency_amount'] = currency_amount
        this.setState(update_object)
    }

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
        _Offer.getOne({ ref_code: this.props.params.ref_code })
            .then(offer => {
                this.focused_offer = new _Offer(offer)
                this.currencyToAsset(this.props.params.currency_amount ?? (offer.offer_to == 'buy' ? offer.min_trade_purchase_amount : offer.offer_price * offer.min_trade_sell_value))
                this.currencyToAsset(offer.offer_to == 'buy' ? offer.min_trade_purchase_amount : offer.offer_price * offer.min_trade_sell_value, 'min_')
                this.currencyToAsset(offer.offer_to == 'buy' ? offer.max_trade_purchase_amount : offer.offer_price * offer.max_trade_sell_value, 'max_')
                const returnObj = (arr) => { const obj = {}; arr.forEach(arr_i => obj[arr_i] = ''); return obj; }
                this.setState({
                    focused_offer_loaded: true,
                    input: { sender_password: new _Input('Def-Pass#123'), pymt_details: offer.offer_to == 'buy' ? returnObj(this.props.datalists.active_pymt_methods[offer.pymt_method_slug].details_required) : {} }
                })
            })
            .catch(e => {
                _Notification.flash({ message: e.message, duration: 5000 });
                if (e.request && e.request._status == 404) { this.setState({ single_item_not_found: true }) }
            })
            .finally(() => _Session.refresh())
    }

    handleSubmit = async () => {
        if (this.focused_offer.offer_to == 'sell') this.setState({ btn_proceed_working: true })
        const errors = []
        const input = {}
        input.pymt_details = this.focused_offer.offer_to == 'buy' ? this.state.input.pymt_details : undefined
        if (errors.length === 0) {
            this.setState({ errors, sender_password_prompt_open: true }) // Remove input error indicators under text inputs            
            if (this.focused_offer.offer_to == 'buy') {
                bootstrap.Modal.getOrCreateInstance(document.getElementById('password_confirmation_modal')).show();
            } else {
                this.handleSubmit2()
            }
        } else {
            if (!input.pymt_details) input.pymt_details = {}
            this.setState({ btn_proceed_working: false, errors, input })
        }
    }

    handleSubmit2 = async () => {
        this.setState({ btn_proceed_working: true })
        const errors = []
        const input = {}
        input.pymt_details = this.focused_offer.offer_to == 'buy' ? this.state.input.pymt_details : undefined
        input.sender_password = this.focused_offer.offer_to == 'buy' ? this.state.input.sender_password : undefined
        if (input.sender_password) {
            if (!input.sender_password.isValid('password')) { errors.push("Invalid password") }
        }
        if (errors.length === 0) {
            this.setState({ errors, input }) // Reload input error/success indicators on text/password/number inputs 
            const _input = _Input.flatten(input)
            const password_confirmation_modal = this.focused_offer.offer_to == 'buy' ? bootstrap.Modal.getOrCreateInstance(document.getElementById('password_confirmation_modal')) : null;
            this.focused_offer.accept({ currency_amount: this.state.currency_amount, pymt_details: _input.pymt_details, sender_password: _input.sender_password })
                .then(resp => { if (password_confirmation_modal) { password_confirmation_modal.hide(); } _Notification.flash({ message: 'Trade initialized.', duration: 2000 }); this.props.navigate('/p2p/trades/' + resp.ref_code) })
                .catch((error) => {
                    if (error.request && error.request._response && error.request._response.errors && Object.keys(error.request._response.errors).length) {
                        Object.keys(error.request._response.errors).forEach(input_key => { error.request._response.errors[input_key].forEach(input_key_error => { errors.push(input_key_error) }) })
                    } else { errors.push(error.message) }
                    this.setState({ btn_proceed_working: false, errors })
                })
        } else {
            if (!input.pymt_details) input.pymt_details = {}
            if (!input.sender_password) input.sender_password = new _Input()
            this.setState({ btn_proceed_working: false, errors, input })
        }
    }

    render() {

        const load_condition = this.state.focused_offer_loaded
        const pymt_method = load_condition ? this.props.datalists.active_pymt_methods[this.focused_offer.pymt_method_slug] : null
        const asset = load_condition ? this.props.datalists.active_assets[this.focused_offer.asset_code] : null
        const currency = load_condition ? this.props.datalists.active_currencies[this.focused_offer.currency_code] : null

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

        const offer_created_by_auth_user = load_condition && window.isset(this.props.auth_user) && this.focused_offer.creator_username == this.props.auth_user.username

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-xl py-4 ">
                <div className="d-flex justify-content-center">
                    <div className="col-lg-8">
                        {load_condition ? <>

                            {offer_created_by_auth_user && <div>
                                <div class="alert alert-info" role="alert">
                                    <h4 class="alert-heading">Note!</h4>
                                    <hr />
                                    <p class="mb-0">You're the one who posted this offer, so this is only a preview of what others see when they click on it.</p>
                                </div>
                            </div>}

                            <div>
                                <p>Asset you'll sell: {asset.name} ({asset.code})</p>
                                {window.isset(this.props.auth_user) && <p>Your usable {asset.code} balance: {window.assetValueString((this.props.auth_user.asset_wallets.find(aacc => aacc.asset_code == asset.code) ?? { usable_balance_asset_value: 0 }).usable_balance_asset_value, asset)}</p>}
                                <p>Currency : {currency.name} ({currency.code}) </p>
                                <p>Offer price : {window.currencyAmountString(this.focused_offer.offer_price, currency)}</p>
                                {this.focused_offer.offer_to == 'buy' && <p>Purchase limits per trade : {window.currencyAmountString(this.focused_offer.min_trade_purchase_amount, currency)} - {window.currencyAmountString(this.focused_offer.max_trade_purchase_amount, currency)}</p>}
                                {this.focused_offer.offer_to == 'sell' && <p>Sale limits per trade : {window.assetValueString(this.focused_offer.min_trade_sell_value, asset)} - {window.assetValueString(this.focused_offer.max_trade_sell_value, asset)}</p>}
                                {this.focused_offer.offer_to == 'buy' && <p>Buyer indicated they'll process transaction in <b>{this.focused_offer.buyer_cmplt_trade_mins_tmt}</b> minutes</p>}
                                {this.focused_offer.offer_to == 'sell' && <p>Seller requests you to process transaction in <b>{this.focused_offer.buyer_cmplt_trade_mins_tmt}</b> minutes</p>}
                                <p>Payment Method: {pymt_method.name}</p>
                            </div>

                            <form onSubmit={e => { e.preventDefault(); this.handleSubmit() }}>
                                <div className="card mb-3">
                                    <div className="card-header">
                                        Calculator
                                    </div>
                                    <div className="card-body">
                                        {this.focused_offer.offer_to == 'buy' && <p>Trade transaction fee factor is set at <b>{this.props.sysconfig_params.trade_txn_fee_fctr}</b></p>}
                                        <div className="row">
                                            <div className="col-lg-6">
                                                <label htmlFor="input_currency_amount" className="form-label">Amount you'll {this.focused_offer.offer_to == 'buy' ? 'receive' : 'pay'}</label>
                                                <div className="input-group mb-2">
                                                    {currency.symbol_before_number && <span className="input-group-text">{currency.symbol}</span>}
                                                    <input
                                                        type="number" className="form-control" id="input_currency_amount"
                                                        min={window.currencyAmountInput(this.state.min_currency_amount)}
                                                        max={window.currencyAmountInput(this.state.max_currency_amount)}
                                                        step={this.focused_offer.pymt_method_slug == 'cash_in_person' ? currency.smallest_transactable_cash_denomination_amount : 1}
                                                        value={this.state.currency_amount}
                                                        onChange={elem => this.currencyToAsset(elem.target.value)}
                                                    />
                                                    {!currency.symbol_before_number && <span className="input-group-text">{currency.symbol}</span>}
                                                </div>
                                                {this.focused_offer.offer_to == 'buy' && <div className="form-text">= $asset_value * $offer_price / (1 + $trade_txn_fee_factor)</div>}
                                                {this.focused_offer.offer_to == 'sell' && <div className="form-text">= $asset_value * $offer_price</div>}
                                            </div>
                                            <div className="col-lg-6">
                                                <label htmlFor="input_asset_value" className="form-label">Value of asset you'll {this.focused_offer.offer_to == 'buy' ? 'release' : 'get'}</label>
                                                <div className="input-group mb-2">
                                                    <input
                                                        disabled
                                                        type="number" className="form-control" id="input_asset_value"
                                                        min={window.assetValueInput(this.state.min_asset_value, asset)}
                                                        max={window.assetValueInput(this.focused_offer.offer_to == 'sell' ? this.state.max_asset_value : Math.min(this.state.max_asset_value, (this.props.auth_user ? (this.props.auth_user.asset_wallets.find(aacc => aacc.asset_code == asset.code) ?? { usable_balance_asset_value: 0 }).usable_balance_asset_value : this.state.max_asset_value)), asset)}
                                                        step={asset.smallest_display_unit}
                                                        value={window.assetValueInput(this.state.asset_value, asset)}
                                                        onChange={elem => this.assetToCurrency(elem.target.value)}
                                                    />
                                                    <span className="input-group-text">{asset.code}</span>
                                                </div>
                                                {this.focused_offer.offer_to == 'buy' && <div className="form-text">= $amount * (1 + $trade_txn_fee_factor) / $offer_price</div>}
                                                {this.focused_offer.offer_to == 'sell' && <div className="form-text">= $amount / $offer_price</div>}
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                {(this.focused_offer.offer_to == 'buy') && <>
                                    <div className="card mb-3">
                                        <div className="card-header">
                                            {pymt_method.name} <img src={pymt_method.icon.uri} alt={pymt_method.name + " icon"} width="24" height="24" className="mx-2" /> Recepient details
                                        </div>
                                        <div className="card-body py-0">
                                            {Object.keys(this.state.input.pymt_details).map((detail_key, index) => {
                                                return <div key={index} className="form-floating my-3">
                                                    <input type="text" className="form-control" id={'input_pymt_method_detail_' + detail_key}
                                                        required
                                                        value={this.state.input.pymt_details[detail_key]}
                                                        onChange={elem => this.handleInputChange('pymt_details.' + detail_key, elem.target.value, true)}
                                                    />
                                                    <label htmlFor={'input_pymt_method_detail_' + detail_key} className="form-label">{detail_key.replace(/_/g, " ").capitalize()}</label>
                                                </div>
                                            })}
                                        </div>
                                        <div className="card-footer">
                                            <span className="text-muted">Verify that you've entered the correct details here.</span>
                                        </div>
                                    </div>
                                </>}

                                <div className="mb-3">
                                    {this.state.errors.map((error, key) => (
                                        <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                                    ))}
                                </div>

                                <button className="btn btn-primary" disabled={this.state.btn_proceed_working || offer_created_by_auth_user} type={!window.isset(this.props.auth_user) ? "button" : "submit"} data-bs-toggle={!window.isset(this.props.auth_user) ? "modal" : undefined} data-bs-target={!window.isset(this.props.auth_user) ? "#signin_modal" : undefined} >
                                    {this.state.btn_proceed_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Proceed to {this.focused_offer.offer_to == 'buy' ? 'Sell' : 'Buy'} {this.focused_offer.asset_code}</>}
                                </button>
                            </form>

                            {this.focused_offer.offer_to == 'buy' &&
                                <div className="modal fade" id="password_confirmation_modal" tabIndex="-1" >
                                    <div className="modal-dialog modal-dialog-centered">
                                        <div className="modal-content">
                                            <div className="modal-header">
                                                <h5 className="modal-title" >Password confirmation</h5>
                                                <button type="button" className="btn-close" data-bs-dismiss="modal"></button>
                                            </div>
                                            <form onSubmit={e => { e.preventDefault(); this.handleSubmit2() }}>
                                                <div className="modal-body">
                                                    <p>{window.assetValueString(this.state.asset_value, asset)} is about to be locked in your account for new trade until it is complete. Enter password to continue.</p>
                                                    <div className="form-floating mb-3">
                                                        <input
                                                            type="password"
                                                            className={"form-control rounded-3" + (this.state.input.sender_password.failedValidation() ? ' is-invalid' : '')}
                                                            id="input_sender_password"
                                                            value={this.state.input.sender_password + ''}
                                                            onChange={elem => this.handleInputChange('sender_password', elem.target.value)}
                                                            required={this.state.sender_password_prompt_open}
                                                            placeholder="Pasword"
                                                        />
                                                        <span className="btn btn-sm" style={{ position: 'absolute', top: 13, right: 2 }} onClick={() => document.getElementById('input_sender_password').setAttribute('type', document.getElementById('input_sender_password').getAttribute('type') == 'text' ? 'password' : 'text')}>𓁹</span>
                                                        <label htmlFor="input_sender_password">Password</label>
                                                    </div>

                                                    <div className="mb-1">
                                                        {this.state.errors.map((error, key) => (
                                                            <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                                                        ))}
                                                    </div>
                                                </div>
                                                <div className="modal-footer justify-content-between">
                                                    <button type="button" className="btn btn-secondary" data-bs-dismiss="modal" >Cancel</button>
                                                    <button type="submit" className="btn btn-primary" disabled={this.state.btn_proceed_working || offer_created_by_auth_user} >
                                                        {this.state.btn_proceed_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Proceed to {this.focused_offer.offer_to == 'buy' ? 'Sell' : 'Buy'} {this.focused_offer.asset_code}</>}
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            }
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
        auth_user: state.auth_user_data ? new _User(state.auth_user_data, ['asset_wallets']) : null,
    }
}

export default connect(mapStateToProps)(withRouter(OffersViewSingleScreen))