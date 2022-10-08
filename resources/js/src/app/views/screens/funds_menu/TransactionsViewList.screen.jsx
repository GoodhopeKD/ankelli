import React from "react"
import { connect } from 'react-redux'
import _ from 'lodash'

import SideBar from 'app/views/components/SideBar'

import { _User, _Input, _Transaction, _DateTime, _Notification } from 'app/controller'
import CustomSelect from 'app/views/components/CustomSelect'

class BgTaskHandler { static runInBackground = (fn) => fn() }

class TransactionsViewListScreen extends React.Component {

    working = false

    default_input = {
        focused_user_username: this.props.auth_user.username,
        focused_user_username_tag: 'user_username', // sender_username // recipient_username
        asset_code: undefined,
    }

    state = {
        transactions_list_loaded: false,
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

    async universalGetCollection(_Type, indicator_var_name, input = null, page_select = null, per_page = null) {
        //if (page_select && this.state.list_full) return Promise.resolve();
        if (!this.should_load_items) {
            _Notification.flash({ message: 'No filters changed', duration: 2000 })
            return Promise.resolve();
        }
        if (!this.working) {
            this.working = true
            this.setState({
                transactions_list_loaded: false,
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
        await this.universalGetCollection(_Transaction, 'transactions_list_loaded', JSON.parse(JSON.stringify({ ...this.state.input, focused_user_username: undefined, focused_user_username_tag: undefined, [this.state.input.focused_user_username_tag]: this.state.input.focused_user_username })), this.state.page_select, this.state.per_page)
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

        const asset_options = [];
        Object.keys(this.props.datalists.active_assets).forEach(asset_code => {
            const asset = this.props.datalists.active_assets[asset_code]
            asset_options.push({
                value: asset_code,
                searchable_text: asset_code + asset.name + asset.description,
                output_element: () => <>{asset.name} <i className="text-primary">{asset_code}</i></>
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
                        <SideBar nav_menus={this.props.nav_menus.filter(menu => menu.slug === 'funds_menu')} />
                    </div>
                    <div className="col-lg-10">

                        <div className="row">

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
                                <label htmlFor="input_focused_user_username_tag" className="form-label">Type</label>
                                <select className="form-select" id="input_focused_user_username_tag" value={this.state.input.focused_user_username_tag} onChange={elem => this.handleInputChange('focused_user_username_tag', elem.target.value, true)} >
                                    <option value="user_username" >All</option>
                                    <option value="sender_username" >Debit</option>
                                    <option value="recipient_username" >Credit</option>
                                </select>
                            </div>

                        </div>

                        <div className="d-flex justify-content-between">

                            <button
                                onClick={() => { if (this.state.page_select.page !== 1) { this.setState({ page_select: { page: 1 } }, () => { this.should_load_items = true; this.populateScreenWithItems() }) } else { this.populateScreenWithItems() } }}
                                className="btn btn-outline-danger mt-3"
                            >
                                Load transactions
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
                                            <th scope="col">Ref Code</th>
                                            <th scope="col">Type</th>
                                            <th scope="col" style={{ minWidth: 150 }}>Asset Value</th>
                                            <th scope="col" style={{ minWidth: 300 }}>Note</th>
                                            <th scope="col" style={{ minWidth: 205 }}>Datetime</th>
                                            <th scope="col" style={{ minWidth: 150 }}>New balance</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {this.state.list_loaded ? (
                                            this.state.list.map((transaction, index) => {
                                                const asset = this.props.datalists.active_assets[transaction.asset_code]
                                                const debit = transaction.sender_username == this.props.auth_user.username
                                                const tr_group = debit ? 'Debit' : 'Credit'
                                                return <tr key={index} >
                                                    <td className="align-middle">{transaction.ref_code}</td>
                                                    <td className="align-middle">{tr_group}</td>
                                                    <td className="align-middle">{window.assetValueString(transaction.xfer_asset_value, asset)}</td>
                                                    <td className="align-middle">{debit ? transaction.sender_note : transaction.recipient_note}</td>
                                                    <td className="align-middle">{window.ucfirst(new _DateTime(transaction.transfer_datetime).prettyDatetime())}</td>
                                                    <td className="align-middle">{window.assetValueString(transaction.transfer_result.find(tr => tr.user_username == this.props.auth_user.username).new_total_balance_asset_value, asset)}</td>
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
                </div>
            </div>
        </this.props.PageWrapper>
    }
}

const mapStateToProps = (state) => {
    return {
        datalists: state.datalists_data,
        auth_user: state.auth_user_data ? new _User(state.auth_user_data) : null,
    }
}

export default connect(mapStateToProps)(TransactionsViewListScreen)