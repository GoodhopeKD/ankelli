import React from 'react'
import { _User, _Input, _Notification } from 'app/controller';
import { Link } from "react-router-dom";

import withRouter from 'app/views/navigation/withRouter'

export default withRouter(class GeneratePasswordResetTokenModal extends React.Component {

    id_prefix = 'generate_password_reset_token_modal_'

    state = {
        btn_generate_token_working: false,
        input: {
            username: new _Input(),
            recipient_addon_name: 'email_address',
            recipient_addon_value: new _Input(),
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
        this.setState({ btn_generate_token_working: true })

        const btn_generate_token_working = false
        const errors = []
        const input = this.state.input

        if (!input.username.isValid('username')) { errors.push("Invalid username") }
        if (!input.recipient_addon_value.isValid(input.recipient_addon_name)) { errors.push('Invalid ' + (input.recipient_addon_name === 'email_address' ? 'email address' : 'phone number')) }

        if (errors.length === 0) {
            this.setState({ errors, input }) // Reload input error/success indicators on text/password/number inputs
            _User.generatePasswordResetToken(_Input.flatten(input))
                .then(() => {
                    _Notification.flash({ message: 'Token sent to provided  ' + (input.recipient_addon_name === 'email_address' ? 'email address' : 'phone number'), duration: 2000 })
                    if (this.props.component_context == "screen") {
                        this.props.navigate('/recovery/reset_lost_password' + this.props.location.search)
                    } else {
                        bootstrap.Modal.getOrCreateInstance(document.getElementById('generate_password_reset_token_modal')).hide()
                        bootstrap.Modal.getOrCreateInstance(document.getElementById('reset_lost_password_modal')).show()
                    }
                })
                .catch((error) => {
                    if (error.request && error.request._response && error.request._response.errors && Object.keys(error.request._response.errors).length) {
                        Object.keys(error.request._response.errors).forEach(input_key => { error.request._response.errors[input_key].forEach(input_key_error => { errors.push(input_key_error) }) })
                    } else { errors.push(error.message) }
                    input.username.clearValidation()
                    input.recipient_addon_value.clearValidation()
                    this.setState({ btn_generate_token_working, errors, input })
                })
        } else {
            this.setState({ btn_generate_token_working, errors, input })
        }
    }

    render() {
        return <div className="modal-dialog modal-dialog-centered" role="document">
            <div className="modal-content rounded-4 shadow">
                <div className="modal-header p-4 border-bottom-0">
                    <h3 className="fw-bold mb-0">Generate password reset token</h3>
                </div>
                <div className="modal-body p-4 pt-0">
                    <p className="text-muted">Enter your username and user associated {this.state.input.recipient_addon_name === "email_address" ? "email address" : "phone number"} to send the token to.</p>
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
                                type={this.state.input.recipient_addon_name === "email_address" ? "email" : 'tel'}
                                className={"form-control" + (this.state.input.recipient_addon_value.failedValidation() ? ' is-invalid' : '') + (this.state.input.recipient_addon_value.passedValidation() ? ' is-valid' : '')}
                                id={this.id_prefix + "input_recipient_addon_value"}
                                minLength={_Input.validation_param_lengths[this.state.input.recipient_addon_name].min_length}
                                maxLength={_Input.validation_param_lengths[this.state.input.recipient_addon_name].max_length}
                                value={this.state.input.recipient_addon_value + ''}
                                onChange={elem => this.handleInputChange('recipient_addon_value', elem.target.value)}
                                required
                                placeholder={this.state.input.recipient_addon_name === "email_address" ? "Email address" : "Phone number"}
                                style={{ paddingRight: 40 }}
                            />
                            <label htmlFor={this.id_prefix + "input_recipient_addon_value"}>{this.state.input.recipient_addon_name === "email_address" ? "Email address" : "Phone number (include country code)"}</label>
                        </div>
                        <div className="mb-3">
                            {this.state.errors.map((error, key) => (
                                <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                            ))}
                        </div>
                        <div className="row">
                            <div className="col pe-2">
                                <button className="w-100 mb-2 btn btn-lg rounded-3 btn-primary" disabled={this.state.btn_generate_token_working} type="submit" >
                                    {this.state.btn_generate_token_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Generate token</>}
                                </button>
                            </div>
                            <div className="col ps-2">
                                {this.props.component_context == "screen" ? <>
                                    <Link className="w-100 mb-2 btn btn-lg rounded-3 btn-success" to={'/accounts/recovery/reset_lost_password' + this.props.location.search}>Already have token</Link>
                                </> : <>
                                    <Link className="w-100 mb-2 btn btn-lg rounded-3 btn-success" to={'/#/accounts/recovery/reset_lost_password'} data-bs-target="#reset_lost_password_modal" data-bs-toggle="modal" >Already have token</Link>
                                </>}
                            </div>
                        </div>


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