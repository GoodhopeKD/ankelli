import React from 'react'
import { connect } from 'react-redux'
import { Link } from "react-router-dom";

import { _User, _Input, _Notification } from 'app/controller';
import withRouter from 'app/views/navigation/withRouter'

const DEBUG = true

class SignUpScreen extends React.Component {

    state = {
        btn_signup_working: false,
        input: {
            reg_token: (this.props.sysconfig_params_data.token_reg_enabled) ? new _Input(_Input.debug_form_autofill(DEBUG, '1234567890')) : null,
            username: new _Input(_Input.debug_form_autofill(DEBUG, 'sekuru')),
            email_address: new _Input(_Input.debug_form_autofill(DEBUG, 'sekuru@ankelli.com')),
            password: new _Input(_Input.debug_form_autofill(DEBUG, 'Def-Pass#123')),
            password_confirmation: new _Input(_Input.debug_form_autofill(DEBUG, 'Def-Pass#123')),
        },
        errors: [],
    };

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

        this.setState({ btn_signup_working: true })

        const btn_signup_working = false
        const errors = []
        const input = this.state.input

        if (this.props.sysconfig_params_data.token_reg_enabled) if (!input.reg_token.isValid('reg_token')) { errors.push("Invalid registration token") }
        if (this.props.sysconfig_params_data.token_reg_enabled) await input.reg_token.async_checkIfUsable('reg_token').then(resp => {
            if (!input.reg_token.isUsable('reg_token')) { errors.push(resp.message) }
        }).catch(() => { errors.push("Could not check if registration token is usable.") })

        if (!input.username.isValid('username')) { errors.push("Invalid username") }
        await input.username.async_checkIfAvailable('username').then((resp) => {
            if (!input.username.isAvailable('username')) { errors.push(resp.message) }
        }).catch(() => { errors.push("Could not check if username is available for use.") })

        if (!input.email_address.isValid('email_address')) { errors.push("Invalid email address") }
        await input.email_address.async_checkIfAvailable('email_address').then(resp => {
            if (!input.email_address.isAvailable('email_address')) { errors.push(resp.message) }
        }).catch(() => { errors.push("Could not check if email address is available for use.") })

        if (!input.password.isValid('password')) { errors.push("Password should have: at least 8 characters; at least 1 of: numbers, uppercase, lowercase characters") }
        if (!input.password_confirmation.matches(input.password.toString())) { errors.push("Passwords Mismatch") }

