import React from "react"
import { connect } from 'react-redux'

import SideBar from 'app/views/components/SideBar'

import { _User, _PrefItem } from 'app/controller'

class EditSysConfigParamsScreen extends React.Component {

    state = {
        sysconfig_params: [],
        sysconfig_params_enum_options: [],
    }

    componentDidMount = async () => {
        await _PrefItem.getSysConfigParams()
            .then(resp => this.setState({ sysconfig_params: resp.data }))

        await _PrefItem.getSysConfigParamsEnumOptions()
            .then(resp => this.setState({ sysconfig_params_enum_options: resp.data }))
    }

    render() {

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-fluid py-3">
                <div className="row">
                    <div className="col-2">
                        <SideBar nav_menus={[this.props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />
                    </div>
                    <div className="col-10">
                        {(this.state.sysconfig_params.length > 0 && this.state.sysconfig_params_enum_options.length > 0) ? (
                            <table className="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Param name</th>
                                        <th scope="col">Current value</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {this.state.sysconfig_params.map((param, index) => {
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
                                                            <div className="modal-body">
                                                                <div className="mb-3">
                                                                    {param.value_type == "boolean" && <>
                                                                        <label htmlFor={"input_param_" + index}>{param.key_name}</label>
                                                                        <div className="form-check form-switch d-flex justify-content-center">
                                                                            <input
                                                                                type="checkbox"
                                                                                className="form-check-input"
                                                                                id={"input_param_" + index}
                                                                                //checked={param.value}
                                                                                //onChange={() => { }}
                                                                                defaultChecked={param.value}
                                                                            />
                                                                        </div>
                                                                    </>}
                                                                    {param.value_type.includes('enum:') && <>
                                                                        <label htmlFor={"input_param_" + index}>{param.key_name}</label>
                                                                        <select
                                                                            className="form-select"
                                                                            id={"input_param_" + index}
                                                                            //value={this.state.input.offer_to}
                                                                            //onChange={rr => this.handleInputChange('offer_to', rr.target.value, true)}
                                                                            defaultValue={param.value}
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
                                                                            //value={this.state.input.token + ''}
                                                                            //onChange={e => this.handleInputChange('token', e.target.value)}
                                                                            defaultValue={param.value}
                                                                        />
                                                                    </>}
                                                                </div>
                                                                <div >
                                                                    <label htmlFor={"input_password_" + index}>Enter your password to confirm update</label>
                                                                    <input
                                                                        type="password"
                                                                        className={"form-control"}
                                                                        id={"input_password_" + index}
                                                                        //value={this.state.input.password + ''}
                                                                        //onChange={e => this.handleInputChange('password', e.target.value)}
                                                                        required
                                                                        placeholder="Password"
                                                                        style={{ paddingRight: 70 }}
                                                                    />
                                                                    <button className="btn d-none" type="button" style={{ position: 'absolute', top: 10, right: 10 }} onClick={() => document.getElementById("input_password_" + index).setAttribute('type', document.getElementById("input_password_" + index).getAttribute('type') == 'text' ? 'password' : 'text')}>𓁹</button>
                                                                </div>
                                                            </div>
                                                            <div className="modal-footer justify-content-between">
                                                                <button type="button" className="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                                <button type="button" className="btn btn-primary" onClick={() => { }}>Save</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    })}
                                </tbody>
                            </table>
                        ) : (
                            <div style={{ alignItems: 'center', padding: 40 }} className='d-grid'>
                                <div className="spinner-grow text-danger" style={{ justifySelf: 'center', width: 50, height: 50 }}></div>
                            </div>
                        )}
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