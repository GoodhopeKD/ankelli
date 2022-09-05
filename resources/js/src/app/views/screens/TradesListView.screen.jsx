import React from "react"
import { connect } from 'react-redux'
import { Link } from "react-router-dom";

import { _Trade, _Notification, _User, _DateTime, _Input } from 'app/controller'

class BgTaskHandler { static runInBackground = (fn) => fn() }

class TradesListViewScreen extends React.Component {

    working = false

    state = {
        trades_list_loaded: false,
        list: [],
        list_loaded: false,
        list_full: false,
        list_refreshing: false,
        _collecion: { meta: {}, links: {} },

        input: {
            _status: 'all',
            country_name: undefined,
            currency_code: undefined,
            asset_code: undefined,
            pymt_method_slug: undefined,
        },
        page_select: {
            page: 1,
        },
        per_page: 10
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

    async universalGetCollection(_Type, indicator_var_name, input = null, page_select = null, per_page = null) {
        //if (page_select && this.state.list_full) return Promise.resolve();
        if (!this.should_load_items) {
            _Notification.flash({ message: 'No filters changed', duration: 2000 })
            return Promise.resolve();
        }
        if (!this.working) {
            this.working = true
            this.setState({
                trades_list_loaded: false,
                list: [],
                list_loaded: false,
                list_full: false,
                list_refreshing: false
            })
            setTimeout(
                () => {
                    _Type.getCollection({ ...input, user_username: this.props.auth_user.username }, page_select, per_page)
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
        await this.universalGetCollection(_Trade, 'trades_list_loaded', JSON.parse(JSON.stringify(this.state.input)), this.state.page_select, this.state.per_page)
        if (show_list_refreshing_loader) this.setState({ list_refreshing: false })
    };

    componentDidMount() {
        const bgTask = () => this.populateScreenWithItems(false)
        try { BgTaskHandler.runInBackground(() => bgTask()) } catch (e) { bgTask() }
    }

    render() {

        const country_options = [];
        Object.keys(this.props.datalists.active_countries).forEach(country_name => { country_options.push({ value: country_name, searchable_text: country_name, output_element: () => country_name }) })

        const pymt_method_options = [];
        Object.keys(this.props.datalists.active_pymt_methods).forEach(pymt_method_slug => {
            const pymt_method = this.props.datalists.active_pymt_methods[pymt_method_slug]
            pymt_method_options.push({
                value: pymt_method_slug,
                searchable_text: pymt_method_slug + pymt_method.name + pymt_method.description,
                output_element: () => <><span className="d-inline-block rounded-circle p-1 align-self-center" style={{ backgroundColor: '#' + pymt_method.hex_color }}></span>{pymt_method.name}</>
            })
        })

        const asset_options = [];
        Object.keys(this.props.datalists.active_assets).forEach(asset_code => {
            const asset = this.props.datalists.active_assets[asset_code]
            asset_options.push({
                value: asset_code,
                searchable_text: asset_code + asset.name + asset.description,
                output_element: () => <>{asset.name} <i className="text-primary">{asset_code}</i></>
            })
        })

        const currency_options = [];
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
            <div className="container py-3">

                <div className="d-flex gap-2 justify-content-betwee">
                    <div className="d-flex gap-2 mt-3">
                        <label htmlFor="input__status" className="align-self-center">Status</label>
                        <select className="form-select" id="input__status" value={this.state.input._status} onChange={rr => { this.handleInputChange('_status', rr.target.value, true); this.should_load_items = true; this.populateScreenWithItems() }} >
                            <option value="all">All</option>
                            <option value="active" >Active</option>
                            <option value="cancelled" >Cancelled</option>
                            <option value="flagged" >Flagged</option>
                        </select>
                    </div>

                    <div className="d-flex gap-2 mt-3">
                        <label htmlFor="input_per_page" className="align-self-center">Items</label>
                        <select className="form-select" id="input_per_page" value={this.state.per_page} onChange={element => this.setState({ per_page: parseInt(element.target.value) }, () => { this.should_load_items = true; this.populateScreenWithItems() })} >
                            {[5, 10, 25, 50, 100].map((per_page, index) => <option key={index} value={per_page} >{per_page}</option>)}
                        </select>
                    </div>
                </div>

                <hr />

                {this.state.list_loaded ? (
                    <div>
                        <table className="table">
                            <thead>
                                <tr>
                                    <th scope="col">Trade peer</th>
                                    <th scope="col">Trading</th>
                                    <th scope="col">Amount</th>
                                    <th scope="col">Asset Value</th>
                                    <th scope="col">Payment method</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                {this.state.list.map((trade, index) => {
                                    const asset = this.props.datalists.active_assets[trade.asset_code]
                                    const currency = this.props.datalists.active_currencies[trade.currency_code]
                                    const pymt_method = this.props.datalists.active_pymt_methods[trade.pymt_method_slug]

                                    var btn_class = 'success'
                                    switch (trade._status) {
                                        case 'active': btn_class = 'primary'; break;
                                        case 'flagged': btn_class = 'warning'; break;
                                        case 'cancelled': btn_class = 'danger'; break;
                                        case 'completed': btn_class = 'success'; break;
                                    }

                                    return <tr key={index} >
                                        <td className="align-middle"><i>@{trade.creator_username == this.props.auth_user.username ? trade.offer_creator_username : trade.creator_username}</i><br />In {trade.location !== null && <> #{trade.location} - </>} {trade.country_name}</td>
                                        <td className="align-middle"><b>{trade.asset_code}</b> <i>for</i> <b>{trade.currency_code}</b>
                                            <br /><small className="text-muted"><i>Last activity: {window.ucfirst(new _DateTime(trade.updated_datetime).prettyDatetime())}</i></small></td>
                                        <td className="align-middle">{window.currencyAmountString(trade.currency_amount, currency)}</td>
                                        <td className="align-middle">{window.assetValueString(trade.asset_value, asset)}</td>
                                        <td className="align-middle">
                                            <img src={pymt_method.icon.uri} alt={pymt_method.name + " icon"} width="40" height="40" className="rounded-1 me-2" />
                                            {pymt_method.name}
                                        </td>
                                        <td className="align-middle" width="100">
                                            <button type="button" className={"btn w-100 btn-sm btn-outline-" + btn_class}>{window.ucfirst(trade._status)}</button>
                                        </td>
                                        <td className="align-middle">
                                            <div className="btn-group">
                                                <button type="button" className="btn btn-sm btn-outline-secondary">•••</button>
                                                <Link to={'/trades/' + trade.ref_code} className='btn btn-sm btn-primary' >Open</Link>
                                            </div>
                                        </td>
                                    </tr>
                                })}
                            </tbody>
                        </table>
                        <div className="row" >

                            <div className="col">
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

export default connect(mapStateToProps)(TradesListViewScreen)