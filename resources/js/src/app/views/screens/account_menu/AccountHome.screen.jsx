import React from "react"
import { connect } from 'react-redux'

import SideBar from 'app/views/components/SideBar'

import { _User, _Session, _Input, _AssetAccount, _Notification } from 'app/controller'

import CustomSelect from 'app/views/components/CustomSelect'

class AccountHomeScreen extends React.Component {

    default_input = {
        asset_code: 'USDT',
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
        this.setState({ btn_create_wallet_working: true })

        const btn_create_wallet_working = false
        const errors = []
        const input = this.state.input

        if (errors.length === 0) {
            this.setState({ errors, input }) // Reload input error/success indicators on text/password/number inputs
            const add_new_wallet_modal = bootstrap.Modal.getOrCreateInstance(document.querySelector('#add_new_wallet_modal'));
            _AssetAccount.create({ ..._Input.flatten(input), user_username: this.props.auth_user.username }).then(() => { add_new_wallet_modal.hide(); _Session.refresh(); _Notification.flash({ message: 'Asset wallet created', duration: 2000 }); this.setState({ btn_create_wallet_working, input: _.cloneDeep(this.default_input) }) })
                .catch((error) => {
                    errors.push(error.message)
                    this.setState({ btn_create_wallet_working, errors })
                })
        } else {
            this.setState({ btn_create_wallet_working, errors, input })
        }
    }

    componentDidMount = () => {
        _Session.refresh()
        document.getElementById('add_new_wallet_modal').addEventListener('hidden.bs.modal', () => {
            this.setState({ errors: [] })
        })
    }

    render() {

        const asset_options = [];
        Object.keys(this.props.datalists.active_assets).forEach(asset_code => {
            const asset = this.props.datalists.active_assets[asset_code]
            asset_options.push({
                value: asset_code,
                searchable_text: asset_code + asset.name + asset.description,
                output_element: () => <>{asset.name} <i className="text-primary">{asset_code}</i></>
            })
        })

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-fluid py-3">
                <div className="row">
                    <div className="col-2">
                        <SideBar nav_menus={[this.props.nav_menus.find(menu => menu.slug === 'account_menu')]} />
                    </div>
                    <div className="col-10">
                        <h4>My asset wallets</h4>
                        <table className="table">
                            <thead>
                                <tr>
                                    <th scope="col">Asset Code</th>
                                    <th scope="col">Usable Balance</th>
                                    <th scope="col">Total Balance</th>
                                </tr>
                            </thead>
                            <tbody>
                                {this.props.auth_user.asset_accounts.map((asset_account, index) => {
                                    return <tr key={index} >
                                        <td className="align-middle">{asset_account.asset_code}</td>
                                        <td className="align-middle">{asset_account.usable_balance_asset_value}</td>
                                        <td className="align-middle">{asset_account.total_balance_asset_value}</td>
                                    </tr>
                                })}
                            </tbody>
                        </table>
                        <div className="d-flex gap-2" >
                            <div>
                                <button type="button" className='btn btn-success' data-bs-toggle="modal" data-bs-target="#add_new_wallet_modal">Add</button>

                                <div className="modal fade" id="add_new_wallet_modal" tabIndex="-1" >
                                    <div className="modal-dialog modal-dialog-centered">
                                        <div className="modal-content">
                                            <div className="modal-header">
                                                <h5 className="modal-title" >Generate new wallet</h5>
                                                <button type="button" className="btn-close" data-bs-dismiss="modal"></button>
                                            </div>
                                            <div className="modal-body">
                                                <label htmlFor="input_asset_code" className="form-label">Asset</label>
                                                <div className="row mb-3">
                                                    <div className="col">
                                                        <CustomSelect
                                                            element_id="input_asset_code"
                                                            options={asset_options}
                                                            has_none_option={false}
                                                            max_shown_options_count={5}
                                                            selected_option_value={this.state.input.asset_code}
                                                            onChange={asset_code => this.handleInputChange('asset_code', asset_code, true)}
                                                        />
                                                    </div>
                                                    <div className="col">
                                                        <button className="btn btn-success w-100" disabled={this.state.btn_create_wallet_working || this.props.auth_user.hasAssetAccount(this.state.input.asset_code)} onClick={this.handleSubmit} >
                                                            {this.state.btn_create_wallet_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Generate {this.state.input.asset_code} wallet</>}
                                                        </button>
                                                    </div>
                                                </div>

                                                <div className="mb-1">
                                                    {this.state.errors.map((error, key) => (
                                                        <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                                                    ))}
                                                </div>
                                            </div>
                                            <div className="modal-footer justify-content-between">
                                                <button type="button" className="btn btn-secondary" data-bs-dismiss="modal" >Cancel</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
        datalists: state.datalists_data,
        auth_user: state.auth_user_data ? new _User(state.auth_user_data, ['asset_accounts']) : null,
    }
}

export default connect(mapStateToProps)(AccountHomeScreen)