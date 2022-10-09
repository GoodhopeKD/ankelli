import React from "react"
import { connect } from 'react-redux'

import { _Input, _DateTime, _Session, _Notification, _AssetWalletAddress } from 'app/controller'

import SideBar from 'app/views/components/SideBar'
import CustomSelect from 'app/views/components/CustomSelect'

class CustodialWalletManagementScreen extends React.Component {

    default_input = {
        asset_code: 'ETH',
        asset_wallet_id: '',
    }

    state = {

        asset_wallet_addresses_list_loaded: false,
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

    async universalGetCollection(_Type, indicator_var_name, input = null, page_select = null, per_page = null) {
        if (!this.working) {
            this.working = true
            this.setState({
                asset_wallet_addresses_list_loaded: false,
                list: [],
                list_loaded: false,
                list_full: false,
                list_refreshing: false
            })
            return new Promise((resolve) => setTimeout(() => {
                resolve(_Type.getCollection(input, page_select, per_page)
                    .then(({ collection }) => {
                        if (!collection.data) return Promise.resolve();
                        let update_object = {
                            //list: page_select ? this.state.list.concat(collection.data) : collection.data,
                            list: collection.data,
                            list_loaded: true,
                            list_full: collection.meta.current_page === collection.meta.last_page,
                            _collecion: {
                                links: collection.links,
                                meta: collection.meta,
                            }
                        };
                        update_object[indicator_var_name] = true;
                        this.setState(update_object);
                        this.working = false
                        this.should_load_items = false
                        return Promise.resolve();
                    })
                    .catch((error) => {
                        this.working = false
                        this.should_load_items = false
                        return Promise.reject(error);
                    }))
            }, 0))
        } else {
            return Promise.resolve();
        }
    }

    populateScreenWithItems = async (show_list_refreshing_loader = true) => {
        this.setState({ list_refreshing: show_list_refreshing_loader });
        await this.universalGetCollection(_AssetWalletAddress, 'asset_wallet_addresses_list_loaded', JSON.parse(JSON.stringify(this.state.input)), this.state.page_select, this.state.per_page)
        if (show_list_refreshing_loader) this.setState({ list_refreshing: false })
    };

    generateNewAddress = async () => {
        this.setState({ btn_generating_address_working: true })
        //await _AssetCustodialWalletAddress.create()
        await this.populateScreenWithItems()
        this.setState({ btn_generating_address_working: false })
    }

    componentDidMount = () => {
        _Session.refresh()
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

        const asset = this.props.datalists.active_assets[this.state.input.asset_code]

        const pagination_pages = [1]
        if (this.state._collecion.meta.last_page && this.state._collecion.meta.last_page !== 1) {
            for (let index = 2; index < this.state._collecion.meta.last_page + 1; index++) {
                pagination_pages.push(index)
            }
        }

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-xl py-3">
                <div className="row">
                    <div className="col-lg-2">
                        <SideBar nav_menus={this.props.nav_menus.filter(menu => menu.slug === 'admin_menu')} />
                    </div>
                    <div className="col-lg-10">
                        <div className="row mb-3">
                            <div className="col">
                                <label htmlFor="input_asset_code" className="form-label">Asset</label>
                                <CustomSelect
                                    id="input_asset_code"
                                    options={asset_options}
                                    has_none_option={false}
                                    max_shown_options_count={5}
                                    selected_option_value={this.state.input.asset_code}
                                    onChange={asset_code => { this.setState({ list_loaded: false, asset_wallet_addresses_list_loaded: false }); this.handleInputChange('asset_code', asset_code, true); this.handleInputChange('asset_wallet_id', this.mother_asset_wallets.find(aacc => aacc.asset_code == asset_code).id, true) }}
                                />
                            </div>
                            <div className="col">
                                <label htmlFor="output_user_wallets_balance" className="form-label">User wallets total</label>
                                <span className="form-control" id='output_user_wallets_balance'>{window.assetValueString(0, asset)}</span>
                            </div>

                            <div className="col">
                                <label htmlFor="output_mother_wallets_balance" className="form-label">Mother wallet total</label>
                                <div className="input-group">
                                    <span className="form-control" id='output_mother_wallets_balance'>{window.assetValueString(0, asset)}</span>
                                    <button className="btn btn-success" type="button">Refresh</button>
                                </div>
                            </div>
                        </div>

                        <div>
                            <nav>
                                <div className="nav nav-tabs mb-3" id="nav-tab" role="tablist">
                                    <button className="nav-link active" id="nav-mother-load-crypto-tab" data-bs-toggle="tab" data-bs-target="#nav-mother-load-crypto" type="button" role="tab">Load crypto</button>
                                    <button className="nav-link" id="nav-mother-send-crypto-tab" data-bs-toggle="tab" data-bs-target="#nav-mother-send-crypto" type="button" role="tab" tabIndex="-1">Send crypto</button>
                                </div>
                            </nav>
                            <div className="tab-content" id="nav-tabContent">
                                <div className="tab-pane fade active show" id="nav-mother-load-crypto" role="tabpanel" >
                                    <div className="table-responsive mb-3">
                                        <table className="table table-sm mb-0">
                                            <thead>
                                                <tr>
                                                    <th scope="col" style={{ minWidth: 250 }}>Address</th>
                                                    <th scope="col" style={{ minWidth: 215 }}>Registered time</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                {this.state.list.map((asset_wallet_address, index) => {
                                                    return <tr key={index} >
                                                        <td className="align-middle" style={{ maxWidth: 300 }}>
                                                            <div className="input-group input-group-sm">
                                                                <input type="text" className="form-control" value={asset_wallet_address.blockchain_address} onChange={() => { }} />
                                                                <span className="input-group-text p-0">
                                                                    <button className="btn btn-light" style={{ borderTopLeftRadius: 0, borderBottomLeftRadius: 0, border: 'none' }} onClick={() => { navigator.clipboard.writeText(asset_wallet_address.blockchain_address); _Notification.flash({ message: 'Address copied to clipboard', duration: 2000 }); }} >📋</button>
                                                                </span>
                                                            </div>
                                                        </td>
                                                        <td className="align-middle">{window.ucfirst(new _DateTime(asset_wallet_address.created_datetime).prettyDatetime())}</td>
                                                    </tr>
                                                })}
                                            </tbody>
                                        </table>
                                    </div>

                                    <div className="d-flex gap-2" >

                                        <div>
                                            <button type="button" className="btn btn-primary" onClick={this.populateScreenWithItems} disabled>Get Addresses</button>
                                        </div>

                                        <div>
                                            <button type="button" className='btn btn-success' onClick={this.generateNewAddress} disabled={true | !this.state.list_loaded || this.state.btn_generating_address_working}>
                                                {this.state.btn_generating_address_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Generate new</>}
                                            </button>
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
                                                        <a className="page-link" href="#" onClick={() => this.setState({ page_select: { page: this.state._collecion.meta.current_page - 1, } }, () => { this.populateScreenWithItems() })} > <span>«</span> </a>
                                                    </li>
                                                    {pagination_pages.map(page => <li key={page} className={"page-item" + (this.state._collecion.meta.current_page == page ? ' active' : '') + (!this.state.list_loaded ? ' disabled' : '')} onClick={() => this.setState({ page_select: { page } }, () => { this.populateScreenWithItems() })} ><a className="page-link" href="#">{page}</a> </li>)}
                                                    <li className={"page-item" + ((this.state._collecion.meta.current_page == this.state._collecion.meta.last_page || !this.state.list_loaded) ? ' disabled' : '')}>
                                                        <a className="page-link" href="#" onClick={() => this.setState({ page_select: { page: this.state._collecion.meta.current_page + 1, } }, () => { this.populateScreenWithItems() })} > <span>»</span> </a>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </div>

                                    </div>
                                </div>
                                <div className="tab-pane fade" id="nav-mother-send-crypto" role="tabpanel" >

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
    }
}

export default connect(mapStateToProps)(CustodialWalletManagementScreen)