import React from "react"
import { connect } from 'react-redux'
import { Link } from "react-router-dom";
import _ from 'lodash'

import { _Offer, _Notification, _DateTime, _User } from 'app/controller'

import withRouter from 'app/views/navigation/withRouter'
import CustomSelect from 'app/views/components/CustomSelect'

class BgTaskHandler { static runInBackground = (fn) => fn() }

class OffersViewListScreen extends React.Component {

    working = false

    default_input = {
        offer_to: this.props.path == '/p2p/my-offers' ? undefined : (this.props.sysconfig_params.offer_to_buy_enabled ? 'buy' : this.props.sysconfig_params.offer_to_sell_enabled ? 'sell' : undefined),
        country_name: undefined,
        currency_code: undefined,
        asset_code: undefined,
        pymt_method_slug: undefined,
        _status: this.props.path == '/p2p/my-offers' ? 'all' : 'online',
        creator_username: this.props.path == '/p2p/my-offers' ? this.props.auth_user.username : undefined
    }

    state = {
        offers_list_loaded: false,
        list: [],
        list_loaded: false,
        list_full: false,
        list_refreshing: false,
        _collecion: { meta: {}, links: {} },

        showing_offer_to: this.props.sysconfig_params.offer_to_buy_enabled ? 'buy' : this.props.sysconfig_params.offer_to_sell_enabled ? 'sell' : undefined,

        input: _.cloneDeep(this.default_input),

        page_select: { page: 1, },
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
                offers_list_loaded: false,
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
                            showing_offer_to: input.offer_to,
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
        await this.universalGetCollection(_Offer, 'offers_list_loaded', JSON.parse(JSON.stringify(this.state.input)), this.state.page_select, this.state.per_page)
        if (show_list_refreshing_loader) this.setState({ list_refreshing: false })
    };

    componentDidMount() {
        const bgTask = () => this.populateScreenWithItems(false)
        try { BgTaskHandler.runInBackground(() => bgTask()) } catch (e) { bgTask() }

        this.setState({ datetime_update_seconds: 1 })
        this.datetimeUpdater = setInterval(() => { this.setState({ datetime_update_seconds: this.state.datetime_update_seconds + 1 }) }, 1);
    }

