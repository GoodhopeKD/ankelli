import React from "react"
import { connect } from 'react-redux'
import { Link } from "react-router-dom";

import SideBar from 'app/views/components/SideBar'
import CustomSelect from 'app/views/components/CustomSelect'

import { _User, _Input, _DateTime, _Session, _Notification, _AssetWalletAddress } from 'app/controller'

class BCDepositScreen extends React.Component {

    default_input = {
        asset_code: this.props.sysconfig_params.default_crypto_asset_code,
    }

    state = {
        input: _.cloneDeep(this.default_input),
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

    componentDidMount = () => {
        _Session.refresh()
    }

    render() {

        const asset_options = [];
        Object.keys(this.props.datalists.active_assets).forEach(asset_code => {
            const asset = this.props.datalists.active_assets[asset_code]
            if (this.props.auth_user.hasAssetWallet(asset_code)) {
                asset_options.push({
                    value: asset_code,
                    searchable_text: asset_code + asset.name + asset.description,
                    output_element: () => <>{asset.name} <i className="text-primary">{asset.fe_asset_code}</i></>
                })
            }
        })

        const asset = this.props.datalists.active_assets[this.state.input.asset_code]

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-xl py-3">
                <div className="row">
                    <div className="col-lg-2">
                        <SideBar nav_menus={this.props.nav_menus.filter(menu => menu.slug === 'funds_menu')} />
                    </div>
                    <div className="col-lg-10">
                        {this.props.auth_user.asset_wallets.length !== 0 && <>
                            <div className="row mb-3">
                                <div className="col">
                                    <label htmlFor="input_asset_code" className="form-label">Target asset account</label>
                                    <CustomSelect
                                        id="input_asset_code"
                                        options={asset_options}
                                        has_none_option={false}
                                        max_shown_options_count={5}
                                        selected_option_value={this.state.input.asset_code}
                                        onChange={asset_code => this.handleInputChange('asset_code', asset_code, true) }
                                    />
                                </div>
                                <div className="col">
                                    <label htmlFor="output_current_balance" className="form-label">Total balance</label>
                                    <span className="form-control" id='output_current_balance'>{window.assetValueString((this.props.auth_user.asset_wallets.find(aacc => aacc.asset_code == asset.code) ?? { total_balance_asset_value: 0 }).total_balance_asset_value, asset)}</span>
                                </div>
                            </div>

                            <p className="text-center" style={{ whiteSpace: 'pre-wrap' }}><b><i>{asset.onchain_disclaimer}</i></b></p>

                            {((this.props.auth_user.asset_wallets.find(aacc => aacc.asset_code == asset.code).asset_wallet_addresses) ?? []).map((asset_wallet_address, index) => {
                                return <div key={index} className="text-center" >
                                    <div className="row justify-content-center">
                                        <div className="col-12 col-md-10 col-lg-8 col-xl-6">
                                            <p><b>{asset.name} ({asset.code}) deposit address</b></p>
                                            <div className="input-group mb-3">
                                                <input type="text" className="form-control" value={asset_wallet_address.bc_address} onChange={() => { }} />
                                                <span className="input-group-text p-0">
                                                    <button className="btn btn-light" style={{ borderTopLeftRadius: 0, borderBottomLeftRadius: 0, border: 'none' }} onClick={() => { navigator.clipboard.writeText(asset_wallet_address.bc_address); _Notification.flash({ message: 'Address copied to clipboard', duration: 2000 }); }} >📋</button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            })}

                            <hr />
                        </>}
                        <p className="my-3">Go to <Link to='/funds/dashboard'>Funds dashboard</Link> screen to create crypto wallets</p>
                    </div>
                </div>
            </div>
        </this.props.PageWrapper>
    }
}

const mapStateToProps = (state) => {
    return {
        sysconfig_params: state.sysconfig_params_data,
        datalists: state.datalists_data,
        auth_user: state.auth_user_data ? new _User(state.auth_user_data, ['asset_wallets']) : null,
    }
}

export default connect(mapStateToProps)(BCDepositScreen)