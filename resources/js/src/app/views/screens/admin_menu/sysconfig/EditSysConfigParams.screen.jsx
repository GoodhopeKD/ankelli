import React from "react"
import { connect } from 'react-redux'

import SideBar from 'app/views/components/SideBar'

import { _User, _PrefItem, _Input, _Notification } from 'app/controller'

class EditSysConfigParamsScreen extends React.Component {

    default_input = {
        password: new _Input('Def-Pass#123'),
        update_note: new _Input('Maintenance'),
    }
    state = {
        sysconfig_params: [],
        sysconfig_params_enum_options: [],
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

    componentDidMount = async () => {
        await _PrefItem.getSysConfigParams()
            .then(resp => this.setState({ sysconfig_params: resp.data }))

        await _PrefItem.getSysConfigParamsEnumOptions()
            .then(resp => this.setState({ sysconfig_params_enum_options: resp.data }))
    }

    render() {

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-xl py-3">
                <div className="row">
                    <div className="col-lg-2">
                        <SideBar nav_menus={[this.props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />
                    </div>
                    <div className="col-lg-10">

                        <h5>Edit System Configuration parameters</h5>
                        <hr />

                        <div className="table-responsive">
                            <table className="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Param name</th>
                                        <th scope="col" style={{ minWidth: 115 }}>Current value</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {(this.state.sysconfig_params.length > 0 && this.state.sysconfig_params_enum_options.length > 0) ? (
                                        this.state.sysconfig_params.map((param, index) => {

                                            const value_modified = window.isset(this.state.input[param.key_slug]) && (this.state.input[param.key_slug] + '' != param.value + '')

                                            return <tr key={index} >
                                                <td className="align-middle">{param.key_name}</td>
                                                <td className="align-middle">
                                                    {param.value_type == "boolean" && <>
                                                        <div className="form-check form-switch d-flex">
                                                            <input className="form-check-input" type="checkbox" role="switch"
                                                                checked={param.value}
                                                                onChange={() => { }}
                                                            />
                                                        </div>
                                                    </>}
                                                    {param.value_type.includes('enum:') && <>
                                                        {this.state.sysconfig_params_enum_options.find(option => option.slug == param.value_type.split('enum:')[1]).options.find(option => option.slug == param.value).name}
                                                    </>}
                                                    {(param.value_type == 'integer' || param.value_type == 'float') && <>
                                                        <span className="form-control form-control-sm text-center" style={{ maxWidth: 100 }}>{param.value}</span>
                                                    </>}
                                                </td>
                                                <td className="align-middle">

                                                    <button type="button" className='btn btn-sm btn-primary' data-bs-toggle="modal" data-bs-target={"#sysconfig_param_" + index}>Modify</button>

                                                    <div className="modal fade" id={"sysconfig_param_" + index} tabIndex="-1" >
                                                        <div className="modal-dialog modal-dialog-centered">
                                                            <div className="modal-content">
                                                                <div className="modal-header">
                                                                    <h5 className="modal-title" >Modify system param</h5>
                                                                    <button type="button" className="btn-close" data-bs-dismiss="modal"></button>
                                                                </div>
                                                                <form
                                                                    onSubmit={e => {
                                                                        e.preventDefault();
                                                                        this.setState({ btn_modify_param_working: true })
                                                                        const errors = []
                                                                        const _input = _Input.flatten(this.state.input);
                                                                        (new _PrefItem(param)).sysConfigParamUpdate({ value: _input[param.key_slug], value_type: param.value_type }, _input.update_note, _input.password)
                                                                            .then(() => {
                                                                                bootstrap.Modal.getOrCreateInstance(document.getElementById("sysconfig_param_" + index)).hide()
                                                                                _Notification.flash({ message: 'Param updated!', duration: 2000 })
                                                                                this.setState({ input: _.cloneDeep(this.default_input), btn_modify_param_working: false, errors: [] })
                                                                                this.componentDidMount()
                                                                            })
                                                                            .catch((error) => {
                                                                                if (error.request && error.request._response && error.request._response.errors && Object.keys(error.request._response.errors).length) {
                                                                                    Object.keys(error.request._response.errors).forEach(input_key => { error.request._response.errors[input_key].forEach(input_key_error => { errors.push(input_key_error) }) })
                                                                                } else { errors.push(error.message) }
                                                                                this.setState({ btn_modify_param_working: false, errors })
                                                                            })
                                                                    }}
                                                                >
                                                                    <div className="modal-body">
                                                                        <div className="mb-3">

                                                                            {param.value_type == "boolean" && <>
                                                                                <div className="d-flex form-control">
                                                                                    <label htmlFor={"input_param_" + index} className="col">{param.key_name}</label>
                                                                                    <div className="col form-check form-switch d-flex justify-content-end">
                                                                                        <input
                                                                                            type="checkbox"
                                                                                            className="form-check-input"
                                                                                            id={"input_param_" + index}
                                                                                            checked={window.isset(this.state.input[param.key_slug]) ? this.state.input[param.key_slug] : param.value}
                                                                                            onChange={elem => this.handleInputChange(param.key_slug, elem.target.checked, true)}
                                                                                        />
                                                                                    </div>
                                                                                </div>
                                                                            </>}

                                                                            {param.value_type.includes('enum:') && <>
                                                                                <label htmlFor={"input_param_" + index}>{param.key_name}</label>
                                                                                <select
                                                                                    className="form-select"
                                                                                    id={"input_param_" + index}
                                                                                    value={this.state.input[param.key_slug] ?? param.value}
                                                                                    onChange={elem => this.handleInputChange(param.key_slug, elem.target.value, true)}
                                                                                >
                                                                                    {this.state.sysconfig_params_enum_options.find(option => option.slug == param.value_type.split('enum:')[1]).options.map((option, sub_index) => {
                                                                                        return <option key={index + '-' + sub_index} value={option.slug} >{option.name}</option>
                                                                                    })}
                                                                                </select>
                                                                            </>}

                                                                            {(param.value_type == 'integer' || param.value_type == 'float') && <>
                                                                                <label htmlFor={"input_param_" + index}>{param.key_name}</label>
                                                                                <input
                                                                                    type='number'
                                                                                    className="form-control"
                                                                                    id={"input_param_" + index}
                                                                                    value={(this.state.input[param.key_slug] ?? param.value) + ''}
                                                                                    onChange={elem => this.handleInputChange(param.key_slug, elem.target.value)}
                                                                                />
                                                                            </>}
                                                                        </div>

                                                                        <div className="mb-3">
                                                                            <label htmlFor={"input_update_note_" + index}>Enter an update note</label>
                                                                            <input
                                                                                type="text"
                                                                                className={"form-control"}
                                                                                id={"input_update_note_" + index}
                                                                                value={this.state.input.update_note + ''}
                                                                                onChange={elem => this.handleInputChange('update_note', elem.target.value)}
                                                                                required
                                                                                disabled={!value_modified}
                                                                                placeholder="Update note"
                                                                                style={{ paddingRight: 70 }}
                                                                            />
                                                                        </div>

                                                                        <div>
                                                                            <label htmlFor={"input_password_" + index}>Enter your password to confirm update</label>
                                                                            <input
                                                                                type="password"
                                                                                className={"form-control"}
                                                                                id={"input_password_" + index}
                                                                                value={this.state.input.password + ''}
                                                                                onChange={elem => this.handleInputChange('password', elem.target.value)}
                                                                                required
                                                                                disabled={!value_modified}
                                                                                placeholder="Password"
                                                                                style={{ paddingRight: 70 }}
                                                                            />
                                                                            <span className="btn btn-sm" style={{ position: 'absolute', bottom: 20, right: 20 }} onClick={() => document.getElementById("input_password_" + index).setAttribute('type', document.getElementById("input_password_" + index).getAttribute('type') == 'text' ? 'password' : 'text')}>𓁹</span>
                                                                        </div>

                                                                        {this.state.errors.length > 0 && (<div className="mt-3">
                                                                            {this.state.errors.map((error, key) => (
                                                                                <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                                                                            ))}
                                                                        </div>)}

                                                                    </div>

                                                                    <div className="modal-footer justify-content-between">
                                                                        <button type="button" className="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                                        <button type="submit" className="btn btn-primary" formNoValidate={param.value_type == 'float'} disabled={this.state.btn_modify_param_working || !value_modified} >
                                                                            {this.state.btn_modify_param_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Update</>}
                                                                        </button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        })
                                    ) : (
                                        <tr>
                                            <td colSpan="20">
                                                <div style={{ alignItems: 'center' }} className='d-grid'>
                                                    <div className="spinner-grow text-danger" style={{ justifySelf: 'center', width: 38, height: 38 }}></div>
                                                </div>
                                            </td>
                                        </tr>
                                    )}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </this.props.PageWrapper>
    }
}

const mapStateToProps = (state) => {
    return {
        sysconfig_params: state.sysconfig_params_data,
        auth_user: state.auth_user_data ? new _User(state.auth_user_data) : null,
    }
}

export default connect(mapStateToProps)(EditSysConfigParamsScreen)