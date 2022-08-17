import React from 'react'
import { connect } from 'react-redux'
import { Link } from "react-router-dom";

import { _User, _Input, _Notification } from 'app/controller';

const DEBUG = true

class SignUpScreen extends React.Component {

    state = {
        btn_signup_working: false,
        input: {
            reg_token: (this.props.sysconfig_params_data.token_reg_enabled) ? new _Input(_Input.debug_form_autofill(DEBUG, '1234567890')) : null,
            username: new _Input(_Input.debug_form_autofill(DEBUG, 'sekuru')),
            email_address: new _Input(_Input.debug_form_autofill(DEBUG, 'sekuru@ankelli.com')),
            password: new _Input(_Input.debug_form_autofill(DEBUG, 'Password#123')),
            password_confirmation: new _Input(_Input.debug_form_autofill(DEBUG, 'Password#123')),
        },
        errors: [],
    };

    handleInputChange(field, value) {
        let input = this.state.input
        input[field] = new _Input(value)
        this.setState({ input })
    }

    handleSubmit = async () => {

        if (this.props.sysconfig_params_data.token_reg_enabled) this.handleInputChange('reg_token', document.getElementById('input_reg_token').value)
        this.handleInputChange('username', document.getElementById('input_username').value)
        this.handleInputChange('email_address', document.getElementById('input_email_address').value)
        this.handleInputChange('password', document.getElementById('input_password').value)
        this.handleInputChange('password_confirmation', document.getElementById('input_password_confirmation').value)
        this.setState({ btn_signup_working: true })

        const btn_signup_working = false
        const errors = []
        const input = this.state.input

        if (this.props.sysconfig_params_data.token_reg_enabled) if (!input.reg_token.isValid('reg_token')) { errors.push("Invalid registration token") }
        if (!input.username.isValid('username')) { errors.push("Invalid username") }
        if (!input.email_address.isValid('email_address')) { errors.push("Invalid email address") }
        if (!input.password.isValid('password')) { errors.push("Password should have: at least 8 characters; at least 1 of: numbers, uppercase, lowercase characters") }
        if (!input.password_confirmation.matches(input.password.toString())) { errors.push("Passwords Mismatch") }

        if (this.props.sysconfig_params_data.token_reg_enabled) await input.reg_token.async_checkIfUsable('reg_token').then(resp => {
            if (!input.reg_token.isUsable('reg_token')) { errors.push(resp.message) }
        }).catch(() => { errors.push("Could not check if registration token is available for use.") })

        await input.username.async_checkIfUsable('username').then((resp) => {
            if (!input.username.isUsable('username')) { errors.push(resp.message) }
        }).catch(() => { errors.push("Could not check if username is available for use.") })

        await input.email_address.async_checkIfUsable('email_address').then(resp => {
            if (!input.email_address.isUsable('email_address')) { errors.push(resp.message) }
        }).catch(() => { errors.push("Could not check if email address is available for use.") })

        if (errors.length === 0) {
            this.setState({ errors }) // Remove input error indicators under text inputs
            let _input = Object.assign(Object.create(Object.getPrototypeOf(input)), input) // Dereference input object
            Object.keys(_input).forEach(key => { if (_input[key] instanceof _Input) _input[key] = _input[key] + "" }) // convert _Input instances to Text
            _User.signUp(_input).then(() => _Notification.flash({ message: 'Sign up successful!', duration: 750 }))
                .catch((error) => {
                    errors.push(error.message)
                    this.setState({ btn_signup_working, errors })
                })
        } else {
            this.setState({ btn_signup_working, errors, input })
        }
    }

    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container">
                <div className="modal py-2 position-static d-block">
                    <div className="modal-dialog" role="document">
                        <div className="modal-content rounded-4 shadow">
                            <div className="modal-header p-4 border-bottom-0">
                                <h2 className="fw-bold mb-0">Sign up</h2>
                            </div>
                            <div className="modal-body p-4 pt-0">
                                {(this.props.sysconfig_params_data.open_reg_enabled || this.props.sysconfig_params_data.token_reg_enabled) ? <>
                                    <form className="" onSubmit={e => e.preventDefault()}>
                                        {this.props.sysconfig_params_data.token_reg_enabled &&
                                            <div className="form-floating mb-3">
                                                <input type='text' required={!this.props.sysconfig_params_data.open_reg_enabled} className={"form-control rounded-3 " + (this.state.input.reg_token.hasError() ? 'is-invalid' : '')} id="input_reg_token" placeholder="Registration Token" name='input_reg_token' defaultValue={this.state.input.reg_token + ''} />
                                                <label htmlFor="input_reg_token">Registration Token</label>
                                            </div>
                                        }
                                        <div className="form-floating mb-3">
                                            <input type='text' required className={"form-control rounded-3 " + (this.state.input.username.hasError() ? 'is-invalid' : '')} id="input_username" placeholder="Username" name='input_username' defaultValue={this.state.input.username + ''} />
                                            <label htmlFor="input_username">Username</label>
                                        </div>
                                        <div className="form-floating mb-3">
                                            <input type='email' required className={"form-control rounded-3 " + (this.state.input.email_address.hasError() ? 'is-invalid' : '')} id="input_email_address" placeholder="Email Address" name='input_email_address' defaultValue={this.state.input.email_address + ''} />
                                            <label htmlFor="input_email_address">Email Address</label>
                                        </div>
                                        <div className="form-floating mb-3">
                                            <input type="password" required className={"form-control rounded-3 " + (this.state.input.password.hasError() ? 'is-invalid' : '')} id="input_password" placeholder="Password" name='input_password' defaultValue={this.state.input.password + ''} />
                                            <label htmlFor="input_password">Password</label>
                                        </div>
                                        <div className="form-floating mb-3">
                                            <input type="password" required className={"form-control rounded-3 " + (this.state.input.password_confirmation.hasError() ? 'is-invalid' : '')} id="input_password_confirmation" placeholder="Password again" name='input_password_confirmation' defaultValue={this.state.input.password_confirmation + ''} />
                                            <label htmlFor="input_password_confirmation">Password again</label>
                                        </div>
                                        <div className="mb-3">
                                            {this.state.errors.map((error, key) => (
                                                <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                                            ))}
                                        </div><button className="w-100 mb-2 btn btn-lg rounded-3 btn-primary" disabled={this.state.btn_signup_working} type="submit" onClick={this.handleSubmit}>
                                            {this.state.btn_signup_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <span>Sign up</span>}
                                        </button>
                                        <small className="text-muted">By clicking Sign up, you agree to our <Link to='/terms-of-service' target='_blank'>Terms of service</Link> and confirm that you have read our <Link to='/privacy-policy' target='_blank'>Privacy Policy.</Link></small>
                                    </form>
                                </> : <>
                                    Sign up is momentarily disabled. Please check back after a while.
                            </>}
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
        sysconfig_params_data: state.sysconfig_params_data
    }
}

export default connect(mapStateToProps)(SignUpScreen)