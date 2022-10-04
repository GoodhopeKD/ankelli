import React from "react"
import { connect } from 'react-redux'
import _ from 'lodash'

import { _User, _Input, _Notification, _Offer, _Session } from 'app/controller';

import withRouter from 'app/views/navigation/withRouter'
import CustomSelect from 'app/views/components/CustomSelect'

const returnObj = (arr) => { const obj = {}; arr.forEach(arr_i => obj[arr_i] = ''); return obj; }

class OffersCreateNewScreen extends React.Component {

    default_input = {
        offer_to: 'buy',

        country_name: 'Zimbabwe',
        pymt_method_slug: 'cash_in_person',
        pymt_details: returnObj(this.props.datalists.active_pymt_methods['cash_in_person'].details_required),
        location: new _Input(),

        asset_code: 'USDT',
        currency_code: 'USD',
        offer_price: new _Input(200 / 209),

        min_trade_purchase_amount: new _Input(100),
        max_trade_purchase_amount: new _Input(0),
        offer_total_purchase_amount: new _Input(0),

        min_trade_sell_value: new _Input(0),
        max_trade_sell_value: new _Input(0),
        offer_total_sell_value: new _Input(0),

        buyer_cmplt_trade_mins_tmt: new _Input(30),

        note: new _Input(),
    }

    state = {
        input: _.cloneDeep(this.default_input),
        errors: [],
    }

    assetToCurrency = (asset_value) => { return asset_value ? ((asset_value * this.state.input.offer_price) / (1 + this.props.sysconfig_params.trade_txn_fee_fctr)) : 0 }

    currencyToAsset = (currency_amount) => { return currency_amount ? (currency_amount / this.state.input.offer_price) : 0 }

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

    handleSubmit = async () => {
        this.setState({ btn_post_offer_working: true })

        const btn_post_offer_working = false
        const errors = []
        const input = this.state.input

        if (errors.length === 0) {
            this.setState({ errors, input }) // Reload input error/success indicators on text/password/number inputs
            const _input = _Input.flatten(input)

            if (_input.pymt_method_slug != 'cash_in_person') {
                delete _input.location
            }
            if (!(_input.offer_to == 'sell')) {
                delete _input.pymt_details
            }
            if (_input.offer_to != 'buy') {
                delete _input.min_trade_purchase_amount
                delete _input.max_trade_purchase_amount
                delete _input.offer_total_purchase_amount
            }
            if (_input.offer_to != 'sell') {
                delete _input.min_trade_sell_value
                delete _input.max_trade_sell_value
                delete _input.offer_total_sell_value
            }

            _Offer.create(_input).then(resp => { _Notification.flash({ message: 'Offer posted successfully!', duration: 2000 }); this.props.navigate('/p2p/offers/' + resp.ref_code) })
                .catch((error) => {
                    if (error.request && error.request._response && error.request._response.errors && Object.keys(error.request._response.errors).length) {
                        Object.keys(error.request._response.errors).forEach(input_key => { error.request._response.errors[input_key].forEach(input_key_error => { errors.push(input_key_error) }) })
                    } else { errors.push(error.message) }
                    this.setState({ btn_post_offer_working, errors })
                })
        } else {
            this.setState({ btn_post_offer_working, errors, input })
        }
    }

    componentDidMount = () => {
        _Session.refresh()
    }

