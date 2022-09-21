import React from 'react'
import { _User, _Input, _Notification } from 'app/controller';
import { Link } from "react-router-dom";

import withRouter from 'app/views/navigation/withRouter'

const DEBUG = true

const debug_users = {
    // Default System administrator, Cannot buy, sell, manage products or orders; can only manage system features
    'sysadmin': {
        username: 'sysadmin',
        password: 'Def-Pass#123'
    },
    // Personal Account with access to all features
    'guddaz': {
        username: 'guddaz',
        password: 'Def-Pass#123'
    },
}

export default withRouter(class SignInModal extends React.Component {

    state = {
        btn_signin_working: false,
        input: {
            username: new _Input(_Input.debug_form_autofill(DEBUG, debug_users['guddaz'].username)),
            password: new _Input(_Input.debug_form_autofill(DEBUG, debug_users['guddaz'].password)),
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

    handleSubmit = () => {
        this.setState({ btn_signin_working: true })

        const btn_signin_working = false
        const errors = []
        const input = this.state.input

        if (!input.username.isValid('username')) { errors.push("Invalid username") }
        if (!input.password.isValid('password')) { errors.push("Invalid password") }

        if (errors.length === 0) {
            this.setState({ errors, input }) // Reload input error/success indicators on text/password/number inputs
            const signin_modal = bootstrap.Modal.getOrCreateInstance(document.querySelector('#signin_modal'));
            _User.signIn(_Input.flatten(input)).then(() => { signin_modal.hide(); _Notification.flash({ message: 'Sign in successful!', duration: 750 }) })
                .catch((error) => {
                    if (error.request && error.request._response && error.request._response.errors && Object.keys(error.request._response.errors).length) {
                        Object.keys(error.request._response.errors).forEach(input_key => { error.request._response.errors[input_key].forEach(input_key_error => { errors.push(input_key_error) }) })
                    } else { errors.push(error.message) }
                    input.username.clearValidation()
                    input.password.clearValidation()
                    this.setState({ btn_signin_working, errors, input })
                })
        } else {
            this.setState({ btn_signin_working, errors, input })
        }
    }

    render() {
        return <div className="modal-dialog modal-dialog-centered" role="document">
            <div className="modal-content rounded-4 shadow">
                <div className="modal-header p-4 border-bottom-0">
                    <h2 className="fw-bold mb-0">Sign in</h2>
                </div>
                <div className="modal-body p-4 pt-0">
                    <form onSubmit={e => { e.preventDefault(); this.handleSubmit() }}>
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
                        <div className="text-center mb-3">
                            <input type="checkbox" className='mx-1' id="input_remember_me" name='input_remember_me' />
                            <label htmlFor="input_remember_me"> Remember me</label>
                        </div>
                        <div className="mb-3">
                            {this.state.errors.map((error, key) => (
                                <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                            ))}
                        </div>
                        <button className="w-100 mb-2 btn btn-lg rounded-3 btn-primary" disabled={this.state.btn_signin_working} type="submit" >
                            {this.state.btn_signin_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Sign in</>}
                        </button>

                        {this.props.component_context == "screen" ? <>
                            <small className="text-muted">New to ankelli? Click here to <Link to={'/signup' + this.props.location.search}>sign up</Link>.</small><br />
                            <small className="text-muted">Click here if you <Link to={'/reset_lost_password' + this.props.location.search}>forgot password</Link> or <Link to={'/recover_lost_username' + this.props.location.search} >forgot username</Link>.</small>
                        </> : <>
                            <small className="text-muted">New to ankelli? Click here to <Link to={'/#/signup'} data-bs-target="#signup_modal" data-bs-toggle="modal" >sign up</Link>.</small><br />
                            <small className="text-muted">Click here if you <Link to={'/#/reset_lost_password'} data-bs-target="#reset_lost_password_modal" data-bs-toggle="modal">forgot password</Link> or <Link to={'/#/recover_lost_username'} data-bs-target="#recover_lost_username_modal" >forgot username</Link>.</small>
                        </>}
                    </form>
                </div>
            </div>
        </div>
    }
})