    componentWillUnmount(){
        clearInterval(this.datetimeUpdater)
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
            <div className="container-xl py-3">

                {(this.props.path == '/p2p/offers' || this.props.path == '/') && <>
                    <div className="row">
                        {(this.props.sysconfig_params.offer_to_buy_enabled && this.props.sysconfig_params.offer_to_sell_enabled) &&
                            <div className="col">
                                <label htmlFor="input_offer_to" className="form-label">I wish to</label>
                                <select className="form-select" id="input_offer_to" value={this.state.input.offer_to} onChange={rr => this.handleInputChange('offer_to', rr.target.value, true)} >
                                    <option value="buy">Sell</option>
                                    <option value="sell" >Buy</option>
                                </select>
                            </div>
                        }

                        <div className="col">
                            <label htmlFor="input_country_name" className="form-label">Country</label>
                            <CustomSelect
                                id="input_country_name"
                                options={country_options}
                                max_shown_options_count={5}
                                selected_option_value={this.state.input.country_name}
                                onChange={country_name => this.handleInputChange('country_name', country_name, true)}
                            />
                        </div>

                        <div className="col">
                            <label htmlFor="input_pymt_method_slug" className="form-label">Pay via</label>
                            <CustomSelect
                                id="input_pymt_method_slug"
                                options={pymt_method_options}
                                max_shown_options_count={5}
                                selected_option_value={this.state.input.pymt_method_slug}
                                onChange={pymt_method_slug => this.handleInputChange('pymt_method_slug', pymt_method_slug, true)}
                            />
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
                            Find offers
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

                </>}


                <div>
                    <div className="table-responsive">
                        <table className="table">
                            <thead>
                                <tr>
                                    {(this.props.path == '/p2p/offers' || this.props.path == '/') && <th scope="col">{this.state.showing_offer_to === 'buy' ? 'Buyer' : 'Seller'}</th>}
                                    {this.props.path == '/p2p/my-offers' && <th scope="col">Location</th>}
                                    <th scope="col">Trading</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Limits</th>
                                    {this.props.path == '/p2p/my-offers' && <th scope="col">Fill</th>}
                                    <th scope="col">Pay via</th>
                                    <th scope="col">Trade</th>
                                    {this.props.path == '/p2p/my-offers' && <th scope="col">Status</th>}
                                </tr>
                            </thead>
                            <tbody>
                                {this.state.list_loaded ? (
                                    this.state.list.map((offer, index) => {
                                        const currency = this.props.datalists.active_currencies[offer.currency_code]
                                        const pymt_method = this.props.datalists.active_pymt_methods[offer.pymt_method_slug]
                                        const progress = window.roundTo2dp((offer.offer_to === 'buy' ? (offer.filled_amount / offer.offer_total_purchase_amount) : (offer.filled_value / offer.offer_total_sell_value)) * 100)
                                        return <tr key={index} >
                                            <td className="align-middle">
                                                {(this.props.path == '/p2p/offers' || this.props.path == '/') && <i><b><Link to={'/accounts/profiles/' + offer.creator_username} style={{ textDecoration: 'none' }} target='_blank'>@{offer.creator_username}</Link></b> <small className='text-muted'>{window.isset(offer.creator_rating) ? (window.roundTo2dp(offer.creator_rating) + '⭐') : ''} {window.isset(offer.creator_trades_as_buyer_stats) ? ('BTCR: ' + offer.creator_trades_as_buyer_stats.completed + '/' + offer.creator_trades_as_buyer_stats.total) : ''}</small></i>}
                                                {this.props.path == '/p2p/my-offers' && <i>Offer to: {offer.offer_to}</i>}
                                                <br />In {window.isset(offer.location) && <> #{offer.location} - </>} {offer.country_name}
                                            </td>
                                            {offer.offer_to === 'buy' ? <>
                                                <td className="align-middle"><b>{offer.asset_code}</b> <i>for</i> <b>{offer.currency_code}</b>
                                                    <br /><small className="text-muted"><i>{this.props.auth_user && this.props.auth_user.username == offer.creator_username ? 'Last updated' : 'Posted'} {(new _DateTime(offer.updated_datetime).prettyDatetime())}</i></small></td>
                                                <td className="align-middle">{window.currencyAmountString(offer.offer_price, currency)}</td>
                                                <td className="align-middle">
                                                    {window.currencyAmountString(offer.min_trade_purchase_amount, currency)} - {window.currencyAmountString(offer.max_trade_purchase_amount, currency)}
                                                    {this.props.path == '/p2p/my-offers' && <>
                                                        <br />
                                                    Total : {window.currencyAmountString(offer.offer_total_purchase_amount, currency)}
                                                    </>}
                                                </td>
                                                {this.props.path == '/p2p/my-offers' && <td className="align-middle">
                                                    {window.currencyAmountString(offer.filled_amount, currency)}
                                                    <br />
                                                    <div className="progress mt-1">
                                                        <div className={"progress-bar bg-primary"} style={{ width: progress + '%' }} role="progressbar" aria-valuenow={progress} aria-valuemin="0" aria-valuemax="100">{progress}%</div>
                                                    </div>
                                                </td>}
                                            </> : <>
                                                <td className="align-middle"><b>{offer.currency_code}</b> <i>for</i> <b>{offer.asset_code}</b>
                                                    <br /><small className="text-muted"><i>{this.props.auth_user && this.props.auth_user.username == offer.creator_username ? 'Last updated' : 'Posted'} {(new _DateTime(offer.updated_datetime).prettyDatetime())}</i></small></td>
                                                <td className="align-middle">{window.currencyAmountString(offer.offer_price, currency)}</td>
                                                <td className="align-middle">
                                                    {offer.min_trade_sell_value} {offer.asset_code} - {offer.max_trade_sell_value} {offer.asset_code}
                                                    {this.props.path == '/p2p/my-offers' && <>
                                                        <br />
                                                    Total : {offer.offer_total_sell_value} {offer.asset_code}
                                                    </>}
                                                </td>
                                                {this.props.path == '/p2p/my-offers' && <td className="align-middle">
                                                    {offer.filled_value} {offer.asset_code}
                                                    <br />
                                                    <div className="progress mt-1">
                                                        <div className={"progress-bar bg-primary"} style={{ width: progress + '%' }} role="progressbar" aria-valuenow={progress} aria-valuemin="0" aria-valuemax="100">{progress}%</div>
                                                    </div>
                                                </td>}
                                            </>}
                                            <td className="align-middle">
                                                <img src={pymt_method.icon.uri} alt={pymt_method.name + " icon"} width="40" height="40" className="rounded-1 me-2" />
                                                {pymt_method.name}
                                            </td>
                                            <td className="align-middle">
                                                <div className="btn-group">
                                                    {/*<button type="button" className="btn btn-sm btn-outline-secondary">•••</button>*/}
                                                    <Link to={'/p2p/offers/' + offer.ref_code} className='btn btn-sm btn-danger' >{offer.offer_to == 'buy' ? <>Sell</> : <>Buy</>}</Link>
                                                </div>
                                            </td>
                                            {this.props.path == '/p2p/my-offers' && <td className="align-middle">
                                                <div className="form-check form-switch d-flex justify-content-center">
                                                    {this.state.loading_item == offer.ref_code ?
                                                        <div className="spinner-border spinner-border-sm text-dark" style={{ width: 20, height: 20, marginLeft: -45 }}></div> :
                                                        <input className="form-check-input" type="checkbox" role="switch"
                                                            checked={offer._status == 'online'}
                                                            onChange={() => {
                                                                this.setState({ loading_item: offer.ref_code });
                                                                const callbackAction = offer._status == 'online' ? () => (new _Offer(offer)).setOffline() : () => (new _Offer(offer)).setOnline();
                                                                callbackAction()
                                                                    .then(() => { this.should_load_items = true; this.populateScreenWithItems(); })
                                                                    .catch(e => _Notification.flash({ message: e.message, duration: 5000 }))
                                                                    .finally(() => this.setState({ loading_item: null }))
                                                            }}
                                                        />
                                                    }
                                                </div>
                                            </td>}
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

export default connect(mapStateToProps)(withRouter(OffersViewListScreen))