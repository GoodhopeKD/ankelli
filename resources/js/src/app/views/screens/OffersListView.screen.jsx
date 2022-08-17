import React from "react"
import { connect } from 'react-redux'
import { Link } from "react-router-dom";

import { _Offer, _Notification, _DateTime } from 'app/controller'

import CustomSelect from 'app/views/components/CustomSelect'

class BgTaskHandler { static runInBackground = (fn) => fn() }

class OffersListViewScreen extends React.Component {

    working = false

    state = {
        offers_list_loaded: false,
        list: [],
        list_loaded: false,
        list_full: false,
        list_refreshing: false,
        _collecion: { meta: {}, links: {} },

        showing_offer_to: this.props.sysconfig_params.offer_to_buy_enabled ? 'buy' : this.props.sysconfig_params.offer_to_sell_enabled ? 'sell' : undefined,

        get_collection_params: {
            offer_to: this.props.sysconfig_params.offer_to_buy_enabled ? 'buy' : this.props.sysconfig_params.offer_to_sell_enabled ? 'sell' : undefined,
            country_name: undefined,
            currency_code: undefined,
            asset_code: undefined,
            pymt_method_slug: undefined,
        },
        page_select: {
            page: 1,
        },
        per_page: 5
    };

    should_load_items = true

    handle_get_collection_params_change(field, value) {
        let get_collection_params = this.state.get_collection_params
        get_collection_params[field] = value
        this.setState({ get_collection_params }, () => { this.should_load_items = true })
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
                offers_list_loaded: false,
                list: [],
                list_loaded: false,
                list_full: false,
                list_refreshing: false
            })
            setTimeout(
                () => {
                    _Type.getCollection(get_collection_params, page_select, per_page)
                        .then(({ collection }) => {
                            if (!collection.data) return Promise.resolve();
                            let update_object = {
                                showing_offer_to: get_collection_params.offer_to,
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
        await this.universalGetCollection(_Offer, 'offers_list_loaded', JSON.parse(JSON.stringify(this.state.get_collection_params)), this.state.page_select, this.state.per_page)
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
                output_element: () => <>{asset.name}</>
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

                <div className="row">
                    {(this.props.sysconfig_params.offer_to_buy_enabled && this.props.sysconfig_params.offer_to_sell_enabled) &&
                        <div className="col">
                            <label htmlFor="input_offer_to" className="form-label">Offers to</label>
                            <select className="form-select" id="input_offer_to" value={this.state.get_collection_params.offer_to} onChange={rr => this.handle_get_collection_params_change('offer_to', rr.target.value)} >
                                <option value="buy">Buy</option>
                                <option value="sell" >Sell</option>
                            </select>
                        </div>
                    }

                    <div className="col">
                        <label htmlFor="input_country_name" className="form-label">Country</label>
                        <CustomSelect
                            element_id="input_country_name"
                            options={country_options}
                            max_shown_options_count={5}
                            selected_option_value={this.state.get_collection_params.country_name}
                            onChange={country_name => this.handle_get_collection_params_change('country_name', country_name)}
                        />
                    </div>

                    <div className="col">
                        <label htmlFor="input_pymt_method_slug" className="form-label">Payment method</label>
                        <CustomSelect
                            element_id="input_pymt_method_slug"
                            options={pymt_method_options}
                            max_shown_options_count={5}
                            selected_option_value={this.state.get_collection_params.pymt_method_slug}
                            onChange={pymt_method_slug => this.handle_get_collection_params_change('pymt_method_slug', pymt_method_slug)}
                        />
                    </div>

                    <div className="col">
                        <label htmlFor="input_asset_code" className="form-label">Asset</label>
                        <CustomSelect
                            element_id="input_asset_code"
                            options={asset_options}
                            max_shown_options_count={5}
                            selected_option_value={this.state.get_collection_params.asset_code}
                            onChange={asset_code => this.handle_get_collection_params_change('asset_code', asset_code)}
                        />
                    </div>

                    <div className="col">
                        <label htmlFor="input_currency_code" className="form-label">Currency</label>
                        <CustomSelect
                            element_id="input_currency_code"
                            options={currency_options}
                            max_shown_options_count={5}
                            selected_option_value={this.state.get_collection_params.currency_code}
                            onChange={currency_code => this.handle_get_collection_params_change('currency_code', currency_code)}
                        />
                    </div>

                </div>

                <div className="d-flex justify-content-between">
                    <div className="d-flex gap-2 mt-3">
                        <label htmlFor="input_per_page" className="align-self-center">Items</label>
                        <select className="form-select" id="input_per_page" value={this.state.per_page} onChange={element => this.setState({ per_page: parseInt(element.target.value) }, () => { this.should_load_items = true; this.populateScreenWithItems() })} >
                            {[5, 10, 25, 50, 100].map((per_page, index) => <option key={index} value={per_page} >{per_page}</option>)}
                        </select>
                    </div>
                    <button
                        onClick={() => this.setState({ page_select: { page: 1 } }, () => { this.should_load_items = true; this.populateScreenWithItems() })}
                        className="btn btn-outline-danger mt-3"
                    >
                        Find offers
                    </button>
                    <button
                        onClick={() => this.setState({
                            get_collection_params: {
                                offer_to: 'buy',
                                country_name: undefined,
                                currency_code: undefined,
                                asset_code: undefined,
                                pymt_method_slug: undefined,
                            }
                        }, () => this.should_load_items = true)}
                        className="btn btn-outline-danger mt-3"
                    >
                        Reset Filters
                    </button>
                </div>


                <hr />

                {this.state.list_loaded ? (
                    <div>
                        <table className="table">
                            <thead>
                                <tr>
                                    <th scope="col">{this.state.showing_offer_to === 'buy' ? 'Buyer' : 'Seller'}</th>
                                    <th scope="col">Trading</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Limit</th>
                                    <th scope="col">Payment method</th>
                                    <th scope="col">Trade</th>
                                </tr>
                            </thead>
                            <tbody>
                                {this.state.list.map((offer, index) => {
                                    const currency = this.props.datalists.active_currencies[offer.currency_code]
                                    const pymt_method = this.props.datalists.active_pymt_methods[offer.pymt_method_slug]
                                    return <tr key={index} >
                                        <td className="align-middle"><i>@{offer.creator_username}</i><br />In #{offer.location}</td>
                                        {this.state.showing_offer_to === 'buy' ? <>
                                            <td className="align-middle"><b>{offer.asset_code}</b> <i>for</i> <b>{offer.currency_code}</b>
                                                <br /><small className="text-muted"><i>Posted {(new _DateTime(offer.updated_datetime).prettyDatetime())}</i></small></td>
                                            <td className="align-middle">{window.currencyAmountString(offer.asset_purchase_price, currency)}</td>
                                            <td className="align-middle">{window.currencyAmountString(offer.min_purchase_amount, currency)} - {window.currencyAmountString(offer.max_purchase_amount, currency)}</td>
                                        </> : <>
                                            <td className="align-middle"><b>{offer.currency_code}</b> <i>for</i> <b>{offer.asset_code}</b>
                                                <br /><small className="text-muted"><i>Posted {(new _DateTime(offer.updated_datetime).prettyDatetime())}</i></small></td>
                                            <td className="align-middle">{window.currencyAmountString(offer.asset_sell_price, currency)}</td>
                                            <td className="align-middle">{offer.min_sell_value} {offer.asset_code} - {offer.max_sell_value} {offer.asset_code}</td>
                                        </>}
                                        <td className="align-middle">
                                            <img src={pymt_method.icon.uri} alt={pymt_method.name + " icon"} width="40" height="40" className="rounded-1 me-2" />
                                            {pymt_method.name}
                                        </td>
                                        <td className="align-middle">
                                            <div className="btn-group">
                                                <button type="button" className="btn btn-sm btn-outline-secondary">•••</button>
                                                <Link to={'/offers/' + offer.ref_code} className='btn btn-danger' >{offer.offer_to == 'buy' ? <>Sell</> : <>Buy</>}</Link>
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
    }
}

export default connect(mapStateToProps)(OffersListViewScreen)