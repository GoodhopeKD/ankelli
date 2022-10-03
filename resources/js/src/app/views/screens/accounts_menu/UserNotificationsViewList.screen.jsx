import React from "react"
import { connect } from 'react-redux'
import { Link } from "react-router-dom";

import { _Notification, _User, _DateTime } from 'app/controller'

class BgTaskHandler { static runInBackground = (fn) => fn() }

class UserNotificationsViewListScreen extends React.Component {


    working = false

    state = {
        notifications_list_loaded: false,
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
        if (!this.working) {
            this.working = true
            this.setState({
                notifications_list_loaded: false,
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
                        return Promise.resolve();
                    })
                    .catch((error) => {
                        this.working = false
                        return Promise.reject(error);
                    }))
            }, 0))
        } else {
            return Promise.resolve();
        }
    }

    populateScreenWithItems = async (show_list_refreshing_loader = true) => {
        this.setState({ list_refreshing: show_list_refreshing_loader });
        await this.universalGetCollection(_Notification, 'notifications_list_loaded', JSON.parse(JSON.stringify({ ...this.state.input, user_username: this.props.auth_user.username })), this.state.page_select, this.state.per_page)
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

        const pagination_pages = [1]
        if (this.state._collecion.meta.last_page && this.state._collecion.meta.last_page !== 1) {
            for (let index = 2; index < this.state._collecion.meta.last_page + 1; index++) {
                pagination_pages.push(index)
            }
        }

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-xl py-3">
                <h5>User Notifications Center</h5>
                <hr />

                <div className="d-flex gap-2">
                    <div className="d-flex gap-2">
                        <label htmlFor="input__status" className="align-self-center">Status</label>
                        <select className="form-select" id="input__status" value={this.state.input._status} onChange={rr => { this.handleInputChange('_status', rr.target.value, true); this.populateScreenWithItems() }} >
                            <option value="all">All</option>
                            <option value="read" >Read</option>
                            <option value="unread" >Unread</option>
                        </select>
                    </div>
                </div>

                <hr className="mb-0" />

                <div>

                    <table className="table">
                        <thead className="d-none">
                            <tr>
                                <th scope="col">Note</th>
                            </tr>
                        </thead>
                        <tbody>
                            {this.state.list_loaded ? (
                                this.state.list.map((notification, index) => {
                                    return <tr key={index} >
                                        <td className={"align-middle" + (notification.read_datetime ? '' : ' table-secondary')}>
                                            <Link to={'/accounts/notifications/' + notification.id} style={{ textDecoration: 'none' }} className="w-100" >
                                                <i className="text-muted">{window.ucfirst(new _DateTime(notification.created_datetime).prettyDatetime())}</i> - {notification.content.title}: {notification.content.subtitle}
                                            </Link>
                                        </td>
                                    </tr>
                                })
                            ) : (
                                <tr>
                                    <td colSpan="20">
                                        <div style={{ alignItems: 'center' }} className='d-grid'>
                                            <div className="spinner-grow text-danger" style={{ justifySelf: 'center', width: 22, height: 22 }}></div>
                                        </div>
                                    </td>
                                </tr>
                            )}
                        </tbody>
                    </table>

                    <div className="d-flex gap-2" >

                        <div>
                            <div className="d-flex gap-1">
                                <label htmlFor="input_per_page" className="align-self-center">Items</label>
                                <select className="form-select" id="input_per_page" value={this.state.per_page} onChange={element => this.setState({ per_page: parseInt(element.target.value) }, () => { this.populateScreenWithItems() })} >
                                    {[5, 10, 25, 50, 100].map((per_page, index) => <option key={index} value={per_page} >{per_page}</option>)}
                                </select>
                            </div>
                        </div>

                        <div>
                            <nav>
                                <ul className="pagination">
                                    <li className={"page-item" + ((this.state._collecion.meta.current_page == 1 || !this.state.list_loaded) ? ' disabled' : '')}>
                                        <a className="page-link" href="#" aria-label="Previous" onClick={() => this.setState({ page_select: { page: 1, } }, () => { this.populateScreenWithItems() })} > <span aria-hidden="true">«</span> </a>
                                    </li>
                                    {pagination_pages.map(page => <li key={page} className={"page-item" + (this.state._collecion.meta.current_page == page ? ' active' : '') + (!this.state.list_loaded ? ' disabled' : '')} onClick={() => this.setState({ page_select: { page } }, () => { this.populateScreenWithItems() })} ><a className="page-link" href="#">{page}</a> </li>)}
                                    <li className={"page-item" + ((this.state._collecion.meta.current_page == this.state._collecion.meta.last_page || !this.state.list_loaded) ? ' disabled' : '')}>
                                        <a className="page-link" href="#" aria-label="Next" onClick={() => this.setState({ page_select: { page: this.state._collecion.meta.last_page, } }, () => { this.populateScreenWithItems() })} > <span aria-hidden="true">»</span> </a>
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
        auth_user: state.auth_user_data ? new _User(state.auth_user_data) : null,
    }
}

export default connect(mapStateToProps)(UserNotificationsViewListScreen)