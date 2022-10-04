import React from 'react'
import { Link } from "react-router-dom";

import { _User, _Input, _Notification } from 'app/controller';
import withRouter from 'app/views/navigation/withRouter'

export default withRouter(class ResetLostPasswordModal extends React.Component {

    id_prefix = 'reset_lost_password_modal_'

    state = {
        btn_reset_password_working: false,
        input: {
            username: new _Input(this.props.params.username),
            password_reset_token: new _Input(this.props.params.password_reset_token),
            password: new _Input(),
            password_confirmation: new _Input(),
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

        this.setState({ btn_reset_password_working: true })

        const btn_reset_password_working = false
        const errors = []
        const input = this.state.input

        if (!input.username.isValid('username')) { errors.push("Invalid username") }
        if (!input.password_reset_token.isValid('verif_token')) { errors.push("Invalid password reset token") }
        if (!input.password.isValid('password')) { errors.push("Password should have: at least 8 characters; at least 1 of: numbers, uppercase, lowercase characters") }
        if (!input.password_confirmation.matches(input.password.toString())) { errors.push("Passwords Mismatch") }

        if (errors.length === 0) {
            this.setState({ errors, input }) // Reload input error/success indicators on text/password/number inputs
            _User.resetLostPassword(_Input.flatten(input))
                .then(() => {
                    _Notification.flash({ message: 'Password reset successful! Proceed to sign in', duration: 750 });
                    if (this.props.component_context == "screen") {
                        this.props.navigate('/signin' + this.props.location.search)
                    } else {
                        bootstrap.Modal.getOrCreateInstance(document.getElementById('reset_lost_password_modal')).hide()
                        bootstrap.Modal.getOrCreateInstance(document.getElementById('signin_modal')).show()
                    }
                })
                .catch((error) => {
                    if (error.request && error.request._response && error.request._response.errors && Object.keys(error.request._response.errors).length) {
                        Object.keys(error.request._response.errors).forEach(input_key => { error.request._response.errors[input_key].forEach(input_key_error => { errors.push(input_key_error) }) })
                    } else { errors.push(error.message) }
                    input.username.clearValidation()
                    input.password_reset_token.clearValidation()
                    input.password.clearValidation()
                    input.password_confirmation.clearValidation()
                    this.setState({ btn_reset_password_working, errors })
                })
        } else {
            this.setState({ btn_reset_password_working, errors, input })
        }
    }

    render() {
        return <div className="modal-dialog modal-dialog-centered" role="document">
            <div className="modal-content rounded-4 shadow">
                <div className="modal-header p-4 border-bottom-0">
                    <h3 className="fw-bold mb-0">Reset lost password</h3>
                </div>
                <div className="modal-body p-4 pt-0">
                    <p className="text-muted">Enter your username, password reset token received and new password.</p>
                    <form onSubmit={e => { e.preventDefault(); this.handleSubmit() }}>
                        <div className="form-floating mb-3">
                            <input
                                type='text'
                                className={"form-control" + (this.state.input.username.failedValidation() ? ' is-invalid' : '') + (this.state.input.username.passedValidation() ? ' is-valid' : '')}
                                id={this.id_prefix + "input_username"}
                                minLength={_Input.validation_param_lengths.username.min_length}
                                maxLength={_Input.validation_param_lengths.username.max_length}
                                value={this.state.input.username + ''}
                                onChange={elem => this.handleInputChange('username', elem.target.value)}
                                required
                                placeholder="Username"
                            />
                            <label htmlFor={this.id_prefix + "input_username"}>Username</label>
                        </div>
                        <div className="form-floating mb-3">
                            <input
                                type='text'
                                className={"form-control" + (this.state.input.password_reset_token.failedValidation() ? ' is-invalid' : '') + (this.state.input.password_reset_token.passedValidation() ? ' is-valid' : '')}
                                id={this.id_prefix + "input_password_reset_token"}
                                minLength={_Input.validation_param_lengths.verif_token.min_length}
                                maxLength={_Input.validation_param_lengths.verif_token.max_length}
                                value={this.state.input.password_reset_token + ''}
                                onChange={elem => this.handleInputChange('password_reset_token', elem.target.value)}
                                required
                                placeholder="Password reset token"
                            />
                            <label htmlFor={this.id_prefix + "input_password_reset_token"}>Token</label>
                        </div>
                        <div className="form-floating mb-3">
                            <input
                                type="password"
                                className={"form-control" + (this.state.input.password.failedValidation() ? ' is-invalid' : '') + (this.state.input.password.passedValidation() ? ' is-valid' : '')}
                                id={this.id_prefix + "input_password"}
                                minLength={_Input.validation_param_lengths.password.min_length}
                                maxLength={_Input.validation_param_lengths.password.max_length}
                                value={this.state.input.password + ''}
                                onChange={elem => this.handleInputChange('password', elem.target.value)}
                                required
                                placeholder="Password"
                                style={{ paddingRight: 40 }}
                            />
                            <span className="btn btn-sm" style={{ position: 'absolute', top: 13, right: 2 }} onClick={() => document.getElementById(this.id_prefix + 'input_password').setAttribute('type', document.getElementById(this.id_prefix + 'input_password').getAttribute('type') == 'text' ? 'password' : 'text')}>𓁹</span>
                            <label htmlFor={this.id_prefix + "input_password"}>Password</label>
                        </div>
                        <div className="form-floating mb-3">
                            <input
                                type="password"
                                className={"form-control" + (this.state.input.password_confirmation.failedValidation() ? ' is-invalid' : '') + (this.state.input.password_confirmation.passedValidation() ? ' is-valid' : '')}
                                id={this.id_prefix + "input_password_confirmation"}
                                minLength={_Input.validation_param_lengths.password.min_length}
                                maxLength={_Input.validation_param_lengths.password.max_length}
                                value={this.state.input.password_confirmation + ''}
                                onChange={elem => this.handleInputChange('password_confirmation', elem.target.value)}
                                required
                                placeholder="Password again"
                                style={{ paddingRight: 40 }}
                            />
                            <span className="btn btn-sm" style={{ position: 'absolute', top: 13, right: 2 }} onClick={() => document.getElementById(this.id_prefix + 'input_password_confirmation').setAttribute('type', document.getElementById(this.id_prefix + 'input_password_confirmation').getAttribute('type') == 'text' ? 'password' : 'text')}>𓁹</span>
                            <label htmlFor={this.id_prefix + "input_password_confirmation"}>Password again</label>
                        </div>

                        <div className="mb-3">
                            {this.state.errors.map((error, key) => (
                                <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                            ))}
                        </div>

                        <button className="w-100 mb-2 btn btn-lg rounded-3 btn-primary" disabled={this.state.btn_reset_password_working} type="submit" >
                            {this.state.btn_reset_password_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <span>Set new password</span>}
                        </button>

                        {this.props.component_context == "screen" ? <>
                            <small className="text-muted">Click here to <Link to={'/accounts/auth/signin' + this.props.location.search}>sign in</Link>, <Link to={'/accounts/auth/signup' + this.props.location.search}>sign up</Link> or <Link to={'/accounts/recovery/get_lost_username' + this.props.location.search} >recover lost username</Link>.</small>
                        </> : <>
                            <small className="text-muted">Click here to <Link to={'/#/accounts/auth/signin'} data-bs-target="#signin_modal" data-bs-toggle="modal" >sign in</Link>, <Link to={'/#/accounts/auth/signup'} data-bs-target="#signup_modal" data-bs-toggle="modal" >sign up</Link> or <Link to={'/#/accounts/recovery/get_lost_username'} data-bs-target="#get_lost_username_modal" data-bs-toggle="modal">recover lost username</Link>.</small>
                        </>}
                    </form>
                </div>
            </div>
        </div>
    }
})