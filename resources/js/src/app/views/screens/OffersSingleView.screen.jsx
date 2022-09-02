import React from "react"
import { connect } from 'react-redux'
import { Link } from 'react-router-dom';
import _ from 'lodash'

import { _User, _Offer, _Notification, _DateTime } from 'app/controller'

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

        btn_proceed_working: false,
        input: { pymt_details: {} },
        errors: [],
    }

    focused_offer = null

    assetToCurrency = (asset_value, key_prefix = '') => {
        const offer_price = this.focused_offer.offer_price
        const platform_charge_asset_factor = this.props.sysconfig_params.platform_charge_asset_factor
        const currency_amount = this.focused_offer.offer_to == 'buy' ? (asset_value * offer_price) / (1 + platform_charge_asset_factor) : (asset_value * offer_price)
        const update_object = {}
        update_object[key_prefix + 'asset_value'] = asset_value
        update_object[key_prefix + 'currency_amount'] = currency_amount
        this.setState(update_object)
    }

    currencyToAsset = (currency_amount, key_prefix = '') => {
        const offer_price = this.focused_offer.offer_price
        const platform_charge_asset_factor = this.props.sysconfig_params.platform_charge_asset_factor
        const asset_value = this.focused_offer.offer_to == 'buy' ? (currency_amount / offer_price) * (1 + platform_charge_asset_factor) : (currency_amount / offer_price)
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
                this.currencyToAsset(this.props.params.currency_amount ?? (offer.offer_to == 'buy' ? offer.min_purchase_amount : offer.offer_price * offer.min_sell_value))
                this.currencyToAsset(offer.offer_to == 'buy' ? offer.min_purchase_amount : offer.offer_price * offer.min_sell_value, 'min_')
                this.currencyToAsset(offer.offer_to == 'buy' ? offer.max_purchase_amount : offer.offer_price * offer.max_sell_value, 'max_')
                this.setState({ focused_offer_loaded: true, input: { pymt_details: offer.pymt_method_slug == 'cash_in_person' || offer.offer_to == 'buy' ? _.cloneDeep(this.props.datalists.active_pymt_methods[offer.pymt_method_slug].details_required) : {} } })
            })
            .catch(e => console.log(e))
    }

    handleSubmit = async () => {
        this.setState({ btn_proceed_working: true })
        const errors = []
        const pymt_details = this.focused_offer.pymt_method_slug == 'cash_in_person' || this.focused_offer.offer_to == 'buy' ? this.state.input.pymt_details : undefined
        this.focused_offer.accept(this.state.currency_amount, pymt_details)
            .then(() => { _Notification.flash({ message: 'Trade initiated.', duration: 2000 }); this.props.navigate('/trades') })
            .catch((error) => {
                errors.push(error.message)
                this.setState({ btn_proceed_working: false, errors })
            })
    }

    render() {

        const cond = this.state.focused_offer_loaded
        const pymt_method = cond ? this.props.datalists.active_pymt_methods[this.focused_offer.pymt_method_slug] : null
        const asset = cond ? this.props.datalists.active_assets[this.focused_offer.asset_code] : null
        const currency = cond ? this.props.datalists.active_currencies[this.focused_offer.currency_code] : null

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container py-4">
                {this.state.focused_offer_loaded ? <>
                    <div className="row">
                        <div className="col">
                            <p>Asset you'll sell: {asset.name} ({asset.code})</p>
                            {this.props.auth_user !== null && <p>Your current {asset.code} balance: {window.assetValueString((this.props.auth_user.asset_accounts.find(aacc => aacc.asset_code == asset.code) ?? { asset_value: 0 }).asset_value, asset)}</p>}
                            <p>Currency : {currency.name} ({currency.code}) </p>
                            <p>{this.focused_offer.offer_to == 'buy' ? 'Purchase' : 'Sell'} price : {window.currencyAmountString(this.focused_offer.offer_price, currency)}</p>
                            {this.focused_offer.offer_to == 'buy' && <p>Purchase limits : {window.currencyAmountString(this.focused_offer.min_purchase_amount, currency)} - {window.currencyAmountString(this.focused_offer.max_purchase_amount, currency)}</p>}
                            {this.focused_offer.offer_to == 'sell' && <p>Sell limits : {window.assetValueString(this.focused_offer.min_sell_value, asset)} - {window.assetValueString(this.focused_offer.max_sell_value, asset)}</p>}
                            <p>Payment Method: {pymt_method.name}</p>
                        </div>
                    </div>

                    <form className="" onSubmit={e => { e.preventDefault(); this.handleSubmit() }}>
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
                                                max={parseFloat(window.assetValueString(Math.min(this.state.max_asset_value, (this.props.auth_user ? (this.props.auth_user.asset_accounts.find(aacc => aacc.asset_code == asset.code) ?? { asset_value: 0 }).asset_value : this.state.max_asset_value)), asset, false))}
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
                                        {this.focused_offer.offer_to == 'buy' && <div className="form-text">= &#123;<b>purchase_amount</b>&#125; * ( <b>1</b> + &#123;<b>a {this.props.sysconfig_params.platform_charge_asset_factor} platform_fee</b>&#125; ) / &#123;<b>price</b>&#125;</div>}
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
                                        {this.focused_offer.offer_to == 'buy' && <div className="form-text">= &#123;<b>asset_value</b>&#125; * &#123;<b>price</b>&#125; / ( <b>1</b> + &#123;<b>a {this.props.sysconfig_params.platform_charge_asset_factor} platform_fee</b>&#125; )</div>}
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

                        {this.props.auth_user == null && <Link className="btn btn-primary" to={('/signin?rdr=/offers/' + this.props.params.ref_code + '/' + this.state.currency_amount)}>
                            {this.state.btn_proceed_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Proceed to {this.focused_offer.offer_to == 'buy' ? 'Sell' : 'Buy'} {this.focused_offer.asset_code}</>}
                        </Link>}
                        {this.props.auth_user != null && <button className="btn btn-primary" disabled={this.state.btn_proceed_working} type="submit" >
                            {this.state.btn_proceed_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Proceed to {this.focused_offer.offer_to == 'buy' ? 'Sell' : 'Buy'} {this.focused_offer.asset_code}</>}
                        </button>}

                    </form>
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