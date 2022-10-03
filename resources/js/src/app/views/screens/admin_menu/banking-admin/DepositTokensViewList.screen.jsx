import React from "react"
import { connect } from 'react-redux'
import { Link } from "react-router-dom";

import { _DepositToken, _Notification, _User, _DateTime, _Input } from 'app/controller'
import SideBar from 'app/views/components/SideBar'
import CustomSelect from 'app/views/components/CustomSelect'

class BgTaskHandler { static runInBackground = (fn) => fn() }

class DepositTokensViewListScreen extends React.Component {

    working = false

    default_input = {
        asset_code: undefined,
        currency_code: undefined,
        creator_username: undefined,
        _status: undefined,
    }

    state = {
        deposit_tokens_list_loaded: false,
        list: [],
        list_loaded: false,
        list_full: false,
        list_refreshing: false,
        _collecion: { meta: {}, links: {} },
        page_select: { page: 1, },
        per_page: 10,

        input: _.cloneDeep(this.default_input),
    };

    should_load_items = true

    handleInputChange(field = 'field.deep_field', value, use_raw = false) {
        const input = this.state.input
        const fields = field.split('.')
        const val = use_raw ? value : new _Input(value)
        if (fields.length === 1) {
            input[fields] = val
        } else {
            input[fields[0]][fields[1]] = val
        }
        this.setState({ input }, () => this.should_load_items = true)
    }

