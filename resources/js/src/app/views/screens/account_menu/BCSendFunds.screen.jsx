import React from "react"
import { connect } from 'react-redux'
import { Link } from "react-router-dom";

import SideBar from 'app/views/components/SideBar'
import CustomSelect from 'app/views/components/CustomSelect'

import { _User, _DateTime, _Session, _Notification, _Input, _Transaction } from 'app/controller'

class BCSendFundsScreen extends React.Component {

    default_input = {
        asset_code: 'USDT',
        asset_value: 5,
        destination_blockchain_address: new _Input('0x06d64d1d5eb807e10eb59f38a448830d9888d7da'),
        source_user_password: new _Input('Def-Pass#123'),
        recepient_note: new _Input('Test send.'),
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
        const errors = []
        const input = this.state.input

        if (errors.length === 0) {
            this.setState({ errors, source_user_password_prompt_open: true }) // Remove input error indicators under text inputs            
            bootstrap.Modal.getOrCreateInstance(document.getElementById('password_confirmation_modal')).show();
        } else {
            this.setState({ errors, input })
        }
    }

    handleSubmit2 = async () => {
        this.setState({ btn_send_funds_working: true })
        const errors = []
        const input = this.state.input

        if (!input.source_user_password.isValid('password')) { errors.push("Invalid password") }

        if (errors.length === 0) {
            this.setState({ errors, input }) // Reload input error/success indicators on text/password/number inputs 
            const password_confirmation_modal = bootstrap.Modal.getOrCreateInstance(document.getElementById('password_confirmation_modal'));
            _Transaction.process(_Input.flatten(input))
                .then(() => { password_confirmation_modal.hide(); _Notification.flash({ message: 'Funds sent.', duration: 2000 }); _Session.refresh(); this.setState({ input: _.cloneDeep(this.default_input) }) })
                .catch((error) => {
                    if (error.request && error.request._response && error.request._response.errors && Object.keys(error.request._response.errors).length) {
                        Object.keys(error.request._response.errors).forEach(input_key => { error.request._response.errors[input_key].forEach(input_key_error => { errors.push(input_key_error) }) })
                    } else { errors.push(error.message) }
                    this.setState({ btn_send_funds_working: false, errors })
                })
        } else {
            this.setState({ btn_send_funds_working: false, errors, input })
        }
    }

    componentDidMount = () => {
        _Session.refresh()
    }

    render() {

        const asset_options = [];
        Object.keys(this.props.datalists.active_assets).forEach(asset_code => {
            const asset = this.props.datalists.active_assets[asset_code]
            if (this.props.auth_user.hasAssetAccount(asset_code)) {
                asset_options.push({
                    value: asset_code,
                    searchable_text: asset_code + asset.name + asset.description,
                    output_element: () => <>{asset.name} <i className="text-primary">{asset_code}</i></>
                })
            }
        })

        const asset = this.props.datalists.active_assets[this.state.input.asset_code]

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-fluid py-3">
                <div className="row">
                    <div className="col-2">
                        <SideBar nav_menus={[this.props.nav_menus.find(menu => menu.slug === 'account_menu')]} />
                    </div>
                    <div className="col-10">
                        {this.props.auth_user.asset_accounts.length !== 0 && <>
                            <form onSubmit={e => { e.preventDefault(); this.handleSubmit() }}>
                                <div className="row mb-3">
                                    <div className="col">
                                        <label htmlFor="input_asset_code" className="form-label">Source asset account</label>
                                        <CustomSelect
                                            id="input_asset_code"
                                            options={asset_options}
                                            has_none_option={false}
                                            max_shown_options_count={5}
                                            selected_option_value={this.state.input.asset_code}
                                            onChange={asset_code => this.handleInputChange('asset_code', asset_code, true)}
                                        />
                                    </div>
                                    <div className="col">
                                        <label htmlFor="output_current_balance" className="form-label">Current usable balance</label>
                                        <span className="form-control" id='output_current_balance'>{window.assetValueString((this.props.auth_user.asset_accounts.find(aacc => aacc.asset_code == asset.code) ?? { usable_balance_asset_value: 0 }).usable_balance_asset_value, asset)}</span>
                                    </div>
                                </div>

                                <p style={{ whiteSpace: 'pre-wrap' }}><b><i>{asset.onchain_disclaimer}</i></b></p>

                                <div className="mb-3">
                                    <label htmlFor="input_destination_blockchain_address" className="form-label">Destination blockchain address</label>
                                    <div className="input-group">
                                        <input
                                            type="text" className="form-control" id="input_destination_blockchain_address"
                                            value={this.state.input.destination_blockchain_address + ''}
                                            required
                                            onChange={e => this.handleInputChange('destination_blockchain_address', e.target.value)}
                                        />
                                    </div>
                                </div>

                                <div className="row mb-3">
                                    <div className="col">
                                        <label htmlFor="input_asset_value" className="form-label">Value of asset to transfer</label>
                                        <div className="input-group">
                                            <input
                                                type="number" className="form-control" id="input_asset_value"
                                                min={asset.smallest_display_unit}
                                                required
                                                max={parseFloat(window.assetValueString(((this.props.auth_user.asset_accounts.find(aacc => aacc.asset_code == asset.code) ?? { usable_balance_asset_value: 0 }).usable_balance_asset_value) / (1 + this.props.sysconfig_params.platform_charge_asset_factor), asset, false))}
                                                step={asset.smallest_display_unit}
                                                value={this.state.input.asset_value ? parseFloat(window.assetValueString(this.state.input.asset_value, asset, false)) : 0}
                                                onChange={e => this.handleInputChange('asset_value', e.target.value)}
                                            />
                                        </div>
                                    </div>
                                    <div className="col">
                                        <label htmlFor="output_current_balance" className="form-label">Total to be debited from account. (Incl. {this.props.sysconfig_params.platform_charge_asset_factor} platform charge) </label>
                                        <span className="form-control" id='output_current_balance'>{window.assetValueString((this.state.input.asset_value ?? 0) * (1 + this.props.sysconfig_params.platform_charge_asset_factor), asset)}</span>
                                    </div>
                                </div>

                                <div className="mb-3">
                                    <label htmlFor="input_recepient_note" className="form-label">Sender note</label>
                                    <div className="input-group">
                                        <input
                                            type="text" className="form-control" id="input_recepient_note"
                                            value={this.state.input.recepient_note + ''}
                                            required
                                            onChange={e => this.handleInputChange('recepient_note', e.target.value)}
                                        />
                                    </div>
                                </div>

                                <button type="submit" className="btn btn-primary" disabled={this.state.btn_send_funds_working} >
                                    {this.state.btn_send_funds_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Send Funds</>}
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
                                                <p>{window.assetValueString(this.state.input.asset_value * (1 + this.props.sysconfig_params.platform_charge_asset_factor), asset)} is about to be debited from your account. Enter password to continue.</p>
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
                                                <button type="submit" className="btn btn-primary" disabled={this.state.btn_send_funds_working} >
                                                    {this.state.btn_send_funds_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Send Funds</>}
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <hr />

                        </>}
                        <p className="my-3">Go to <Link to='/account/home'>account home</Link> screen to create asset accounts</p>
                    </div>
                </div>
            </div>
        </this.props.PageWrapper>
    }
}

const mapStateToProps = (state) => {
    return {
        sysconfig_params: state.sysconfig_params_data,
        datalists: state.datalists_data,
        auth_user: state.auth_user_data ? new _User(state.auth_user_data, ['asset_accounts']) : null,
    }
}

export default connect(mapStateToProps)(BCSendFundsScreen)