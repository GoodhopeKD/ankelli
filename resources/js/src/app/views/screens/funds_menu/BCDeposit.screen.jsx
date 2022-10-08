import React from "react"
import { connect } from 'react-redux'
import { Link } from "react-router-dom";

import SideBar from 'app/views/components/SideBar'
import CustomSelect from 'app/views/components/CustomSelect'

import { _User, _Input, _DateTime, _Session, _Notification, _AssetWalletAddress } from 'app/controller'

class BCDepositScreen extends React.Component {

    default_input = {
        asset_code: 'ETH',
        asset_wallet_id: this.props.auth_user.asset_wallets.length !== 0 ? ((this.props.auth_user.asset_wallets.find(aacc => aacc.asset_code == 'ETH') ?? { id: null }).id) : null,
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
        //if (page_select && this.state.list_full) return Promise.resolve();
        if (!this.should_load_items) {
            //_Notification.flash({ message: 'No filters changed', duration: 2000 })
            //return Promise.resolve();
        }
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

    componentDidMount = () => {
        this.populateScreenWithItems()
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
                                        onChange={asset_code => { this.handleInputChange('asset_code', asset_code, true); this.handleInputChange('asset_wallet_id', this.props.auth_user.asset_wallets.find(aacc => aacc.asset_code == asset_code).id, true); this.setState({ list_loaded: false, asset_wallet_addresses_list_loaded: false }, this.populateScreenWithItems()); }}
                                    />
                                </div>
                                <div className="col">
                                    <label htmlFor="output_current_balance" className="form-label">Total balance</label>
                                    <span className="form-control" id='output_current_balance'>{window.assetValueString((this.props.auth_user.asset_wallets.find(aacc => aacc.asset_code == asset.code) ?? { total_balance_asset_value: 0 }).total_balance_asset_value, asset)}</span>
                                </div>
                            </div>

                            <p className="text-center" style={{ whiteSpace: 'pre-wrap' }}><b><i>{asset.onchain_disclaimer}</i></b></p>

                            <p className="text-muted text-center">After sending crypto to selected address, give a little time (max 2 minutes) for our system to scan the blockchain and update your balances.</p>

                            {this.state.list.map((asset_wallet_address, index) => {
                                return <div key={index} className="text-center" >
                                    <div className="row justify-content-center">
                                        <div className="col-12 col-md-10 col-lg-8 col-xl-6">
                                            <p><b>{asset.name} ({asset.code}) address</b></p>
                                            <div className="input-group mb-3">
                                                <input type="text" className="form-control" value={asset_wallet_address.blockchain_address} onChange={() => { }} />
                                                <span className="input-group-text p-0">
                                                    <button className="btn btn-light" style={{ borderTopLeftRadius: 0, borderBottomLeftRadius: 0, border: 'none' }} onClick={() => { navigator.clipboard.writeText(asset_wallet_address.blockchain_address); _Notification.flash({ message: 'Address copied to clipboard', duration: 2000 }); }} >📋</button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <p>Registered time: <b>{window.ucfirst(new _DateTime(asset_wallet_address.created_datetime).prettyDatetime())}</b></p>
                                    <p>Last active time: <b>{window.isset(asset_wallet_address.last_active_datetime) ? window.ucfirst(new _DateTime(asset_wallet_address.last_active_datetime).prettyDatetime()) : '-'}</b></p>
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
        datalists: state.datalists_data,
        auth_user: state.auth_user_data ? new _User(state.auth_user_data, ['asset_wallets']) : null,
    }
}

export default connect(mapStateToProps)(BCDepositScreen)