    async universalGetCollection(_Type, indicator_var_name, get_collection_params = null, page_select = null, per_page = null) {
        //if (page_select && this.state.list_full) return Promise.resolve();
        if (!this.should_load_items) {
            _Notification.flash({ message: 'No filters changed', duration: 2000 })
            return Promise.resolve();
        }
        if (!this.working) {
            this.working = true
            this.setState({
                deposit_tokens_list_loaded: false,
                list: [],
                list_loaded: false,
                list_full: false,
                list_refreshing: false
            })
            return new Promise((resolve) => setTimeout(() => {
                resolve(_Type.getCollection({ ...get_collection_params }, page_select, per_page)
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
        await this.universalGetCollection(_DepositToken, 'deposit_tokens_list_loaded', JSON.parse(JSON.stringify(this.state.input)), this.state.page_select, this.state.per_page)
        if (show_list_refreshing_loader) this.setState({ list_refreshing: false })
    };

    componentDidMount() {
        const bgTask = () => this.populateScreenWithItems(false)
        try { BgTaskHandler.runInBackground(() => bgTask()) } catch (e) { bgTask() }
    }

    render() {

        const asset_options = []
        Object.keys(this.props.datalists.active_assets).forEach(asset_code => {
            const asset = this.props.datalists.active_assets[asset_code]
            asset_options.push({
                value: asset_code,
                searchable_text: asset_code + asset.name + asset.description,
                output_element: () => <>{asset.name} <i className="text-primary">{asset_code}</i></>
            })
        })

        const currency_options = []
        Object.keys(this.props.datalists.active_currencies).forEach(currency_code => {
            const currency = this.props.datalists.active_currencies[currency_code]
            currency_options.push({
                value: currency_code,
                searchable_text: currency_code + currency.name + currency.description,
                output_element: () => <><span className="d-inline-block rounded-circle align-self-center text-success" ><i><b>{currency.symbol}</b></i></span>{currency.name}<i className="text-success">{currency_code}</i></>
            })
        })

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
                        <SideBar nav_menus={[this.props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />
                    </div>
                    <div className="col-lg-10">

                        <div className='row'>

                            <div className="col">
                                <label htmlFor="input__status" className="form-label">Status</label>
                                <select className="form-select" id="input__status" value={this.state.input._status} onChange={rr => {
                                    this.handleInputChange('_status', rr.target.value, true); setTimeout(() => {
                                        this.populateScreenWithItems()
                                    }, 0);
                                }} >
                                    <option value="all">All</option>
                                    <option value="used">Used</option>
                                    <option value="unused">Unused</option>
                                </select>
                            </div>

                            <div className="col">
                                <label htmlFor="input_asset_code" className="form-label">Asset</label>
                                <CustomSelect
                                    id="input_asset_code"
                                    options={asset_options}
                                    max_shown_options_count={5}
                                    selected_option_value={this.state.input.asset_code}
                                    onChange={asset_code => this.handleInputChange('asset_code', asset_code, true)}
                                />
                            </div>

                            <div className="col">
                                <label htmlFor="input_currency_code" className="form-label">Currency</label>
                                <CustomSelect
                                    id="input_currency_code"
                                    options={currency_options}
                                    max_shown_options_count={5}
                                    selected_option_value={this.state.input.currency_code}
                                    onChange={currency_code => this.handleInputChange('currency_code', currency_code, true)}
                                />
                            </div>

                        </div>

                        <div className="d-flex justify-content-between">

                            <button
                                onClick={() => { if (this.state.page_select.page !== 1) { this.setState({ page_select: { page: 1 } }, () => { this.should_load_items = true; this.populateScreenWithItems() }) } else { this.populateScreenWithItems() } }}
                                className="btn btn-outline-danger mt-3"
                            >
                                Load deposit tokens
                            </button>
                            <button
                                onClick={() => this.setState({
                                    input: _.cloneDeep(this.default_input)
                                }, () => this.should_load_items = true)}
                                className="btn btn-outline-danger mt-3"
                            >
                                Reset Filters
                            </button>
                        </div>

                        <hr />


                        <div>
                            <div className="table-responsive">
                                <table className="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Token</th>
                                            <th scope="col">Asset</th>
                                            <th scope="col">Purchase Amount</th>
                                            <th scope="col">Creator</th>
                                            <th scope="col">Created datetime</th>
                                            {this.state.input._status != 'unused' && <th scope="col text-center">User</th>}
                                            {this.state.input._status != 'unused' && <th scope="col text-center">Used datetime</th>}
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {this.state.list_loaded ? (
                                            this.state.list.map((deposit_token, index) => {
                                                const asset = this.props.datalists.active_assets[deposit_token.asset_code]
                                                const currency = this.props.datalists.active_currencies[deposit_token.currency_code]

                                                return <tr key={index} >
                                                    <td className="align-middle" style={{ maxWidth: 200 }}>
                                                        <div className="input-group input-group-sm">
                                                            <input type="text" className="form-control" value={deposit_token.token} onChange={() => { }} />
                                                            <span className="input-group-text p-0">
                                                                <button className="btn btn-light" style={{ borderTopLeftRadius: 0, borderBottomLeftRadius: 0, border: 'none' }} onClick={() => { navigator.clipboard.writeText(deposit_token.token); _Notification.flash({ message: 'Token copied to clipboard', duration: 2000 }); }} >📋</button>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td className="align-middle">{window.assetValueString(deposit_token.asset_value, asset)}</td>
                                                    <td className="align-middle">{window.currencyAmountString(deposit_token.currency_amount, currency)}</td>
                                                    <td className="align-middle">{deposit_token.creator_username}</td>
                                                    <td className="align-middle">{window.ucfirst(new _DateTime(deposit_token.created_datetime).prettyDatetime())}</td>
                                                    {this.state.input._status != 'unused' && <td className="align-middle">{deposit_token.user_username ?? '-'}</td>}
                                                    {this.state.input._status != 'unused' && <td className="align-middle">{deposit_token.used_datetime ? window.ucfirst(new _DateTime(deposit_token.used_datetime).prettyDatetime()) : '-'}</td>}
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

                            <div className="d-flex gap-2" >

                                <div>
                                    <Link to={'/banking-admin/deposit_tokens/new'} className='btn btn-success' >Create new</Link>
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
                                                <a className="page-link" href="#" onClick={() => this.setState({ page_select: { page: 1, } }, () => { this.populateScreenWithItems() })} > <span>«</span> </a>
                                            </li>
                                            {pagination_pages.map(page => <li key={page} className={"page-item" + (this.state._collecion.meta.current_page == page ? ' active' : '') + (!this.state.list_loaded ? ' disabled' : '')} onClick={() => this.setState({ page_select: { page } }, () => { this.populateScreenWithItems() })} ><a className="page-link" href="#">{page}</a> </li>)}
                                            <li className={"page-item" + ((this.state._collecion.meta.current_page == this.state._collecion.meta.last_page || !this.state.list_loaded) ? ' disabled' : '')}>
                                                <a className="page-link" href="#" onClick={() => this.setState({ page_select: { page: this.state._collecion.meta.last_page, } }, () => { this.populateScreenWithItems() })} > <span>»</span> </a>
                                            </li>
                                        </ul>
                                    </nav>
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
        sysconfig_params: state.sysconfig_params_data,
        auth_user: state.auth_user_data ? new _User(state.auth_user_data) : null,
    }
}

export default connect(mapStateToProps)(DepositTokensViewListScreen)