import React from "react"
import { connect } from 'react-redux'
import _ from 'lodash'

import { _User, _Input, _Notification } from 'app/controller'

import SideBar from 'app/views/components/SideBar'

class UpdatePasswordScreen extends React.Component {

    default_input = {
        current_password: new _Input(),
        new_password: new _Input(),
        new_password_confirmation: new _Input(),
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

        this.setState({ btn_update_password_working: true })

        const btn_update_password_working = false
        const errors = []
        const input = this.state.input

        if (!input.new_password.isValid('password')) { errors.push("Password should have: at least 8 characters; at least 1 of: numbers, uppercase, lowercase characters") }
        if (!input.new_password.differsFrom(input.current_password.toString())) { errors.push("Current and new passwords should not be the same") }
        if (!input.new_password_confirmation.matches(input.new_password.toString())) { errors.push("New passwords mismatch") }

        if (errors.length === 0) {
            this.setState({ errors, input }) // Reload input error/success indicators on text/password/number inputs
            this.props.auth_user.updatePassword(_Input.flatten(input)).then(() => { _Notification.flash({ message: 'Password update successful!', duration: 750 }), this.setState({ input: _.cloneDeep(this.default_input), btn_update_password_working: false }) })
                .catch((error) => {
                    if (error.request && error.request._response && error.request._response.errors && Object.keys(error.request._response.errors).length) {
                        Object.keys(error.request._response.errors).forEach(input_key => { error.request._response.errors[input_key].forEach(input_key_error => { errors.push(input_key_error) }) })
                    } else { errors.push(error.message) }
                    input.new_password.clearValidation()
                    input.new_password_confirmation.clearValidation()
                    this.setState({ btn_update_password_working, errors, input })
                })
        } else {
            this.setState({ btn_update_password_working, errors, input })
        }
    }

    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-xl py-3">
                <div className="row">
                    <div className="col-lg-2">
                        <SideBar nav_menus={this.props.nav_menus.filter(menu => menu.slug === 'accounts_menu')} />
                    </div>
                    <div className="col-lg-10">

                        <div className="row justify-content-center">
                            <div className="col-md-8 col-lg-6">
                                <h3 className="fw-bold">Update password</h3>
                                <br />
                                <form onSubmit={e => { e.preventDefault(); this.handleSubmit() }}>
                                    <div className="form-floating mb-3">
                                        <input
                                            type="password"
                                            className={"form-control" + (this.state.input.current_password.failedValidation() ? ' is-invalid' : '') + (this.state.input.current_password.passedValidation() ? ' is-valid' : '')}
                                            id={this.id_prefix + "input_current_password"}
                                            minLength={_Input.validation_param_lengths.password.min_length}
                                            maxLength={_Input.validation_param_lengths.password.max_length}
                                            value={this.state.input.current_password + ''}
                                            onChange={elem => this.handleInputChange('current_password', elem.target.value)}
                                            required
                                            placeholder="Current password"
                                            style={{ paddingRight: 40 }}
                                        />
                                        <span className="btn btn-sm" style={{ position: 'absolute', top: 13, right: 2 }} onClick={() => document.getElementById(this.id_prefix + 'input_current_password').setAttribute('type', document.getElementById(this.id_prefix + 'input_current_password').getAttribute('type') == 'text' ? 'password' : 'text')}>𓁹</span>
                                        <label htmlFor={this.id_prefix + "input_current_password"}>Current password</label>
                                    </div>
                                    <div className="form-floating mb-3">
                                        <input
                                            type="password"
                                            className={"form-control" + (this.state.input.new_password.failedValidation() ? ' is-invalid' : '') + (this.state.input.new_password.passedValidation() ? ' is-valid' : '')}
                                            id={this.id_prefix + "input_new_password"}
                                            minLength={_Input.validation_param_lengths.password.min_length}
                                            maxLength={_Input.validation_param_lengths.password.max_length}
                                            value={this.state.input.new_password + ''}
                                            onChange={elem => this.handleInputChange('new_password', elem.target.value)}
                                            required
                                            placeholder="New password"
                                            style={{ paddingRight: 40 }}
                                        />
                                        <span className="btn btn-sm" style={{ position: 'absolute', top: 13, right: 2 }} onClick={() => document.getElementById(this.id_prefix + 'input_new_password').setAttribute('type', document.getElementById(this.id_prefix + 'input_new_password').getAttribute('type') == 'text' ? 'password' : 'text')}>𓁹</span>
                                        <label htmlFor={this.id_prefix + "input_new_password"}>New password</label>
                                    </div>
                                    <div className="form-floating mb-3">
                                        <input
                                            type="password"
                                            className={"form-control" + (this.state.input.new_password_confirmation.failedValidation() ? ' is-invalid' : '') + (this.state.input.new_password_confirmation.passedValidation() ? ' is-valid' : '')}
                                            id={this.id_prefix + "input_new_password_confirmation"}
                                            minLength={_Input.validation_param_lengths.password.min_length}
                                            maxLength={_Input.validation_param_lengths.password.max_length}
                                            value={this.state.input.new_password_confirmation + ''}
                                            onChange={elem => this.handleInputChange('new_password_confirmation', elem.target.value)}
                                            required
                                            placeholder="Password again"
                                            style={{ paddingRight: 40 }}
                                        />
                                        <span className="btn btn-sm" style={{ position: 'absolute', top: 13, right: 2 }} onClick={() => document.getElementById(this.id_prefix + 'input_new_password_confirmation').setAttribute('type', document.getElementById(this.id_prefix + 'input_new_password_confirmation').getAttribute('type') == 'text' ? 'password' : 'text')}>𓁹</span>
                                        <label htmlFor={this.id_prefix + "input_new_password_confirmation"}>New password again</label>
                                    </div>

                                    <div className="mb-3">
                                        {this.state.errors.map((error, key) => (
                                            <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                                        ))}
                                    </div>

                                    <button className="w-100 mb-2 btn btn-lg rounded-3 btn-primary" disabled={this.state.btn_update_password_working} type="submit" >
                                        {this.state.btn_update_password_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <span>Set new password</span>}
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
        auth_user: state.auth_user_data ? new _User(state.auth_user_data) : null,
    }
}

export default connect(mapStateToProps)(UpdatePasswordScreen)