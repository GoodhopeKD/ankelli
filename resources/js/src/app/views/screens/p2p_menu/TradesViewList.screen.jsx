import React from "react"
import { connect } from 'react-redux'
import { Link } from "react-router-dom";

import { _Trade, _Notification, _User, _DateTime, _Input } from 'app/controller'

class BgTaskHandler { static runInBackground = (fn) => fn() }

class TradesViewListScreen extends React.Component {

    working = false

    state = {
        trades_list_loaded: false,
        // collection/list params
        list: [],
        list_loaded: false,
        list_full: false,
        list_refreshing: false,
        _collecion: { meta: {}, links: {} },
        page_select: { page: 1, },
        per_page: 10,

        input: {
            _status: 'all',
        },
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
            return new Promise((resolve) => setTimeout(() => {
                resolve(_Type.getCollection({ ...input, user_username: this.props.auth_user.username }, page_select, per_page)
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
        await this.universalGetCollection(_Trade, 'trades_list_loaded', JSON.parse(JSON.stringify(this.state.input)), this.state.page_select, this.state.per_page)
        if (show_list_refreshing_loader) this.setState({ list_refreshing: false })
    };

    componentDidMount() {
        const bgTask = () => this.populateScreenWithItems(false)
        try { BgTaskHandler.runInBackground(() => bgTask()) } catch (e) { bgTask() }

        this.setState({ datetime_update_seconds: 1 })
        this.datetimeUpdater = setInterval(() => { this.setState({ datetime_update_seconds: this.state.datetime_update_seconds + 1 }) }, 1);
    }

    componentWillUnmount() {
        clearInterval(this.datetimeUpdater)
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

                <div className="d-flex gap-2">
                    <div className="d-flex gap-2">
                        <label htmlFor="input__status" className="align-self-center">Status</label>
                        <select className="form-select" id="input__status" value={this.state.input._status} onChange={elem => { this.handleInputChange('_status', elem.target.value, true); this.should_load_items = true; this.populateScreenWithItems() }} >
                            <option value="all">All</option>
                            <option value="active" >Active</option>
                            <option value="cancelled" >Cancelled</option>
                            <option value="flagged" >Flagged</option>
                        </select>
                    </div>
                </div>

                <hr />

                <div>

                    <div className="table-responsive">
                        <table className="table">
                            <thead>
                                <tr>
                                    <th scope="col">Trade peer</th>
                                    <th scope="col">Trading</th>
                                    <th scope="col">Amount</th>
                                    <th scope="col">Asset value</th>
                                    <th scope="col">Pay via</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                {this.state.list_loaded ? (
                                    this.state.list.map((trade, index) => {
                                        trade = new _Trade(trade)
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

                                        const trade_peer_username = trade.creator_username == this.props.auth_user.username ? trade.offer_creator_username : trade.creator_username
                                        const auth_user_is_buyer = (trade.was_offer_to == 'sell' && trade.creator_username == this.props.auth_user.username) || (trade.was_offer_to == 'buy' && trade.offer_creator_username == this.props.auth_user.username)
                                        //const auth_user_is_seller = (trade.was_offer_to == 'buy' && trade.creator_username == this.props.auth_user.username) || (trade.was_offer_to == 'sell' && trade.offer_creator_username == this.props.auth_user.username)
                                        const trade_closed = ['completed', 'cancelled'].includes(trade._status)

                                        return <tr key={index} className={((auth_user_is_buyer && trade.buyer_opened_datetime == null) ? ' table-secondary' : '')} >
                                            <td className="align-middle">
                                                <i><Link to={'/accounts/profiles/' + trade_peer_username} style={{ textDecoration: 'none' }} target='_blank'><b>@{trade_peer_username}</b></Link> <small className='text-muted'>{window.isset(trade.peer_rating) ? (window.currencyAmountInput(trade.peer_rating) + '⭐') : ''} {window.isset(trade.peer_trades_as_buyer_stats) ? ('BTCR: ' + trade.peer_trades_as_buyer_stats.completed + '/' + trade.peer_trades_as_buyer_stats.total) : ''}</small></i>
                                                <br /><small className="text-muted"><i>Last activity: {window.ucfirst(trade.last_activity_datetime.prettyDatetime())}</i></small>
                                            </td>
                                            <td className="align-middle">
                                                {auth_user_is_buyer ? <>
                                                    <b>{trade.currency_code}</b> <i>for</i> <b>{trade.asset_code}</b> <small className="text-muted">(buying)</small>
                                                </> : <>
                                                    <b>{trade.asset_code}</b> <i>for</i> <b>{trade.currency_code}</b> <small className="text-muted">(selling)</small>
                                                </>}
                                                {!trade_closed && <><br /><small className='text-muted'>🕑 {(trade.mins_remaining > 0) ? trade.mins_remaining + ' mins remaining' : -1 * trade.mins_remaining + ' mins late'}</small></>}
                                            </td>
                                            <td className="align-middle">{window.currencyAmountString(trade.currency_amount, currency)}</td>
                                            <td className="align-middle">{window.assetValueString(trade.asset_value, asset)}</td>
                                            <td className="d-flex gap-2">
                                                <img src={pymt_method.icon.uri} alt={pymt_method.name + " icon"} width="40" height="40" className="rounded-1" />
                                                <span>
                                                    <b>{pymt_method.name}</b>
                                                    <br /><small className="text-muted">In {window.isset(trade.location) && <> #{trade.location} - </>} {trade.country_name}</small>
                                                </span>
                                            </td>
                                            <td className="align-middle" width="100">
                                                <button type="button" className={"btn w-100 btn-sm btn-outline-" + btn_class}>{window.ucfirst(trade._status)}</button>
                                            </td>
                                            <td className="align-middle">
                                                <div className="btn-group">
                                                    {/*<button type="button" className="btn btn-sm btn-outline-secondary">•••</button>*/}
                                                    <Link to={'/p2p/trades/' + trade.ref_code} className='btn btn-sm btn-primary' >Open</Link>
                                                </div>
                                            </td>
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

export default connect(mapStateToProps)(TradesViewListScreen)