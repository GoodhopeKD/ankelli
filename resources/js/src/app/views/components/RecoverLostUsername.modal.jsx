import React from 'react'
import { _User, _Input, _Notification } from 'app/controller';
import { Link } from "react-router-dom";

import withRouter from 'app/views/navigation/withRouter'

export default withRouter(class RecoverLostUsernameModal extends React.Component {

    id_prefix = 'get_lost_username_modal_'

    state = {
        btn_recover_username_working: false,
        input: {
            receiving_addon_name: 'email_address',
            receiving_addon_value: new _Input(),
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
        this.setState({ btn_recover_username_working: true })

        const btn_recover_username_working = false
        const errors = []
        const input = this.state.input

        if (!input.receiving_addon_value.isValid(input.receiving_addon_name)) { errors.push("Invalid " + (input.receiving_addon_name === 'email_address' ? 'email address' : 'phone number')) }

        if (errors.length === 0) {
            this.setState({ errors, input }) // Reload input error/success indicators on text/password/number inputs
            _User.getLostUsername(_Input.flatten(input))
                .then(() => {
                    _Notification.flash({ message: 'Username sent to provided  ' + (input.receiving_addon_name === 'email_address' ? 'email address' : 'phone number'), duration: 2000 })
                    if (this.props.component_context == "screen") {
                        this.props.navigate('/signin' + this.props.location.search)
                    } else {
                        bootstrap.Modal.getOrCreateInstance(document.getElementById('get_lost_username_modal')).hide()
                        bootstrap.Modal.getOrCreateInstance(document.getElementById('signin_modal')).show()
                    }
                })
                .catch((error) => {
                    if (error.request && error.request._response && error.request._response.errors && Object.keys(error.request._response.errors).length) {
                        Object.keys(error.request._response.errors).forEach(input_key => { error.request._response.errors[input_key].forEach(input_key_error => { errors.push(input_key_error) }) })
                    } else { errors.push(error.message) }
                    input.receiving_addon_value.clearValidation()
                    this.setState({ btn_recover_username_working, errors, input })
                })
        } else {
            this.setState({ btn_recover_username_working, errors, input })
        }
    }

    render() {
        return <div className="modal-dialog modal-dialog-centered" role="document">
            <div className="modal-content rounded-4 shadow">
                <div className="modal-header p-4 border-bottom-0">
                    <h3 className="fw-bold mb-0">Recover lost username</h3>
                </div>
                <div className="modal-body p-4 pt-0">
                    <p className="text-muted">Enter system registered {this.state.input.receiving_addon_name === "email_address" ? "email address" : "phone number"} to send the associated username to.</p>
                    <form onSubmit={e => { e.preventDefault(); this.handleSubmit() }}>
                        <div className="form-floating mb-3">
                            <input
                                type={this.state.input.receiving_addon_name === "email_address" ? "email" : 'tel'}
                                className={"form-control" + (this.state.input.receiving_addon_value.failedValidation() ? ' is-invalid' : '') + (this.state.input.receiving_addon_value.passedValidation() ? ' is-valid' : '')}
                                id={this.id_prefix + "input_receiving_addon_value"}
                                minLength={_Input.validation_param_lengths[this.state.input.receiving_addon_name].min_length}
                                maxLength={_Input.validation_param_lengths[this.state.input.receiving_addon_name].max_length}
                                value={this.state.input.receiving_addon_value + ''}
                                onChange={elem => this.handleInputChange('receiving_addon_value', elem.target.value)}
                                required
                                placeholder={this.state.input.receiving_addon_name === "email_address" ? "Email address" : "Phone number"}
                                style={{ paddingRight: 40 }}
                            />
                            <label htmlFor={this.id_prefix + "input_receiving_addon_value"}>{this.state.input.receiving_addon_name === "email_address" ? "Email address" : "Phone number (include country code)"}</label>
                        </div>
                        <div className="mb-3">
                            {this.state.errors.map((error, key) => (
                                <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                            ))}
                        </div>

                        <button className="w-100 mb-2 btn btn-lg rounded-3 btn-primary" disabled={this.state.btn_recover_username_working} type="submit" >
                            {this.state.btn_recover_username_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Get username</>}
                        </button>


                        {this.props.component_context == "screen" ? <>
                            <small className="text-muted">Click here to <Link to={'/accounts/auth/signin' + this.props.location.search}>sign in</Link>, <Link to={'/accounts/auth/signup' + this.props.location.search}>sign up</Link> or <Link to={'/accounts/recovery/generate_password_reset_token' + this.props.location.search} >reset lost password</Link>.</small>
                        </> : <>
                            <small className="text-muted">Click here to <Link to={'/#/accounts/auth/signin'} data-bs-target="#signin_modal" data-bs-toggle="modal" >sign in</Link>, <Link to={'/#/accounts/auth/signup'} data-bs-target="#signup_modal" data-bs-toggle="modal" >sign up</Link> or <Link to={'/#/accounts/recovery/generate_password_reset_token'} data-bs-target="#generate_password_reset_token_modal" data-bs-toggle="modal">reset lost password</Link>.</small>
                        </>}
                    </form>
                </div>
            </div>
        </div>
    }
})