    render() {
        const country_options = [];
        Object.keys(this.props.datalists.active_countries).forEach(country_name => { country_options.push({ value: country_name, searchable_text: country_name, output_element: () => country_name }) })

        const pymt_method_options = [];
        Object.keys(this.props.datalists.active_pymt_methods).forEach(pymt_method_slug => {
            const pymt_method = this.props.datalists.active_pymt_methods[pymt_method_slug]
            pymt_method_options.push({
                value: pymt_method_slug,
                searchable_text: pymt_method_slug + pymt_method.name + pymt_method.description,
                output_element: () => <><span className="d-inline-block rounded-circle p-1 align-self-center" style={{ backgroundColor: '#' + pymt_method.hex_color }}></span>{pymt_method.name}</>
            })
        })

        const asset_options = [];
        Object.keys(this.props.datalists.active_assets).forEach(asset_code => {
            const asset = this.props.datalists.active_assets[asset_code]
            asset_options.push({
                value: asset_code,
                searchable_text: asset_code + asset.name + asset.description,
                output_element: () => <>{asset.name} <i className="text-primary">{asset_code}</i></>
            })
        })

        const currency_options = [];
        Object.keys(this.props.datalists.active_currencies).forEach(currency_code => {
            const currency = this.props.datalists.active_currencies[currency_code]
            currency_options.push({
                value: currency_code,
                searchable_text: currency_code + currency.name + currency.description,
                output_element: () => <><span className="d-inline-block rounded-circle align-self-center text-success" ><i><b>{currency.symbol}</b></i></span>{currency.name}<i className="text-success">{currency_code}</i></>
            })
        })

        const asset = this.props.datalists.active_assets[this.state.input.asset_code]
        const currency = this.props.datalists.active_currencies[this.state.input.currency_code]
        const pymt_method = this.props.datalists.active_pymt_methods[this.state.input.pymt_method_slug]

        const max_offerable_asset_value = !window.isset(this.props.auth_user) ? null : (1 - this.props.sysconfig_params.trade_txn_fee_fctr) * window.assetValueInput((this.props.auth_user.asset_wallets.find(aacc => aacc.asset_code == asset.code) ?? { usable_balance_asset_value: 0 }).usable_balance_asset_value, asset)

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-xl py-4 ">
                <div className="d-flex justify-content-center">
                    <div className="col-lg-6">

                        {(this.props.sysconfig_params.offer_to_buy_enabled && this.props.sysconfig_params.offer_to_sell_enabled) &&
                            <div className="mb-3">
                                <div>
                                    <nav>
                                        <div className="nav nav-tabs mb-3" id="nav-tab" role="tablist">
                                            <button onClick={() => this.handleInputChange('offer_to', 'buy', true)} className={"nav-link" + (this.state.input.offer_to == 'buy' ? " active" : '')} id="nav-offer-to-buy-tab" data-bs-toggle="tab" data-bs-target="#nav-offer-to-buy" type="button" role="tab" tabIndex={this.state.input.offer_to == 'sell' ? "-1" : undefined}>Offer to buy</button>
                                            <button onClick={() => this.handleInputChange('offer_to', 'sell', true)} className={"nav-link" + (this.state.input.offer_to == 'sell' ? " active" : '')} id="nav-offer-to-sell-tab" data-bs-toggle="tab" data-bs-target="#nav-offer-to-sell" type="button" role="tab" tabIndex={this.state.input.offer_to == 'buy' ? "-1" : undefined}>Offer to sell</button>
                                        </div>
                                    </nav>
                                    <div className="tab-content" id="nav-tabContent">
                                        <div className={"tab-pane fade" + (this.state.input.offer_to == 'buy' ? " active show" : '')} id="nav-offer-to-buy" role="tabpanel" >

                                        </div>
                                        <div className={"tab-pane fade" + (this.state.input.offer_to == 'sell' ? " active show" : '')} id="nav-offer-to-sell" role="tabpanel" >

                                        </div>
                                    </div>
                                </div>
                            </div>

                        }


                        <form onSubmit={e => { e.preventDefault(); this.handleSubmit() }}>
                            <div className="mb-3">
                                <label htmlFor="input_country_name" className="form-label">Country</label>
                                <CustomSelect
                                    id="input_country_name"
                                    options={country_options}
                                    has_none_option={false}
                                    max_shown_options_count={5}
                                    selected_option_value={this.state.input.country_name}
                                    onChange={country_name => this.handleInputChange('country_name', country_name, true)}
                                />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="input_pymt_method_slug" className="form-label">Pay via</label>
                                <CustomSelect
                                    id="input_pymt_method_slug"
                                    options={pymt_method_options}
                                    has_none_option={false}
                                    max_shown_options_count={5}
                                    selected_option_value={this.state.input.pymt_method_slug}
                                    onChange={pymt_method_slug => { this.handleInputChange('pymt_method_slug', pymt_method_slug, true); this.handleInputChange('pymt_details', returnObj(this.props.datalists.active_pymt_methods[pymt_method_slug].details_required), true); }}
                                />
                            </div>

                            {(this.state.input.offer_to == 'sell') && <>
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

                            {this.state.input.pymt_method_slug == 'cash_in_person' &&
                                <div className="mb-3">
                                    <label htmlFor="input_location" className="form-label">Location</label>
                                    <div className="input-group">
                                        <span className="input-group-text">#</span>
                                        <input
                                            type="text" className="form-control" id="input_location"
                                            value={this.state.input.location.toRaw()}
                                            placeholder='Harare CBD'
                                            required
                                            onChange={elem => this.handleInputChange('location', elem.target.value)}
                                        />
                                    </div>
                                </div>
                            }

                            <div className="card mb-3">
                                <div className="card-header">
                                    Trade Units
                                </div>
                                <div className="card-body">
                                    <div className="mb-3">

                                        <div className="row">
                                            <div className="col">
                                                <label htmlFor="input_asset_code" className="form-label">Asset</label>
                                                <CustomSelect
                                                    id="input_asset_code"
                                                    options={asset_options}
                                                    has_none_option={false}
                                                    max_shown_options_count={5}
                                                    selected_option_value={this.state.input.asset_code}
                                                    onChange={asset_code => this.handleInputChange('asset_code', asset_code, true)}
                                                />
                                            </div>
                                            {this.props.auth_user != null && <div className="col">
                                                <label htmlFor="output_current_balance" className="form-label">Usable balance</label>
                                                <span className="form-control" id='output_current_balance'>{window.assetValueString((this.props.auth_user.asset_wallets.find(aacc => aacc.asset_code == asset.code) ?? { usable_balance_asset_value: 0 }).usable_balance_asset_value, asset)}</span>
                                            </div>}
                                        </div>

                                    </div>

                                    <div className="mb-3">
                                        <label htmlFor="input_currency_code" className="form-label">Currency</label>
                                        <CustomSelect
                                            id="input_currency_code"
                                            options={currency_options}
                                            has_none_option={false}
                                            max_shown_options_count={5}
                                            selected_option_value={this.state.input.currency_code}
                                            onChange={currency_code => this.handleInputChange('currency_code', currency_code, true)}
                                        />
                                    </div>
                                </div>
                            </div>

                            <div className="accordion mb-3" id="accordion_input_info">
                                <div className="accordion-item">
                                    <h4 className="accordion-header" >
                                        <button className="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_input_info" >
                                            Input info
                                        </button>
                                    </h4>
                                    <div id="collapse_input_info" className="accordion-collapse collapse show" data-bs-parent="#accordion_input_info" >
                                        <div className="accordion-body pb-0">
                                            {this.state.input.offer_to == 'buy' && <>
                                                <p>The asset value you get is calculated as follows:</p>
                                                <p className="text-muted">{'$asset_value = $purchase_amount / $offer_price'}</p>
                                            </>}
                                            {this.state.input.offer_to == 'sell' && <>
                                                <p>Trade transaction fee factor is set at <b>{this.props.sysconfig_params.trade_txn_fee_fctr}</b></p>
                                                <p>The amount you get is calculated as follows:</p>
                                                <p className="text-muted">$received_amount = $asset_value * $offer_price / (1 + $trade_txn_fee_factor)</p>
                                            </>}
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div className="mb-3">
                                <label htmlFor="input_offer_price" className="form-label">Offer price</label>
                                <div className="input-group">
                                    {currency.symbol_before_number && <span className="input-group-text">{currency.symbol}</span>}
                                    <input
                                        type="number" className="form-control" id="input_offer_price"
                                        min={"0.0000000001"}
                                        step={"0.0000000001"}
                                        value={Math.round((parseFloat(this.state.input.offer_price.toRaw() ?? 0) + Number.EPSILON) * 10000000000) / 10000000000}
                                        required
                                        onChange={elem => this.handleInputChange('offer_price', elem.target.value)}
                                    />
                                    {!currency.symbol_before_number && <span className="input-group-text">{currency.symbol}</span>}
                                </div>
                            </div>

                            {this.state.input.offer_to == 'buy' && <>

                                <div className="mb-3">
                                    <label htmlFor="input_min_trade_purchase_amount" className="form-label">Minimum amount you'll pay per trade</label>
                                    <div className="input-group">
                                        {currency.symbol_before_number && <span className="input-group-text">{currency.symbol}</span>}
                                        <input
                                            type="number" className="form-control" id="input_min_trade_purchase_amount"
                                            min={this.state.input.pymt_method_slug == 'cash_in_person' ? currency.min_transactable_cash_amount : "0.01"}
                                            step={this.state.input.pymt_method_slug == 'cash_in_person' ? currency.smallest_transactable_cash_denomination_amount : "0.01"}
                                            value={window.currencyAmountInput(this.state.input.min_trade_purchase_amount.toRaw())}
                                            required
                                            onChange={elem => this.handleInputChange('min_trade_purchase_amount', elem.target.value)}
                                        />
                                        {!currency.symbol_before_number && <span className="input-group-text">{currency.symbol}</span>}
                                        <span className="input-group-text">You get {window.assetValueString(this.currencyToAsset(this.state.input.min_trade_purchase_amount.toRaw()), asset, true, true)}</span>
                                    </div>
                                </div>
                                <div className="mb-3">
                                    <label htmlFor="input_max_trade_purchase_amount" className="form-label">Maximum amount you'll pay per trade</label>
                                    <div className="input-group">
                                        {currency.symbol_before_number && <span className="input-group-text">{currency.symbol}</span>}
                                        <input
                                            type="number" className="form-control" id="input_max_trade_purchase_amount"
                                            min={window.currencyAmountInput(this.state.input.min_trade_purchase_amount.toRaw())}
                                            step={this.state.input.pymt_method_slug == 'cash_in_person' ? currency.smallest_transactable_cash_denomination_amount : "0.01"}
                                            value={window.currencyAmountInput(this.state.input.max_trade_purchase_amount.toRaw())}
                                            required
                                            onChange={elem => this.handleInputChange('max_trade_purchase_amount', elem.target.value)}
                                        />
                                        {!currency.symbol_before_number && <span className="input-group-text">{currency.symbol}</span>}
                                        <span className="input-group-text">You get {window.assetValueString(this.currencyToAsset(this.state.input.max_trade_purchase_amount.toRaw()), asset, true, true)}</span>
                                    </div>
                                </div>
                                <div className="mb-3">
                                    <label htmlFor="input_offer_total_purchase_amount" className="form-label">Total amount on offer (not shown publicly)</label>
                                    <div className="input-group">
                                        {currency.symbol_before_number && <span className="input-group-text">{currency.symbol}</span>}
                                        <input
                                            type="number" className="form-control" id="input_offer_total_purchase_amount"
                                            min={window.currencyAmountInput(this.state.input.max_trade_purchase_amount.toRaw())}
                                            step={this.state.input.pymt_method_slug == 'cash_in_person' ? currency.smallest_transactable_cash_denomination_amount : "0.01"}
                                            value={window.currencyAmountInput(this.state.input.offer_total_purchase_amount.toRaw())}
                                            required
                                            onChange={elem => this.handleInputChange('offer_total_purchase_amount', elem.target.value)}
                                        />
                                        {!currency.symbol_before_number && <span className="input-group-text">{currency.symbol}</span>}
                                        <span className="input-group-text">You get {window.assetValueString(this.currencyToAsset(this.state.input.offer_total_purchase_amount.toRaw()), asset, true, true)}</span>
                                    </div>
                                </div>
                            </>}

                            {this.state.input.offer_to == 'sell' && <>
                                <div className="mb-3">
                                    <label htmlFor="input_min_trade_sell_value" className="form-label">Minimum asset value you'll sell per trade</label>
                                    <div className="input-group">
                                        <input
                                            type="number" className="form-control" id="input_min_trade_sell_value"
                                            min={asset.smallest_display_unit}
                                            step={asset.smallest_display_unit}
                                            max={max_offerable_asset_value}
                                            value={window.assetValueInput(this.state.input.min_trade_sell_value.toRaw(), asset)}
                                            required
                                            onChange={elem => this.handleInputChange('min_trade_sell_value', elem.target.value)}
                                        />
                                        <span className="input-group-text">{asset.code}</span>
                                        <span className="input-group-text">You get {window.currencyAmountString(this.assetToCurrency(this.state.input.min_trade_sell_value.toRaw()), currency, true, true)}</span>
                                    </div>
                                </div>
                                <div className="mb-3">
                                    <label htmlFor="input_max_trade_sell_value" className="form-label">Maximum asset value you'll sell per trade</label>
                                    <div className="input-group">
                                        <input
                                            type="number" className="form-control" id="input_max_trade_sell_value"
                                            min={this.state.input.min_trade_sell_value}
                                            step={asset.smallest_display_unit}
                                            max={max_offerable_asset_value}
                                            value={window.assetValueInput(this.state.input.max_trade_sell_value.toRaw(), asset)}
                                            required
                                            onChange={elem => this.handleInputChange('max_trade_sell_value', elem.target.value)}
                                        />
                                        <span className="input-group-text">{asset.code}</span>
                                        <span className="input-group-text">You get {window.currencyAmountString(this.assetToCurrency(this.state.input.max_trade_sell_value.toRaw()), currency, true, true)}</span>
                                    </div>
                                </div>
                                <div className="mb-3">
                                    <label htmlFor="input_offer_total_sell_value" className="form-label">Total asset value on sale (not shown publicly)</label>
                                    <div className="input-group">
                                        <input
                                            type="number" className="form-control" id="input_offer_total_sell_value"
                                            min={this.state.input.max_trade_sell_value}
                                            step={asset.smallest_display_unit}
                                            max={max_offerable_asset_value}
                                            value={window.assetValueInput(this.state.input.offer_total_sell_value.toRaw(), asset)}
                                            required
                                            onChange={elem => this.handleInputChange('offer_total_sell_value', elem.target.value)}
                                        />
                                        <span className="input-group-text">{asset.code}</span>
                                        <span className="input-group-text">You get {window.currencyAmountString(this.assetToCurrency(this.state.input.offer_total_sell_value.toRaw()), currency, true, true)}</span>
                                    </div>
                                </div>
                            </>}

                            <div className="mb-3">
                                <label htmlFor="input_buyer_cmplt_trade_mins_tmt" className="form-label">{this.state.input.offer_to == 'buy' ? 'You engage' : 'You expect buyer'} to complete initialized trade in</label>
                                <div className="input-group">
                                    <input
                                        type="number" className="form-control" id="input_buyer_cmplt_trade_mins_tmt"
                                        min={this.props.sysconfig_params.buyer_open_trade_min_mins_tmt}
                                        max={this.props.sysconfig_params.buyer_cmplt_trade_max_mins_tmt}
                                        step="1"
                                        value={this.state.input.buyer_cmplt_trade_mins_tmt.toRaw()}
                                        required
                                        onChange={elem => this.handleInputChange('buyer_cmplt_trade_mins_tmt', elem.target.value)}
                                    />
                                    <span className="input-group-text">Minutes</span>
                                </div>
                            </div>

                            <hr />

                            <div className="mb-3">
                                {this.state.errors.map((error, key) => (
                                    <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                                ))}
                            </div>

                            <div className="row">
                                <div className="col">
                                    <button className="btn btn-info w-100" disabled={this.state.btn_post_offer_working} type={!window.isset(this.props.auth_user) ? "button" : "submit"} data-bs-toggle={!window.isset(this.props.auth_user) ? "modal" : undefined} data-bs-target={!window.isset(this.props.auth_user) ? "#signin_modal" : undefined} >
                                        {this.state.btn_post_offer_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Post offer</>}
                                    </button>
                                </div>
                                <div className="col">
                                    <button type="button" onClick={() => this.setState({ input: _.cloneDeep(this.default_input) })} className="btn btn-secondary w-100">Reset Form</button>
                                </div>
                            </div>

                        </form>
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

export default connect(mapStateToProps)(withRouter(OffersCreateNewScreen))