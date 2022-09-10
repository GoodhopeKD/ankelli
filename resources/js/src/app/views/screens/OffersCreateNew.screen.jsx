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
        location: new _Input('Harare CBD'),

        asset_code: 'USDT',
        currency_code: 'USD',
        offer_price: new _Input(),

        min_purchase_amount: new _Input(),
        max_purchase_amount: new _Input(),

        min_sell_value: new _Input(),
        max_sell_value: new _Input(),

        note: new _Input(),
    }

    state = {
        btn_post_offer_working: false,
        input: _.cloneDeep(this.default_input),
        errors: [],
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

    handleSubmit = async () => {
        this.setState({ btn_post_offer_working: true })

        const btn_post_offer_working = false
        const errors = []
        const input = this.state.input

        if (errors.length === 0) {
            this.setState({ errors }) // Remove input error indicators under text inputs
            let _input = Object.assign(Object.create(Object.getPrototypeOf(input)), input) // Dereference input object
            Object.keys(_input).forEach(key => { if (_input[key] instanceof _Input) _input[key] = _input[key] + "" }) // convert _Input instances to Text

            if (_input.pymt_method_slug != 'cash_in_person') {
                delete _input.location
            }
            if (!(_input.offer_to == 'sell' || _input.pymt_method_slug == 'cash_in_person')) {
                delete _input.pymt_details
            }
            if (_input.offer_to != 'buy') {
                delete _input.min_purchase_amount
                delete _input.max_purchase_amount
            }
            if (_input.offer_to != 'sell') {
                delete _input.min_sell_value
                delete _input.max_sell_value
            }

            _Offer.create(_input).then(() => { _Notification.flash({ message: 'Offer posted successfully!', duration: 2000 }); this.props.navigate('/my-offers') })
                .catch((error) => {
                    errors.push(error.message)
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
        const all_disabled = this.props.auth_user == null

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

        const max_offerable_asset_value = this.props.auth_user == null ? null : (1 - this.props.sysconfig_params.platform_charge_asset_factor) * parseFloat(window.assetValueString((this.props.auth_user.asset_wallets.find(aacc => aacc.asset_code == asset.code) ?? { asset_value: 0 }).asset_value), asset, false)

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container py-4 ">
                <div className="d-flex justify-content-center">
                    <div className="col-lg-6">

                        {all_disabled && <div className="mb-3">
                            <div className="alert alert-warning">
                                You must be logged in to be able to fill in this form
                            </div>
                        </div>}

                        {(this.props.sysconfig_params.offer_to_buy_enabled && this.props.sysconfig_params.offer_to_sell_enabled) &&
                            <div className="mb-3">
                                <label htmlFor="input_offer_to" className="form-label">Offer to</label>
                                <select disabled={all_disabled} className="form-select" id="input_offer_to" value={this.state.input.offer_to} onChange={rr => this.handleInputChange('offer_to', rr.target.value, true)} >
                                    <option value="buy">Buy</option>
                                    <option value="sell" >Sell</option>
                                </select>
                            </div>
                        }

                        <form onSubmit={e => { e.preventDefault(); this.handleSubmit() }}>
                            <div className="mb-3">
                                <label htmlFor="input_country_name" className="form-label">Country</label>
                                <CustomSelect
                                    disabled={all_disabled}
                                    element_id="input_country_name"
                                    options={country_options}
                                    has_none_option={false}
                                    max_shown_options_count={5}
                                    selected_option_value={this.state.input.country_name}
                                    onChange={country_name => this.handleInputChange('country_name', country_name, true)}
                                />
                            </div>

                            <div className="mb-3">
                                <label htmlFor="input_pymt_method_slug" className="form-label">Payment method</label>
                                <CustomSelect
                                    disabled={all_disabled}
                                    element_id="input_pymt_method_slug"
                                    options={pymt_method_options}
                                    has_none_option={false}
                                    max_shown_options_count={5}
                                    selected_option_value={this.state.input.pymt_method_slug}
                                    onChange={pymt_method_slug => { this.handleInputChange('pymt_method_slug', pymt_method_slug, true); this.handleInputChange('pymt_details', returnObj(this.props.datalists.active_pymt_methods[pymt_method_slug].details_required), true); }}
                                />
                            </div>

                            {(this.state.input.offer_to == 'sell' || this.state.input.pymt_method_slug == 'cash_in_person') && <>
                                <div className="card mb-3">
                                    <div className="card-header">
                                        {pymt_method.name} <img src={pymt_method.icon.uri} alt={pymt_method.name + " icon"} width="24" height="24" className="mx-2" /> Recepient details
                                    </div>
                                    <div className="card-body py-0">
                                        {Object.keys(this.state.input.pymt_details).map((detail_key, index) => {
                                            return <div key={index} className="form-floating my-3">
                                                <input disabled={all_disabled} type="text" className="form-control" id={'input_pymt_method_detail_' + detail_key}
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

                            {this.state.input.pymt_method_slug == 'cash_in_person' &&
                                <div className="mb-3">
                                    <label htmlFor="input_location" className="form-label">Location</label>
                                    <div className="input-group">
                                        <span className="input-group-text">#</span>
                                        <input
                                            disabled={all_disabled}
                                            type="text" className="form-control" id="input_location"
                                            value={this.state.input.location + ''}
                                            required
                                            onChange={e => this.handleInputChange('location', e.target.value)}
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
                                                    disabled={all_disabled}
                                                    element_id="input_asset_code"
                                                    options={asset_options}
                                                    has_none_option={false}
                                                    max_shown_options_count={5}
                                                    selected_option_value={this.state.input.asset_code}
                                                    onChange={asset_code => this.handleInputChange('asset_code', asset_code, true)}
                                                />
                                            </div>
                                            {!all_disabled && <div className="col">
                                                <label htmlFor="output_current_balance" className="form-label">Current balance</label>
                                                <span className="form-control" id='output_current_balance'>{window.assetValueString((this.props.auth_user.asset_wallets.find(aacc => aacc.asset_code == asset.code) ?? { asset_value: 0 }).asset_value, asset)}</span>
                                            </div>}
                                        </div>

                                    </div>

                                    <div className="mb-3">
                                        <label htmlFor="input_currency_code" className="form-label">Currency</label>
                                        <CustomSelect
                                            disabled={all_disabled}
                                            element_id="input_currency_code"
                                            options={currency_options}
                                            has_none_option={false}
                                            max_shown_options_count={5}
                                            selected_option_value={this.state.input.currency_code}
                                            onChange={currency_code => this.handleInputChange('currency_code', currency_code, true)}
                                        />
                                    </div>
                                </div>
                            </div>

                            <div className="mb-3">
                                <label htmlFor="input_offer_price" className="form-label">Asset {this.state.input.offer_to == 'buy' ? 'purchase' : 'sale'} price</label>
                                <div className="input-group">
                                    {currency.symbol_before_number && <span className="input-group-text">{currency.symbol}</span>}
                                    <input
                                        disabled={all_disabled}
                                        type="number" className="form-control" id="input_offer_price"
                                        min="0"
                                        step="0.01"
                                        value={this.state.input.offer_price + ''}
                                        required
                                        onChange={e => this.handleInputChange('offer_price', e.target.value)}
                                    />
                                    {!currency.symbol_before_number && <span className="input-group-text">{currency.symbol}</span>}
                                </div>
                            </div>

                            {this.state.input.offer_to == 'buy' && <>
                                <div className="mb-3">
                                    <label htmlFor="input_min_purchase_amount" className="form-label">Minimum purchase amount</label>
                                    <div className="input-group">
                                        {currency.symbol_before_number && <span className="input-group-text">{currency.symbol}</span>}
                                        <input
                                            disabled={all_disabled}
                                            type="number" className="form-control" id="input_min_purchase_amount"
                                            min="0"
                                            value={this.state.input.min_purchase_amount + ''}
                                            required
                                            onChange={e => this.handleInputChange('min_purchase_amount', e.target.value)}
                                        />
                                        {!currency.symbol_before_number && <span className="input-group-text">{currency.symbol}</span>}
                                    </div>
                                </div>
                                <div className="mb-3">
                                    <label htmlFor="input_max_purchase_amount" className="form-label">Maximum purchase amount</label>
                                    <div className="input-group">
                                        {currency.symbol_before_number && <span className="input-group-text">{currency.symbol}</span>}
                                        <input
                                            disabled={all_disabled}
                                            type="number" className="form-control" id="input_max_purchase_amount"
                                            min={this.state.input.min_purchase_amount}
                                            value={this.state.input.max_purchase_amount + ''}
                                            required
                                            onChange={e => this.handleInputChange('max_purchase_amount', e.target.value)}
                                        />
                                        {!currency.symbol_before_number && <span className="input-group-text">{currency.symbol}</span>}
                                    </div>
                                </div>
                            </>}

                            {this.state.input.offer_to == 'sell' && <>
                                <div className="mb-3">
                                    <label htmlFor="input_min_sell_value" className="form-label">Minimum sell value</label>
                                    <div className="input-group">
                                        <input
                                            disabled={all_disabled}
                                            type="number" className="form-control" id="input_min_sell_value"
                                            min="0"
                                            max={max_offerable_asset_value}
                                            value={this.state.input.min_sell_value + ''}
                                            required
                                            onChange={e => this.handleInputChange('min_sell_value', e.target.value)}
                                        />
                                        <span className="input-group-text">{asset.code}</span>
                                    </div>
                                </div>
                                <div className="mb-3">
                                    <label htmlFor="input_max_sell_value" className="form-label">Maximum sell value</label>
                                    <div className="input-group">
                                        <input
                                            disabled={all_disabled}
                                            type="number" className="form-control" id="input_max_sell_value"
                                            min={this.state.input.min_sell_value}
                                            max={max_offerable_asset_value}
                                            value={this.state.input.max_sell_value + ''}
                                            required
                                            onChange={e => this.handleInputChange('max_sell_value', e.target.value)}
                                        />
                                        <span className="input-group-text">{asset.code}</span>
                                    </div>
                                </div>
                            </>}

                            <hr />

                            <div className="mb-3">
                                {this.state.errors.map((error, key) => (
                                    <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                                ))}
                            </div>

                            <div className="row">
                                <div className="col">
                                    <button className="btn btn-info w-100" disabled={this.state.btn_post_offer_working || all_disabled} type="submit" >
                                        {this.state.btn_post_offer_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Post offer</>}
                                    </button>
                                </div>
                                <div className="col">
                                    <button type="button" disabled={all_disabled} onClick={() => this.setState({ input: _.cloneDeep(this.default_input) }, console.log("efjbk"))} className="btn btn-secondary w-100">Reset Form</button>
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