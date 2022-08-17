import React from "react"
import { connect } from 'react-redux'
import { useParams, useNavigate, Link } from 'react-router-dom';

import { _User, _Offer, _Notification, _DateTime } from 'app/controller'

function withRouter(Child) {
    return (props) => {
        return <Child {...props} params={useParams()} navigate={useNavigate()} />;
    }
}

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
        errors: [],
    }

    focused_offer = null

    assetToCurrency = (asset_value, key_prefix = '') => {
        const offer_price = this.focused_offer.offer_to == 'buy' ? this.focused_offer.asset_purchase_price : this.focused_offer.asset_sell_price
        const platform_charge_asset_factor = this.props.sysconfig_params.platform_charge_asset_factor
        const currency_amount = (asset_value * offer_price) / (1 + platform_charge_asset_factor)
        const update_object = {}
        update_object[key_prefix + 'asset_value'] = asset_value
        update_object[key_prefix + 'currency_amount'] = currency_amount
        this.setState(update_object)
    }

    currencyToAsset = (currency_amount, key_prefix = '') => {
        const offer_price = this.focused_offer.offer_to == 'buy' ? this.focused_offer.asset_purchase_price : this.focused_offer.asset_sell_price
        const platform_charge_asset_factor = this.props.sysconfig_params.platform_charge_asset_factor
        const asset_value = (currency_amount / offer_price) * (1 + platform_charge_asset_factor)
        const update_object = {}
        update_object[key_prefix + 'asset_value'] = asset_value
        update_object[key_prefix + 'currency_amount'] = currency_amount
        this.setState(update_object)
    }

    componentDidMount = () => {
        _Offer.getOne({ ref_code: this.props.params.ref_code })
            .then(offer => {
                this.focused_offer = new _Offer(offer)
                this.currencyToAsset(this.props.params.currency_amount ?? (offer.offer_to == 'buy' ? offer.min_purchase_amount : offer.asset_sell_price * offer.min_sell_value))
                this.currencyToAsset(offer.offer_to == 'buy' ? offer.min_purchase_amount : offer.asset_sell_price * offer.min_sell_value, 'min_')
                this.currencyToAsset(offer.offer_to == 'buy' ? offer.max_purchase_amount : offer.asset_sell_price * offer.max_sell_value, 'max_')
                this.setState({ focused_offer_loaded: true })
            })
            .catch(e => console.log(e))
    }

    render() {

        const cond = this.state.focused_offer_loaded
        const pymt_method = cond ? this.props.datalists.active_pymt_methods[this.focused_offer.pymt_method_slug] : null
        const asset = cond ? this.props.datalists.active_assets[this.focused_offer.asset_code] : null
        const currency = cond ? this.props.datalists.active_currencies[this.focused_offer.currency_code] : null

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container py-3">
                {this.state.focused_offer_loaded ? <>
                    <div className="row">
                        <div className="col">
                            <p>Asset you'll sell: {asset.name} ({asset.code})</p>
                            {this.props.auth_user !== null && <p>Your current {asset.code} balance: {window.assetValueString((this.props.auth_user.asset_accounts.find(aacc => aacc.asset_code == asset.code) ?? { asset_value: 0 }).asset_value, asset)}</p>}
                            <p>Currency : {currency.name} ({currency.code}) </p>
                            <p>Price : {window.currencyAmountString(this.focused_offer.asset_purchase_price, currency)}</p>
                            <p>Limits : {window.currencyAmountString(this.focused_offer.min_purchase_amount, currency)} - {window.currencyAmountString(this.focused_offer.max_purchase_amount, currency)}</p>
                            <p>Payment Method: {pymt_method.name}</p>
                        </div>
                    </div>

                    <div className="card mb-3">
                        <div className="card-header">
                            Calculator
                        </div>
                        <div className="card-body">
                            <div className="row">
                                <div className="col-lg-6">
                                    <label htmlFor="input_asset_value" className="form-label">Value of asset you'll sell</label>
                                    <div className="input-group mb-2">
                                        <input
                                            type="number" className="form-control" id="input_asset_value"
                                            min={parseFloat(window.assetValueString(this.state.min_asset_value, asset, false))}
                                            max={parseFloat(window.assetValueString(Math.min(this.state.max_asset_value, (this.props.auth_user ? (this.props.auth_user.asset_accounts.find(aacc => aacc.asset_code == asset.code) ?? { asset_value: 0 }).asset_value : this.state.max_asset_value)), asset, false))}
                                            step={asset.smallest_display_unit}
                                            value={parseFloat(window.assetValueString(this.state.asset_value, asset, false))}
                                            onChange={el => this.assetToCurrency(el.target.value)}
                                        />
                                        <span className="input-group-text">{asset.code}</span>
                                    </div>
                                    <div className="form-text">= &#123;<b>purchase_amount</b>&#125; * ( <b>1</b> + &#123;<b>a {this.props.sysconfig_params.platform_charge_asset_factor} platform_fee</b>&#125; ) / &#123;<b>price</b>&#125;</div>
                                </div>
                                <div className="col-lg-6">
                                    <label htmlFor="input_currency_amount" className="form-label">Amount you'll receive</label>
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
                                    <div className="form-text">= &#123;<b>asset_value</b>&#125; * &#123;<b>price</b>&#125; / ( <b>1</b> + &#123;<b>a {this.props.sysconfig_params.platform_charge_asset_factor} platform_fee</b>&#125; )</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="mb-3">
                        {this.state.errors.map((error, key) => (
                            <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                        ))}
                    </div>

                    <Link
                        className="btn btn-primary"
                        to={(this.props.auth_user ? '/#' : '/signin?rdr=/offers/' + this.props.params.ref_code + '/' + this.state.currency_amount)}
                        onClick={e => {
                            if (this.props.auth_user) {
                                e.preventDefault();
                                this.setState({ btn_proceed_working: true })
                                const errors = []
                                this.focused_offer.accept(this.state.currency_amount)
                                    .then(() => { _Notification.flash({ message: 'Trade initiated.', duration: 2000 }); this.props.navigate('/trades') })
                                    .catch((error) => {
                                        errors.push(error.message)
                                        this.setState({ btn_proceed_working: false, errors })
                                    })
                            }
                        }}
                    >
                        {this.state.btn_proceed_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Proceed to {this.focused_offer.offer_to == 'buy' ? 'Sell' : 'Buy'} {this.focused_offer.asset_code}</>}
                    </Link>
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