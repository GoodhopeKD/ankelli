import React from "react"
import { connect } from 'react-redux'
import { Link } from "react-router-dom";

import { _DepositToken, _Notification, _User, _DateTime, _Input, _Asset, _Currency, _PymtMethod, _Country } from 'app/controller'
import SideBar from 'app/views/components/SideBar'

class BgTaskHandler { static runInBackground = (fn) => fn() }

export default class DatalistListViewScreen extends React.Component {

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

        input: _.cloneDeep(this.default_input),
        page_select: {
            page: 1,
        },
        per_page: undefined
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
            setTimeout(
                () => {
                    _Type.getCollection({ ...get_collection_params }, page_select, per_page)
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
                        })
                }, 0
            );
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
            <div className="container-fluid py-3">
                <div className="row">
                    <div className="col-2">
                        <SideBar nav_menus={[this.props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />
                    </div>
                    <div className="col-10">
                        <div className='row'>
                            <div className="col">
                                <label htmlFor="input_per_page" className="form-label">Items</label>
                                <select className="form-select" id="input_per_page" value={this.state.per_page} onChange={element => this.setState({ per_page: parseInt(element.target.value) }, () => { this.should_load_items = true; this.populateScreenWithItems() })} >
                                    {[undefined, 5, 10, 25, 50, 100].map((per_page, index) => <option key={index} value={per_page} >{per_page}</option>)}
                                </select>
                            </div>

                        </div>

                        <hr />

                        {this.state.list_loaded ? (
                            <div>
                                <table className="table">
                                    <thead>
                                        <tr>
                                            {this.props.title == 'Assets List' && <>
                                                <th scope="col">Name</th>
                                                <th scope="col">Code</th>
                                                <th scope="col">Smallest Display Unit</th>
                                                <th scope="col">Status</th>
                                            </>}
                                            {this.props.title == 'Currencies List' && <>
                                                <th scope="col">Name</th>
                                                <th scope="col">Code</th>
                                                <th scope="col">Symbol</th>
                                                <th scope="col">Symbol Located</th>
                                                <th scope="col">USD rate</th>
                                                <th scope="col">Min transactable cash amount</th>
                                                <th scope="col">Smallest transactable cash denomination amount</th>
                                                <th scope="col">Status</th>
                                            </>}
                                            {this.props.title == 'Payment Methods List' && <>
                                                <th scope="col">Name</th>
                                                <th scope="col">Slug</th>
                                                <th scope="col">Choice currencies</th>
                                                <th scope="col">Details required</th>
                                                <th scope="col">Hex color</th>
                                                <th scope="col">Icon</th>
                                                <th scope="col">Status</th>
                                            </>}
                                            {this.props.title == 'Countries List' && <>
                                                <th scope="col">Name</th>
                                                <th scope="col">Code</th>
                                                <th scope="col">Choice payment methods</th>
                                                <th scope="col">Choice currencies</th>
                                                <th scope="col">Allowed assets</th>
                                                <th scope="col">Status</th>
                                            </>}
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {this.state.list.map((datalist_item, index) => {
                                            return <tr key={index} >
                                                {this.props.title == 'Assets List' && <>
                                                    <td className="align-middle">{datalist_item.name}</td>
                                                    <td className="align-middle">{datalist_item.code}</td>
                                                    <td className="align-middle">{datalist_item.smallest_display_unit}</td>
                                                    <td className="align-middle">{datalist_item._status}</td>
                                                </>}
                                                {this.props.title == 'Currencies List' && <>
                                                    <td className="align-middle">{datalist_item.name}</td>
                                                    <td className="align-middle">{datalist_item.code}</td>
                                                    <td className="align-middle">{datalist_item.symbol}</td>
                                                    <td className="align-middle">{datalist_item.symbol_before_number ? 'Before Number' : 'After Number'}</td>
                                                    <td className="align-middle">{datalist_item.usd_rate}</td>
                                                    <td className="align-middle">{datalist_item.min_transactable_cash_amount}</td>
                                                    <td className="align-middle">{datalist_item.smallest_transactable_cash_denomination_amount}</td>
                                                    <td className="align-middle">{datalist_item._status}</td>
                                                </>}
                                                {this.props.title == 'Payment Methods List' && <>
                                                    <td className="align-middle">{datalist_item.name}</td>
                                                    <td className="align-middle">{datalist_item.slug}</td>
                                                    <td className="align-middle">{JSON.stringify(datalist_item.choice_currency_codes, null, 2)}</td>
                                                    <td className="align-middle">{JSON.stringify(datalist_item.details_required, null, 2)}</td>
                                                    <td className="align-middle"><button className="btn btn-sm" style={{ backgroundColor: '#' + datalist_item.hex_color }}>{datalist_item.hex_color}</button></td>
                                                    <td className="align-middle"><img src={datalist_item.icon.uri} alt={datalist_item.name + " icon"} width="40" height="40" className="rounded-1 me-2" /></td>
                                                    <td className="align-middle">{datalist_item._status}</td>
                                                </>}
                                                {this.props.title == 'Countries List' && <>
                                                    <td className="align-middle">{datalist_item.name}</td>
                                                    <td className="align-middle">{datalist_item.code}</td>
                                                    <td className="align-middle">{JSON.stringify(datalist_item.choice_pymt_method_slugs, null, 2)}</td>
                                                    <td className="align-middle">{JSON.stringify(datalist_item.choice_currency_codes, null, 2)}</td>
                                                    <td className="align-middle">{JSON.stringify(datalist_item.allowed_asset_codes, null, 2)}</td>
                                                    <td className="align-middle">{datalist_item._status}</td>
                                                </>}
                                            </tr>
                                        })}
                                    </tbody>
                                </table>
                                <div className="d-flex gap-2" >

                                    <div>
                                        <nav aria-label="Standard pagination example">
                                            <ul className="pagination">
                                                <li className={"page-item " + (this.state._collecion.meta.current_page == 1 ? 'disabled' : '')}>
                                                    <a className="page-link" href="#" aria-label="Previous"
                                                        onClick={() => this.setState({ page_select: { page: 1, } }, () => { this.should_load_items = true; this.populateScreenWithItems() })}
                                                    >
                                                        <span aria-hidden="true">«</span>
                                                    </a>
                                                </li>
                                                {pagination_pages.map(page => <li key={page} className={"page-item " + (this.state._collecion.meta.current_page == page ? 'active' : '')}
                                                    onClick={() => this.setState({ page_select: { page } }, () => { this.should_load_items = true; this.populateScreenWithItems() })}
                                                ><a className="page-link" href="#">{page}</a></li>
                                                )}

                                                <li className={"page-item " + (this.state._collecion.meta.current_page == this.state._collecion.meta.last_page ? 'disabled' : '')}>
                                                    <a className="page-link" href="#" aria-label="Next"
                                                        onClick={() => this.setState({ page_select: { page: this.state._collecion.meta.last_page, } }, () => { this.should_load_items = true; this.populateScreenWithItems() })}
                                                    >
                                                        <span aria-hidden="true">»</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        ) : (
                            <div style={{ alignItems: 'center', padding: 40 }} className='d-grid'>
                                <div className="spinner-grow text-danger" style={{ justifySelf: 'center', width: 50, height: 50 }}></div>
                            </div>
                        )}
                    </div>
                </div>
            </div>
        </this.props.PageWrapper >
    }
}