        if (errors.length === 0) {
            this.setState({ errors, input }) // Reload input error/success indicators on text/password/number inputs
            const signup_modal = bootstrap.Modal.getOrCreateInstance(document.querySelector('#signup_modal'));
            _User.signUp(_Input.flatten(input)).then(() => { signup_modal.hide(); _Notification.flash({ message: 'Sign up successful!', duration: 750 }) })
                .catch((error) => {
                    if (error.request && error.request._response && error.request._response.errors && Object.keys(error.request._response.errors).length) {
                        Object.keys(error.request._response.errors).forEach(input_key => { error.request._response.errors[input_key].forEach(input_key_error => { errors.push(input_key_error) }) })
                    } else { errors.push(error.message) }
                    input.reg_token.clearValidation()
                    input.username.clearValidation()
                    input.email_address.clearValidation()
                    input.password.clearValidation()
                    input.password_confirmation.clearValidation()
                    this.setState({ btn_signup_working, errors })
                })
        } else {
            this.setState({ btn_signup_working, errors, input })
        }
    }

    render() {
        return <div className="modal-dialog modal-dialog-centered" role="document">
            <div className="modal-content rounded-4 shadow">
                <div className="modal-header p-4 border-bottom-0">
                    <h3 className="fw-bold mb-0">Sign up</h3>
                </div>
                <div className="modal-body p-4 pt-0">
                    {(this.props.sysconfig_params_data.open_reg_enabled || this.props.sysconfig_params_data.token_reg_enabled) ? <>
                        <form onSubmit={e => { e.preventDefault(); this.handleSubmit() }}>
                            {this.props.sysconfig_params_data.token_reg_enabled &&
                                <div className="form-floating mb-3">
                                    <input
                                        type='text'
                                        className={"form-control" + (this.state.input.reg_token.failedValidation() ? ' is-invalid' : '') + (this.state.input.reg_token.passedValidation() ? ' is-valid' : '')}
                                        id="input_reg_token"
                                        minLength={_Input.validation_param_lengths.reg_token.min_length}
                                        maxLength={_Input.validation_param_lengths.reg_token.max_length}
                                        value={this.state.input.reg_token + ''}
                                        onChange={e => this.handleInputChange('reg_token', e.target.value)}
                                        required={!this.props.sysconfig_params_data.open_reg_enabled}
                                        placeholder="Registration Token"
                                    />
                                    <label htmlFor="input_reg_token">Registration Token</label>
                                </div>
                            }

                            <div className="form-floating mb-3">
                                <input
                                    type='text'
                                    className={"form-control" + (this.state.input.username.failedValidation() ? ' is-invalid' : '') + (this.state.input.username.passedValidation() ? ' is-valid' : '')}
                                    id="input_username"
                                    minLength={_Input.validation_param_lengths.username.min_length}
                                    maxLength={_Input.validation_param_lengths.username.max_length}
                                    value={this.state.input.username + ''}
                                    onChange={e => this.handleInputChange('username', e.target.value)}
                                    required
                                    placeholder="Username"
                                />
                                <label htmlFor="input_username">Username</label>
                            </div>
                            <div className="form-floating mb-3">
                                <input
                                    type='email'
                                    className={"form-control" + (this.state.input.email_address.failedValidation() ? ' is-invalid' : '') + (this.state.input.email_address.passedValidation() ? ' is-valid' : '')}
                                    id="input_email_address"
                                    minLength={_Input.validation_param_lengths.email_address.min_length}
                                    maxLength={_Input.validation_param_lengths.email_address.max_length}
                                    value={this.state.input.email_address + ''}
                                    onChange={e => this.handleInputChange('email_address', e.target.value)}
                                    required
                                    placeholder="Email Address"
                                />
                                <label htmlFor="input_email_address">Email Address</label>
                            </div>
                            <div className="form-floating mb-3">
                                <input
                                    type="password"
                                    className={"form-control" + (this.state.input.password.failedValidation() ? ' is-invalid' : '') + (this.state.input.password.passedValidation() ? ' is-valid' : '')}
                                    id="input_password"
                                    minLength={_Input.validation_param_lengths.password.min_length}
                                    maxLength={_Input.validation_param_lengths.password.max_length}
                                    value={this.state.input.password + ''}
                                    onChange={e => this.handleInputChange('password', e.target.value)}
                                    required
                                    placeholder="Password"
                                    style={{ paddingRight: 40 }}
                                />
                                <button className="btn btn-sm" type="button" style={{ position: 'absolute', top: 13, right: 2 }} onClick={() => document.getElementById('input_password').setAttribute('type', document.getElementById('input_password').getAttribute('type') == 'text' ? 'password' : 'text')}>𓁹</button>
                                <label htmlFor="input_password">Password</label>
                            </div>
                            <div className="form-floating mb-3">
                                <input
                                    type="password"
                                    className={"form-control" + (this.state.input.password_confirmation.failedValidation() ? ' is-invalid' : '') + (this.state.input.password_confirmation.passedValidation() ? ' is-valid' : '')}
                                    id="input_password_confirmation"
                                    minLength={_Input.validation_param_lengths.password.min_length}
                                    maxLength={_Input.validation_param_lengths.password.max_length}
                                    value={this.state.input.password_confirmation + ''}
                                    onChange={e => this.handleInputChange('password_confirmation', e.target.value)}
                                    required
                                    placeholder="Password again"
                                    style={{ paddingRight: 40 }}
                                />
                                <button className="btn btn-sm" type="button" style={{ position: 'absolute', top: 13, right: 2 }} onClick={() => document.getElementById('input_password_confirmation').setAttribute('type', document.getElementById('input_password_confirmation').getAttribute('type') == 'text' ? 'password' : 'text')}>𓁹</button>
                                <label htmlFor="input_password_confirmation">Password again</label>
                            </div>

                            <div className="mb-3">
                                {this.state.errors.map((error, key) => (
                                    <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                                ))}
                            </div>

                            <button className="w-100 mb-2 btn btn-lg rounded-3 btn-primary" disabled={this.state.btn_signup_working} type="submit" >
                                {this.state.btn_signup_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <span>Sign up</span>}
                            </button>

                            <small className="text-muted">By clicking Sign up, you agree to our <Link to='/terms-of-service' target='_blank'>Terms of service</Link> and confirm that you have read our <Link to='/privacy-policy' target='_blank'>Privacy Policy.</Link></small><br />
                            {this.props.component_context == "screen" ? <>
                                <small className="text-muted">Already have an account? Click here to <Link to={'/signin' + this.props.location.search}>sign in</Link>.</small>
                            </> : <>
                                <small className="text-muted">Already have an account? Click here to <Link to={'/#/signin'} data-bs-target="#signin_modal" data-bs-toggle="modal" >sign in</Link>.</small>
                            </>}
                        </form>
                    </> : <>
                        Sign up is momentarily disabled.<br />
                        Please check back after a while or click here to {this.props.component_context == "screen" ? <Link to={'/signin' + this.props.location.search}>sign in</Link> : <Link to={'/#/signin'} data-bs-target="#signin_modal" data-bs-toggle="modal" >sign in</Link>}.
                    </>}
                </div>
            </div>
        </div>
    }
}

const mapStateToProps = (state) => {
    return {
        sysconfig_params_data: state.sysconfig_params_data
    }
}

export default connect(mapStateToProps)(withRouter(SignUpScreen))