import React from "react"
import { connect } from 'react-redux'
import { Link } from 'react-router-dom';
import _ from 'lodash'

import { _User, _Offer, _Notification, _DateTime, _Session, _Input } from 'app/controller'

import withRouter from 'app/views/navigation/withRouter'

class OffersSingleViewScreen extends React.Component {

    state = {
        focused_offer_loaded: false,
        asset_value: 0,
        currency_amount: 0,

        min_asset_value: 0,
        max_asset_value: 0,

        min_currency_amount: 0,
        max_currency_amount: 0,

        input: {
            source_user_password: new _Input('Def-Pass#123'),
            pymt_details: {}
        },
        errors: [],
    }

    focused_offer = null

    assetToCurrency = (asset_value, key_prefix = '') => {
        const offer_price = this.focused_offer.offer_price
        const trade_txn_fee_factor = this.props.sysconfig_params.trade_txn_fee_factor
        const currency_amount = this.focused_offer.offer_to == 'buy' ? (asset_value * offer_price) / (1 + trade_txn_fee_factor) : (asset_value * offer_price)
        const update_object = {}
        update_object[key_prefix + 'asset_value'] = asset_value
        update_object[key_prefix + 'currency_amount'] = currency_amount
        this.setState(update_object)
    }

    currencyToAsset = (currency_amount, key_prefix = '') => {
        const offer_price = this.focused_offer.offer_price
        const trade_txn_fee_factor = this.props.sysconfig_params.trade_txn_fee_factor
        const asset_value = this.focused_offer.offer_to == 'buy' ? (currency_amount / offer_price) * (1 + trade_txn_fee_factor) : (currency_amount / offer_price)
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
                    input: { source_user_password: new _Input('Def-Pass#123'), pymt_details: offer.offer_to == 'buy' ? returnObj(this.props.datalists.active_pymt_methods[offer.pymt_method_slug].details_required) : {} }
                })
            })
            .catch(e => console.log(e))
            .finally(() => _Session.refresh())
    }

    handleSubmit = async () => {
        if (this.focused_offer.offer_to == 'sell') this.setState({ btn_proceed_working: true })
        const errors = []
        const input = {}
        input.pymt_details = this.focused_offer.offer_to == 'buy' ? this.state.input.pymt_details : undefined
        if (errors.length === 0) {
            this.setState({ errors, source_user_password_prompt_open: true }) // Remove input error indicators under text inputs            
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
        input.source_user_password = this.focused_offer.offer_to == 'buy' ? this.state.input.source_user_password : undefined
        if (input.source_user_password) {
            if (!input.source_user_password.isValid('password')) { errors.push("Invalid password") }
        }
        if (errors.length === 0) {
            this.setState({ errors, input }) // Reload input error/success indicators on text/password/number inputs 
            const _input = _Input.flatten(input)
            const password_confirmation_modal = bootstrap.Modal.getOrCreateInstance(document.getElementById('password_confirmation_modal'));
            this.focused_offer.accept({ currency_amount: this.state.currency_amount, pymt_details: _input.pymt_details, source_user_password: _input.source_user_password })
                .then(() => { password_confirmation_modal.hide(); _Notification.flash({ message: 'Trade initiated.', duration: 2000 }); this.props.navigate('/p2p/trades') })
                .catch((error) => {
                    if (error.request && error.request._response && error.request._response.errors && Object.keys(error.request._response.errors).length) {
                        Object.keys(error.request._response.errors).forEach(input_key => { error.request._response.errors[input_key].forEach(input_key_error => { errors.push(input_key_error) }) })
                    } else { errors.push(error.message) }
                    this.setState({ btn_proceed_working: false, errors })
                })
        } else {
            if (!input.pymt_details) input.pymt_details = {}
            if (!input.source_user_password) input.source_user_password = new _Input()
            this.setState({ btn_proceed_working: false, errors, input })
        }
    }

    render() {

        const load_condition = this.state.focused_offer_loaded
        const pymt_method = load_condition ? this.props.datalists.active_pymt_methods[this.focused_offer.pymt_method_slug] : null
        const asset = load_condition ? this.props.datalists.active_assets[this.focused_offer.asset_code] : null
        const currency = load_condition ? this.props.datalists.active_currencies[this.focused_offer.currency_code] : null

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container py-4">
                {load_condition ? <>
                    <div className="row">
                        <div className="col">
                            <p>Asset you'll sell: {asset.name} ({asset.code})</p>
                            {window.isset(this.props.auth_user) && <p>Your current usable {asset.code} balance: {window.assetValueString((this.props.auth_user.asset_accounts.find(aacc => aacc.asset_code == asset.code) ?? { usable_balance_asset_value: 0 }).usable_balance_asset_value, asset)}</p>}
                            <p>Currency : {currency.name} ({currency.code}) </p>
                            <p>{this.focused_offer.offer_to == 'buy' ? 'Purchase' : 'Sell'} price : {window.currencyAmountString(this.focused_offer.offer_price, currency)}</p>
                            {this.focused_offer.offer_to == 'buy' && <p>Purchase limits : {window.currencyAmountString(this.focused_offer.min_trade_purchase_amount, currency)} - {window.currencyAmountString(this.focused_offer.max_trade_purchase_amount, currency)}</p>}
                            {this.focused_offer.offer_to == 'sell' && <p>Sell limits : {window.assetValueString(this.focused_offer.min_trade_sell_value, asset)} - {window.assetValueString(this.focused_offer.max_trade_sell_value, asset)}</p>}
                            <p>Payment Method: {pymt_method.name}</p>
                        </div>
                    </div>

                    <form onSubmit={e => { e.preventDefault(); this.handleSubmit() }}>
                        <div className="card mb-3">
                            <div className="card-header">
                                Calculator
                            </div>
                            <div className="card-body">
                                <div className="row">
                                    <div className="col-lg-6">
                                        <label htmlFor="input_asset_value" className="form-label">Value of asset you'll {this.focused_offer.offer_to == 'buy' ? 'release' : 'get'}</label>
                                        <div className="input-group mb-2">
                                            {this.focused_offer.offer_to == 'buy' && <input
                                                type="number" className="form-control" id="input_asset_value"
                                                min={parseFloat(window.assetValueString(this.state.min_asset_value, asset, false))}
                                                max={parseFloat(window.assetValueString(Math.min(this.state.max_asset_value, (this.props.auth_user ? (this.props.auth_user.asset_accounts.find(aacc => aacc.asset_code == asset.code) ?? { usable_balance_asset_value: 0 }).usable_balance_asset_value : this.state.max_asset_value)), asset, false))}
                                                step={asset.smallest_display_unit}
                                                value={parseFloat(window.assetValueString(this.state.asset_value, asset, false))}
                                                onChange={el => this.assetToCurrency(el.target.value)}
                                            />}
                                            {this.focused_offer.offer_to == 'sell' && <input
                                                type="number" className="form-control" id="input_asset_value"
                                                min={parseFloat(window.assetValueString(this.state.min_asset_value, asset, false))}
                                                max={parseFloat(window.assetValueString(this.state.max_asset_value, asset, false))}
                                                step={asset.smallest_display_unit}
                                                value={parseFloat(window.assetValueString(this.state.asset_value, asset, false))}
                                                onChange={el => this.assetToCurrency(el.target.value)}
                                            />}
                                            <span className="input-group-text">{asset.code}</span>
                                        </div>
                                        {this.focused_offer.offer_to == 'buy' && <div className="form-text">= &#123;<b>purchase_amount</b>&#125; * ( <b>1</b> + &#123;<b>a {this.props.sysconfig_params.trade_txn_fee_factor} platform_fee</b>&#125; ) / &#123;<b>price</b>&#125;</div>}
                                    </div>
                                    <div className="col-lg-6">
                                        <label htmlFor="input_currency_amount" className="form-label">Amount you'll {this.focused_offer.offer_to == 'buy' ? 'receive' : 'pay'}</label>
                                        <div className="input-group mb-2">
                                            {currency.symbol_before_number && <span className="input-group-text">{currency.symbol}</span>}
                                            <input
                                                type="number" className="form-control" id="input_currency_amount"
                                                min={this.state.min_currency_amount}
                                                max={this.state.max_currency_amount}
                                                step={this.focused_offer.pymt_method_slug == 'cash_in_person' ? currency.smallest_transactable_cash_denomination_amount : 1}
                                                value={this.state.currency_amount}
                                                onChange={el => this.currencyToAsset(el.target.value)}
                                            />
                                            {!currency.symbol_before_number && <span className="input-group-text">{currency.symbol}</span>}
                                        </div>
                                        {this.focused_offer.offer_to == 'buy' && <div className="form-text">= &#123;<b>asset_value</b>&#125; * &#123;<b>price</b>&#125; / ( <b>1</b> + &#123;<b>a {this.props.sysconfig_params.trade_txn_fee_factor} platform_fee</b>&#125; )</div>}
                                    </div>
                                </div>
                            </div>
                        </div>

                        {(this.focused_offer.offer_to == 'buy' || this.focused_offer.pymt_method_slug == 'cash_in_person') && <>
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
                                                onChange={e => this.handleInputChange('pymt_details.' + detail_key, e.target.value, true)}
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

                        <button className="btn btn-primary" disabled={this.state.btn_proceed_working} type={this.props.auth_user == null ? "button" : "submit"} data-bs-toggle={this.props.auth_user == null ? "modal" : undefined} data-bs-target={this.props.auth_user == null ? "#signin_modal" : undefined} >
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
                                                    className={"form-control rounded-3" + (this.state.input.source_user_password.failedValidation() ? ' is-invalid' : '')}
                                                    id="input_source_user_password"
                                                    value={this.state.input.source_user_password + ''}
                                                    onChange={e => this.handleInputChange('source_user_password', e.target.value)}
                                                    required={this.state.source_user_password_prompt_open}
                                                    placeholder="Pasword"
                                                />
                                                <span className="btn btn-sm" style={{ position: 'absolute', top: 13, right: 2 }} onClick={() => document.getElementById('input_source_user_password').setAttribute('type', document.getElementById('input_source_user_password').getAttribute('type') == 'text' ? 'password' : 'text')}>𓁹</span>
                                                <label htmlFor="input_source_user_password">Password</label>
                                            </div>

                                            <div className="mb-1">
                                                {this.state.errors.map((error, key) => (
                                                    <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                                                ))}
                                            </div>
                                        </div>
                                        <div className="modal-footer justify-content-between">
                                            <button type="button" className="btn btn-secondary" data-bs-dismiss="modal" >Cancel</button>
                                            <button type="submit" className="btn btn-primary" disabled={this.state.btn_proceed_working} >
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
        </this.props.PageWrapper>
    }
}

const mapStateToProps = (state) => {
    return {
        datalists: state.datalists_data,
        sysconfig_params: state.sysconfig_params_data,
        auth_user: state.auth_user_data ? new _User(state.auth_user_data, ['asset_accounts']) : null,
    }
}

export default connect(mapStateToProps)(withRouter(OffersSingleViewScreen))