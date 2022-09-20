import React from "react"
import { connect } from 'react-redux'
import { Link } from "react-router-dom";

import SideBar from 'app/views/components/SideBar'
import CustomSelect from 'app/views/components/CustomSelect'

import { _User, _DateTime, _Session, _Notification } from 'app/controller'

class BCReceiveFundsScreen extends React.Component {

    default_input = {
        asset_code: 'USDT',
    }

    state = {

        trades_list_loaded: false,
        list: [],
        list_loaded: false,
        list_full: false,
        list_refreshing: false,
        _collecion: { meta: {}, links: {} },
        page_select: { page: 1, },
        per_page: 10,

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

        const pagination_pages = [1]
        if (this.state._collecion.meta.last_page && this.state._collecion.meta.last_page !== 1) {
            for (let index = 2; index < this.state._collecion.meta.last_page + 1; index++) {
                pagination_pages.push(index)
            }
        }

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-fluid py-3">
                <div className="row">
                    <div className="col-2">
                        <SideBar nav_menus={[this.props.nav_menus.find(menu => menu.slug === 'account_menu')]} />
                    </div>
                    <div className="col-10">
                        {this.props.auth_user.asset_accounts.length !== 0 && <>
                            <div className="row">
                                <div className="col">
                                    <label htmlFor="input_asset_code" className="form-label">Target asset account</label>
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
                                    <label htmlFor="output_current_balance" className="form-label">Current total balance</label>
                                    <span className="form-control" id='output_current_balance'>{window.assetValueString((this.props.auth_user.asset_accounts.find(aacc => aacc.asset_code == asset.code) ?? { total_balance_asset_value: 0 }).total_balance_asset_value, asset)}</span>
                                </div>
                            </div>

                            <hr />

                            <table className="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Address</th>
                                        <th scope="col">Transaction count</th>
                                        <th scope="col">Created datetime</th>
                                        <th scope="col">Last used datetime</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {[
                                        { address: 'ab378dfeca6793dcab572d57ae2b79adc79e682', tx_count: 4, created_datetime: '2022-09-15 04:48:27', last_active_datetime: '2022-09-15 05:10:27' },
                                        { address: '46fc578ca892cdb898feac562beaf6783cab67e', tx_count: 2, created_datetime: '2022-09-15 07:29:27', last_active_datetime: '2022-09-16 08:30:27' },
                                    ].map((asset_account_address, index) => {
                                        return <tr key={index} >
                                            <td className="align-middle" style={{ maxWidth: 300 }}>
                                                <div className="input-group input-group-sm">
                                                    <input type="text" className="form-control" value={asset_account_address.address} onChange={() => { }} />
                                                    <span className="input-group-text p-0">
                                                        <button className="btn btn-light" style={{ borderTopLeftRadius: 0, borderBottomLeftRadius: 0, border: 'none' }} onClick={() => { navigator.clipboard.writeText(asset_account_address.address); _Notification.flash({ message: 'Address copied to clipboard', duration: 2000 }); }} >📋</button>
                                                    </span>
                                                </div>
                                            </td>
                                            <td className="align-middle">{asset_account_address.tx_count}</td>
                                            <td className="align-middle">{window.ucfirst(new _DateTime(asset_account_address.created_datetime).prettyDatetime())}</td>
                                            <td className="align-middle">{window.isset(asset_account_address.last_active_datetime) ? window.ucfirst(new _DateTime(asset_account_address.last_active_datetime).prettyDatetime()) : '-'}</td>
                                        </tr>
                                    })}
                                </tbody>
                            </table>

                            <div className="d-flex gap-2" >

                                <div>
                                    <button type="button" className='btn btn-success'>Generate new</button>
                                </div>

                                <div>
                                    <div className="d-flex gap-1">
                                        <label htmlFor="input_per_page" className="align-self-center">Items</label>
                                        <select className="form-select" id="input_per_page" value={this.state.per_page} onChange={element => this.setState({ per_page: parseInt(element.target.value) }, () => { this.should_load_items = true; this.populateScreenWithItems() })} >
                                            {[5, 10, 25, 50, 100].map((per_page, index) => <option key={index} value={per_page} >{per_page}</option>)}
                                        </select>
                                    </div>
                                </div>

                                <div>
                                    <nav>
                                        <ul className="pagination">
                                            <li className={"page-item" + ((this.state._collecion.meta.current_page == 1 || !this.state.list_loaded) ? ' disabled' : '')}>
                                                <a className="page-link" href="#" aria-label="Previous" onClick={() => this.setState({ page_select: { page: 1, } }, () => { this.should_load_items = true; this.populateScreenWithItems() })} > <span aria-hidden="true">«</span> </a>
                                            </li>
                                            {pagination_pages.map(page => <li key={page} className={"page-item" + (this.state._collecion.meta.current_page == page ? ' active' : '') + (!this.state.list_loaded ? ' disabled' : '')} onClick={() => this.setState({ page_select: { page } }, () => { this.should_load_items = true; this.populateScreenWithItems() })} ><a className="page-link" href="#">{page}</a> </li>)}
                                            <li className={"page-item" + ((this.state._collecion.meta.current_page == this.state._collecion.meta.last_page || !this.state.list_loaded) ? ' disabled' : '')}>
                                                <a className="page-link" href="#" aria-label="Next" onClick={() => this.setState({ page_select: { page: this.state._collecion.meta.last_page, } }, () => { this.should_load_items = true; this.populateScreenWithItems() })} > <span aria-hidden="true">»</span> </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>

                            </div>

                            <hr />
                        </>}
                        <p className="my-3">Go to <Link to='/account/home'>account home</Link> screen to create asset accounts</p>
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

export default connect(mapStateToProps)(BCReceiveFundsScreen)