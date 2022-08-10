import React from 'react'
import { _User, _Input, _Notification } from 'app/controller';
import { Link } from "react-router-dom";

const DEBUG = true

const debug_users = {
    // Default System administrator, Cannot buy, sell, manage products or orders; can only manage system features
    'sysadmin': {
        username: 'sysadmin',
        password: 'Ank3ll1#1'
    },
    // Personal Account with access to all features
    'hopekd01': {
        username: 'hopekd01',
        password: 'Password#123'
    },
}

export default class SignInScreen extends React.Component {

    state = {
        btn_signin_working: false,
        input: {
            username: new _Input(_Input.debug_form_autofill(DEBUG, debug_users['sysadmin'].username)),
            password: new _Input(_Input.debug_form_autofill(DEBUG, debug_users['sysadmin'].password)),
        },
        errors: [],
    };

    handleInputChange(field, value) {
        let input = this.state.input
        input[field] = new _Input(value)
        this.setState({ input })
    }

    handleSubmit = () => {
        this.handleInputChange('username', document.getElementById('input_username').value)
        this.handleInputChange('password', document.getElementById('input_password').value)
        this.setState({ btn_signin_working: true })

        const btn_signin_working = false
        const errors = []
        const input = this.state.input

        if (!input.username.isValid('username')) { errors.push("Invalid username") }
        if (!input.password.isValid('password')) { errors.push("Invalid password") }

        if (errors.length === 0) {

            this.setState({ errors }) // Remove input error indicators under text inputs
            const _input = Object.assign(Object.create(Object.getPrototypeOf(input)), input) // Dereference input object
            Object.keys(_input).forEach(key => { if (_input[key] instanceof _Input) _input[key] = _input[key] + "" }) // convert _Input instances to Text

            _User.signIn(_input).then(() => _Notification.create({ dest: 'flash', content: { body: 'Sign in successful!', data: { flash_duration: 750 } } }))
                .catch((error) => {
                    errors.push(error.message)
                    this.setState({ btn_signin_working, errors })
                })
        } else {
            this.setState({ btn_signin_working, errors, input })
        }
    }

    render() {
        return <div className="container">
            <div className="modal py-2 position-static d-block">
                <div className="modal-dialog" role="document">
                    <div className="modal-content rounded-4 shadow">
                        <div className="modal-header p-4 border-bottom-0">
                            <h2 className="fw-bold mb-0">Sign in</h2>
                        </div>
                        <div className="modal-body p-4 pt-0">
                            <form className="" onSubmit={e => e.preventDefault()}>
                                <div className="form-floating mb-3">
                                    <input type='text' required className={"form-control rounded-3 " + (this.state.input.username.hasError() ? 'is-invalid' : '')} id="input_username" placeholder="Username" name='input_username' defaultValue={this.state.input.username + ''} />
                                    <label htmlFor="input_username">Username</label>
                                </div>
                                <div className="form-floating mb-3">
                                    <input type="password" required className={"form-control rounded-3 " + (this.state.input.password.hasError() ? 'is-invalid' : '')} id="input_password" placeholder="Password" name='input_password' defaultValue={this.state.input.password + ''} />
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
                                <button className="w-100 mb-2 btn btn-lg rounded-3 btn-primary" disabled={this.state.btn_signin_working} type="submit" onClick={this.handleSubmit}>
                                    {this.state.btn_signin_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <span>Sign in</span>}
                                </button>
                                <small className="text-muted">Click here if you <Link to='/reset_lost_password'>forgot password</Link> or <Link to='/recover_lost_username' >forgot username</Link>.</small>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    }
}