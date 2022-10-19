import React from "react"
import { connect } from 'react-redux'
import { Link } from "react-router-dom";

import { _DepositToken, _Notification, _User, _DateTime, _Input, _Asset, _Currency, _PymtMethod, _Country } from 'app/controller'
import SideBar from 'app/views/components/SideBar'

class BgTaskHandler { static runInBackground = (fn) => fn() }

export default class DatalistViewListScreen extends React.Component {

    list_name = ''
    list_Type = null

    working = false

    default_input = {
        creator_username: undefined,
        _status: 'all',
    }

    state = {
        datalist_list_loaded: false,
        list: [],
        list_loaded: false,
        list_full: false,
        list_refreshing: false,
        _collecion: { meta: {}, links: {} },
        page_select: { page: 1, },
        per_page: undefined,

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
                datalist_list_loaded: false,
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
        await this.universalGetCollection(this.list_Type, 'datalist_list_loaded', JSON.parse(JSON.stringify(this.state.input)), this.state.page_select, this.state.per_page)
        if (show_list_refreshing_loader) this.setState({ list_refreshing: false })
    };

    componentDidMount() {
        let list_Type = null
        switch (this.props.title) {
            case 'Assets List': list_Type = _Asset; break;
            case 'Currencies List': list_Type = _Currency; break;
            case 'Payment Methods List': list_Type = _PymtMethod; break;
            case 'Countries List': list_Type = _Country; break;
        }
        this.list_Type = list_Type
        const bgTask = () => this.populateScreenWithItems(false)
        try { BgTaskHandler.runInBackground(() => bgTask()) } catch (e) { bgTask() }
    }

