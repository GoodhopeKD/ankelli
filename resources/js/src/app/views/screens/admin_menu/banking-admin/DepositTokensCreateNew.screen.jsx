import React from "react"
import { connect } from 'react-redux'
import _ from 'lodash'

import { _User, _Input, _DepositToken, _Notification } from 'app/controller'
import SideBar from 'app/views/components/SideBar'
import CustomSelect from 'app/views/components/CustomSelect'
import withRouter from "app/views/navigation/withRouter"

class DepositTokensCreateNewScreen extends React.Component {

    default_input = {
        asset_code: 'USDT',
        asset_value: new _Input(),
        currency_code: 'USD',
        currency_amount: new _Input(),
        source_user_password: new _Input()
    }

    state = {
        btn_create_deposit_token_working: false,
        input: _.cloneDeep(this.default_input),
        ankelli_reserves_user_asset_accounts: [],
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
        const errors = []
        const input = this.state.input

        const asset = this.props.datalists.active_assets[this.state.input.asset_code]

        if (!(input.asset_value > 0)) { errors.push('Asset value invalid') }
        if (!input.asset_value.isValid('number', 0, (this.state.ankelli_reserves_user_asset_accounts.find(aacc => aacc.asset_code == asset.code) ?? { usable_balance_asset_value: 0 }).usable_balance_asset_value)) { errors.push("Asset value not within bounds") }

        if (errors.length === 0) {
            this.setState({ errors, input }) // Reload input error/success indicators on text/password/number inputs
            bootstrap.Modal.getOrCreateInstance(document.getElementById('password_confirmation_modal')).show();
        } else {
            this.setState({ errors, input })
        }
    }

    handleSubmit2 = async () => {
        this.setState({ btn_create_deposit_token_working: true })

        const btn_create_deposit_token_working = false
        const errors = []
        const input = this.state.input

        if (!input.source_user_password.isValid('password')) { errors.push("Invalid password") }

        if (errors.length === 0) {
            this.setState({ errors, input }) // Reload input error/success indicators on text/password/number inputs
            _DepositToken.create(_Input.flatten(input)).then(() => { _Notification.flash({ message: 'Deposit token created', duration: 2000 }); this.props.navigate(-1) })
                .catch((error) => {
                    if (error.request && error.request._response && error.request._response.errors && Object.keys(error.request._response.errors).length) {
                        Object.keys(error.request._response.errors).forEach(input_key => { error.request._response.errors[input_key].forEach(input_key_error => { errors.push(input_key_error) }) })
                    } else { errors.push(error.message) }
                    this.setState({ btn_create_deposit_token_working, errors, input: _.cloneDeep(this.default_input) })
                })
        } else {
            this.setState({ btn_create_deposit_token_working, errors, input })
        }
    }

    componentDidMount = async () => {
        await _User.getOne({ username: 'reserves' })
            .then(ankelli_reserves_user => this.setState({ ankelli_reserves_user_asset_accounts: ankelli_reserves_user.asset_accounts }))
            .catch(e => console.log(e))
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

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-xl py-3">
                <div className="row">
                    <div className="col-lg-2">
                        <SideBar nav_menus={[this.props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />
                    </div>
                    <div className="col-lg-10">

                        <div className="card mb-3">
                            <div className="card-header">
                                Create Deposit Token
                            </div>
                            <div className="card-body">
                                <form onSubmit={e => { e.preventDefault(); this.handleSubmit() }}>

                                    <div className="mb-3">
                                        <label htmlFor="input_currency_code" className="form-label">Currency of received amount</label>
                                        <CustomSelect
                                            id="input_currency_code"
                                            options={currency_options}
                                            max_shown_options_count={5}
                                            selected_option_value={this.state.input.currency_code}
                                            onChange={currency_code => this.handleInputChange('currency_code', currency_code, true)}
                                        />
                                    </div>

                                    <div className="mb-3">
                                        <label htmlFor="input_currency_amount" className="form-label">Amount received</label>
                                        <input type="number" className="form-control" id={'input_currency_amount'}
                                            required
                                            value={this.state.input.currency_amount}
                                            onChange={elem => this.handleInputChange('currency_amount', elem.target.value)}
                                        />
                                    </div>

                                    <div className="mb-3">
                                        <div className="row">
                                            <div className="col">
                                                <label htmlFor="input_asset_code" className="form-label">Asset to transfer</label>
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
                                                <label htmlFor="output_current_balance" className="form-label">Reserves balance</label>
                                                <span className="form-control" id='output_current_balance'>{window.assetValueString((this.state.ankelli_reserves_user_asset_accounts.find(aacc => aacc.asset_code == asset.code) ?? { usable_balance_asset_value: 0 }).usable_balance_asset_value, asset)}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="mb-3">
                                        <label htmlFor="input_asset_value" className="form-label">Value of asset</label>
                                        <input type="number" className="form-control" id={'input_asset_value'}
                                            required
                                            value={this.state.input.asset_value}
                                            min={asset.smallest_display_unit}
                                            max={window.assetValueInput((this.state.ankelli_reserves_user_asset_accounts.find(aacc => aacc.asset_code == asset.code) ?? { usable_balance_asset_value: 0 }).usable_balance_asset_value, asset)}
                                            onChange={elem => this.handleInputChange('asset_value', elem.target.value)}
                                        />
                                    </div>

                                    <hr />

                                    <div className="mb-3">
                                        {this.state.errors.map((error, key) => (
                                            <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                                        ))}
                                    </div>

                                    <button className="btn btn-info w-100" disabled={this.state.btn_create_deposit_token_working} type="submit" >
                                        {this.state.btn_create_deposit_token_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Create token</>}
                                    </button>
                                </form>

                                <div className="modal fade" id="password_confirmation_modal" tabIndex="-1" >
                                    <div className="modal-dialog modal-dialog-centered">
                                        <div className="modal-content">
                                            <div className="modal-header">
                                                <h5 className="modal-title" >Password confirmation</h5>
                                                <button type="button" className="btn-close" data-bs-dismiss="modal"></button>
                                            </div>
                                            <form onSubmit={e => { e.preventDefault(); this.handleSubmit2() }}>
                                                <div className="modal-body">
                                                    <p>{window.assetValueString(this.state.input.asset_value, asset)} is about to be released from the reserves account. Enter password to continue.</p>
                                                    <div className="form-floating mb-3">
                                                        <input
                                                            type="password"
                                                            className={"form-control rounded-3" + (this.state.input.source_user_password.failedValidation() ? ' is-invalid' : '')}
                                                            id="input_source_user_password"
                                                            value={this.state.input.source_user_password + ''}
                                                            onChange={elem => this.handleInputChange('source_user_password', elem.target.value)}
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
                                                    <button type="submit" className="btn btn-primary" disabled={this.state.btn_create_deposit_token_working} >
                                                        {this.state.btn_create_deposit_token_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Create token</>}
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

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
        auth_user: state.auth_user_data ? new _User(state.auth_user_data) : null,
    }
}

export default connect(mapStateToProps)(withRouter(DepositTokensCreateNewScreen))