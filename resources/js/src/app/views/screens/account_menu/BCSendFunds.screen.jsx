import React from "react"
import { connect } from 'react-redux'
import { Link } from "react-router-dom";

import SideBar from 'app/views/components/SideBar'
import CustomSelect from 'app/views/components/CustomSelect'

import { _User, _DateTime, _Session, _Notification, _Input } from 'app/controller'

class BCSendFundsScreen extends React.Component {

    default_input = {
        asset_code: 'USDT',
        asset_value: 0,
        destination_blockchain_address: new _Input()
    }

    state = {
        btn_create_wallet_working: false,
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

    componentDidMount = () => {
        _Session.refresh()
    }

    render() {

        const asset_options = [];
        Object.keys(this.props.datalists.active_assets).forEach(asset_code => {
            const asset = this.props.datalists.active_assets[asset_code]
            if (this.props.auth_user.hasAssetAccount(asset_code)) {
                asset_options.push({
                    value: asset_code,
                    searchable_text: asset_code + asset.name + asset.description,
                    output_element: () => <>{asset.name} <i className="text-primary">{asset_code}</i></>
                })
            }
        })

        const asset = this.props.datalists.active_assets[this.state.input.asset_code]

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-fluid py-3">
                <div className="row">
                    <div className="col-2">
                        <SideBar nav_menus={[this.props.nav_menus.find(menu => menu.slug === 'account_menu')]} />
                    </div>
                    <div className="col-10">
                        {this.props.auth_user.asset_accounts.length !== 0 && <>
                            <form onSubmit={e => { e.preventDefault(); this.handleSubmit() }}>

                                <h5 className="my-3">Select asset account you'd like to send funds from.</h5>

                                <div className="row mb-3">
                                    <div className="col">
                                        <label htmlFor="input_asset_code" className="form-label">Source asset</label>
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
                                        <label htmlFor="output_current_balance" className="form-label">Current usable balance</label>
                                        <span className="form-control" id='output_current_balance'>{window.assetValueString((this.props.auth_user.asset_accounts.find(aacc => aacc.asset_code == asset.code) ?? { usable_balance_asset_value: 0 }).usable_balance_asset_value, asset)}</span>
                                    </div>
                                </div>

                                <div className="mb-3">
                                    <label htmlFor="input_destination_blockchain_address" className="form-label">Destination blockchain address</label>
                                    <div className="input-group">
                                        <input
                                            type="text" className="form-control" id="input_destination_blockchain_address"
                                            value={this.state.input.destination_blockchain_address + ''}
                                            required
                                            onChange={e => this.handleInputChange('destination_blockchain_address', e.target.value)}
                                        />
                                    </div>
                                </div>

                                <div className="mb-3">
                                    <label htmlFor="input_asset_value" className="form-label">Value of asset to transfer</label>
                                    <div className="input-group">
                                        <input
                                            type="number" className="form-control" id="input_asset_value"
                                            min="0"
                                            required
                                            max={parseFloat(window.assetValueString((this.props.auth_user.asset_accounts.find(aacc => aacc.asset_code == asset.code) ?? { usable_balance_asset_value: 0 }).usable_balance_asset_value, asset, false))}
                                            step={asset.smallest_display_unit}
                                            value={this.state.input.asset_value ? parseFloat(window.assetValueString(this.state.input.asset_value, asset, false)) : ''}
                                            onChange={e => this.handleInputChange('asset_value', e.target.value)}
                                        />
                                    </div>
                                </div>

                                <button type="button" className='btn btn-danger'>Transfer funds</button>
                            </form>

                            <hr />

                        </>}
                        <h5 className="my-3">Go to <Link to='/account/home'>account home</Link> screen to create asset accounts</h5>
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

export default connect(mapStateToProps)(BCSendFundsScreen)