    render() {

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
                        <h5>{this.props.title}</h5>
                        <hr />

                        <div>
                            <div className="table-responsive mb-3">
                                <table className="table table-sm mb-0">
                                    <thead>
                                        <tr>
                                            {this.props.title == 'Assets List' && <>
                                                <th scope="col" className="align-middle small" style={{ minWidth: 80 }}>Name</th>
                                                <th scope="col" className="align-middle small">Chain</th>
                                                <th scope="col" className="align-middle small">Code</th>
                                                <th scope="col" className="align-middle small">Unit</th>
                                                <th scope="col" className="align-middle small">Widthrawal Fee (USD)</th>
                                                <th scope="col" className="align-middle small" style={{ minWidth: 140 }}>Widthrawal Limits</th>
                                                <th scope="col" className="align-middle small" style={{ minWidth: 80 }}>USD rate</th>
                                                <th scope="col" className="align-middle small" style={{ minWidth: 85 }}>Smallest Display Unit</th>
                                                <th scope="col" className="align-middle small" style={{ minWidth: 300 }}>Onchain Disclaimer</th>
                                                <th scope="col" className="align-middle small">Status</th>
                                            </>}
                                            {this.props.title == 'Currencies List' && <>
                                                <th scope="col" className="align-middle small">Name</th>
                                                <th scope="col" className="align-middle small">Code</th>
                                                <th scope="col" className="align-middle small">Symbol</th>
                                                <th scope="col" className="align-middle small">Symbol Located</th>
                                                <th scope="col" className="align-middle small">USD rate</th>
                                                <th scope="col" className="align-middle small">Min transactable cash amount</th>
                                                <th scope="col" className="align-middle small">Smallest transactable cash denomination amount</th>
                                                <th scope="col" className="align-middle small">Status</th>
                                            </>}
                                            {this.props.title == 'Payment Methods List' && <>
                                                <th scope="col" className="align-middle small">Name</th>
                                                <th scope="col" className="align-middle small">Slug</th>
                                                <th scope="col" className="align-middle small">Choice currencies</th>
                                                <th scope="col" className="align-middle small" style={{ width: 400 }}>Details required</th>
                                                <th scope="col" className="align-middle small">Hex color</th>
                                                <th scope="col" className="align-middle small">Icon</th>
                                                <th scope="col" className="align-middle small">Status</th>
                                            </>}
                                            {this.props.title == 'Countries List' && <>
                                                <th scope="col" className="align-middle small">Name</th>
                                                <th scope="col" className="align-middle small">Code</th>
                                                <th scope="col" className="align-middle small">Choice payment methods</th>
                                                <th scope="col" className="align-middle small">Choice currencies</th>
                                                <th scope="col" className="align-middle small">Allowed assets</th>
                                                <th scope="col" className="align-middle small">Status</th>
                                            </>}
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {this.state.list_loaded ? (
                                            this.state.list.map((datalist_item, index) => {
                                                return <tr key={index} >
                                                    {this.props.title == 'Assets List' && <>
                                                        <td className="align-middle small">{datalist_item.name}</td>
                                                        <td className="align-middle small">{datalist_item.chain}</td>
                                                        <td className="align-middle small">{datalist_item.code}</td>
                                                        <td className="align-middle small">{datalist_item.unit}</td>
                                                        <td className="align-middle small">{window.currencyAmountString(datalist_item.withdrawal_txn_fee_usd_fctr, { symbol: '$', symbol_before_number: true })}</td>
                                                        <td className="align-middle small">{datalist_item.withdrawal_min_limit} - {datalist_item.withdrawal_max_limit} {datalist_item.unit}</td>
                                                        <td className="align-middle small">{window.assetValueString(datalist_item.usd_asset_exchange_rate, datalist_item)}</td>
                                                        <td className="align-middle small">{datalist_item.smallest_display_unit}</td>
                                                        <td className="align-middle small" style={{ whiteSpace: 'pre-wrap' }}>{datalist_item.onchain_disclaimer}</td>
                                                        <td className="align-middle small">{datalist_item._status}</td>
                                                    </>}
                                                    {this.props.title == 'Currencies List' && <>
                                                        <td className="align-middle small">{datalist_item.name}</td>
                                                        <td className="align-middle small">{datalist_item.code}</td>
                                                        <td className="align-middle small">{datalist_item.symbol}</td>
                                                        <td className="align-middle small">{datalist_item.symbol_before_number ? 'Before Number' : 'After Number'}</td>
                                                        <td className="align-middle small">{datalist_item.usd_rate}</td>
                                                        <td className="align-middle small">{datalist_item.min_transactable_cash_amount}</td>
                                                        <td className="align-middle small">{datalist_item.smallest_transactable_cash_denomination_amount}</td>
                                                        <td className="align-middle small">{datalist_item._status}</td>
                                                    </>}
                                                    {this.props.title == 'Payment Methods List' && <>
                                                        <td className="align-middle small">{datalist_item.name}</td>
                                                        <td className="align-middle small">{datalist_item.slug}</td>
                                                        <td className="align-middle small">{JSON.stringify(datalist_item.choice_currency_codes, null, 2)}</td>
                                                        <td className="align-middle small">{JSON.stringify(datalist_item.details_required, null, 2)}</td>
                                                        <td className="align-middle small"><button className="btn btn-sm" style={{ backgroundColor: '#' + datalist_item.hex_color }}>{datalist_item.hex_color}</button></td>
                                                        <td className="align-middle small"><img src={datalist_item.icon.uri} alt={datalist_item.name + " icon"} width="40" height="40" className="rounded-1 me-2" /></td>
                                                        <td className="align-middle small">{datalist_item._status}</td>
                                                    </>}
                                                    {this.props.title == 'Countries List' && <>
                                                        <td className="align-middle small">{datalist_item.name}</td>
                                                        <td className="align-middle small">{datalist_item.code}</td>
                                                        <td className="align-middle small">{JSON.stringify(datalist_item.choice_pymt_method_slugs, null, 2)}</td>
                                                        <td className="align-middle small">{JSON.stringify(datalist_item.choice_currency_codes, null, 2)}</td>
                                                        <td className="align-middle small">{JSON.stringify(datalist_item.allowed_asset_codes, null, 2)}</td>
                                                        <td className="align-middle small">{datalist_item._status}</td>
                                                    </>}
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
                                    <button className='btn btn-success' >Add new</button>
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
                    </div>
                </div>
            </div>
        </this.props.PageWrapper >
    }
}