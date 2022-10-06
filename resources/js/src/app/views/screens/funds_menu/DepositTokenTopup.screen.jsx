import React from "react"
import { connect } from 'react-redux'
import _ from 'lodash'

import SideBar from 'app/views/components/SideBar'

import { _User, _Input, _DepositToken, _Notification } from 'app/controller'
import CustomSelect from 'app/views/components/CustomSelect'

class DepositTokenTopupScreen extends React.Component {

    default_input = {
        asset_code: 'USDT',
        currency_code: 'USD',
        token: new _Input(),
    }

    state = {
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
        this.setState({ btn_attempt_token_topup_working: true })

        const btn_attempt_token_topup_working = false
        const errors = []
        const input = this.state.input

        if (errors.length === 0) {
            this.setState({ errors, input }) // Reload input error/success indicators on text/password/number inputs
            _DepositToken.use(_Input.flatten(input)).then(() => { _Notification.flash({ message: 'Deposit successful', duration: 2000 }); this.setState({ btn_attempt_token_topup_working, input: _.cloneDeep(this.default_input) }) })
                .catch((error) => {
                    if (error.request && error.request._response && error.request._response.errors && Object.keys(error.request._response.errors).length) {
                        Object.keys(error.request._response.errors).forEach(input_key => { error.request._response.errors[input_key].forEach(input_key_error => { errors.push(input_key_error) }) })
                    } else { errors.push(error.message) }
                    this.setState({ btn_attempt_token_topup_working, errors })
                })
        } else {
            this.setState({ btn_attempt_token_topup_working, errors, input })
        }
    }

    render() {

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

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-xl py-3">
                <div className="row">
                    <div className="col-lg-2">
                        <SideBar nav_menus={this.props.nav_menus.filter(menu => menu.slug === 'funds_menu')} />
                    </div>
                    <div className="col-lg-10">
                        <div className="card mb-3">
                            <div className="card-header">
                                Deposit token topup
                            </div>
                            <div className="card-body">
                                <form onSubmit={e => { e.preventDefault(); this.handleSubmit() }}>

                                    <div className="tab-pane fade active show" id="nav-crypto-topup" role="tabpanel">
                                        <div className="mb-3 row">
                                            <div className="col">
                                                <label htmlFor="input_asset_code" className="form-label">Asset</label>
                                                <CustomSelect
                                                    id="input_asset_code"
                                                    has_none_option={false}
                                                    options={asset_options}
                                                    max_shown_options_count={5}
                                                    selected_option_value={this.state.input.asset_code}
                                                    onChange={asset_code => this.handleInputChange('asset_code', asset_code, true)}
                                                />
                                            </div>
                                            <div className="col">
                                                <label htmlFor="output_current_balance" className="form-label">Total balance</label>
                                                <span className="form-control" id='output_current_balance'>{window.assetValueString((this.props.auth_user.asset_wallets.find(aacc => aacc.asset_code == asset.code) ?? { total_balance_asset_value: 0 }).total_balance_asset_value, asset)}</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div className="mb-3">
                                        <label htmlFor="input_token" className="form-label">Deposit token</label>
                                        <input type="text" className="form-control" id={'input_token'}
                                            required
                                            value={this.state.input.token}
                                            onChange={elem => this.handleInputChange('token', elem.target.value, true)}
                                        />
                                    </div>

                                    <hr />

                                    <div className="mb-3">
                                        {this.state.errors.map((error, key) => (
                                            <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                                        ))}
                                    </div>

                                    <button className="btn btn-info w-100" disabled={this.state.btn_attempt_token_topup_working} type="submit" >
                                        {this.state.btn_attempt_token_topup_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Topup</>}
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </this.props.PageWrapper>
    }
}

const mapStateToProps = (state) => {
    return {
        datalists: state.datalists_data,
        auth_user: state.auth_user_data ? new _User(state.auth_user_data, ['asset_wallets']) : null,
    }
}

export default connect(mapStateToProps)(DepositTokenTopupScreen)