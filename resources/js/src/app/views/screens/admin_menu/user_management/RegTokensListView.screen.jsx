import React from "react"
import { Link } from "react-router-dom";

import { _RegToken, _Notification, _User, _DateTime, _Input } from 'app/controller'
import SideBar from 'app/views/components/SideBar'

class BgTaskHandler { static runInBackground = (fn) => fn() }

export default class RegTokensListViewScreen extends React.Component {

    working = false

    default_input = {
        creator_username: undefined,
        token: new _Input(),
        _status: undefined,
    }

    state = {
        reg_tokens_list_loaded: false,
        list: [],
        list_loaded: false,
        list_full: false,
        list_refreshing: false,
        _collecion: { meta: {}, links: {} },

        page_select: {
            page: 1,
        },
        per_page: 10,

        btn_create_reg_token_working: false,
        input: _.cloneDeep(this.default_input),
        errors: [],
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
                reg_tokens_list_loaded: false,
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
        await this.universalGetCollection(_RegToken, 'reg_tokens_list_loaded', JSON.parse(JSON.stringify({ ...this.state.input, token: undefined })), this.state.page_select, this.state.per_page)
        if (show_list_refreshing_loader) this.setState({ list_refreshing: false })
    };

    handleSubmit = async () => {
        this.setState({ btn_create_reg_token_working: true })

        const btn_create_reg_token_working = false
        const errors = []
        const input = { token: this.state.input.token }

        if ((input.token + '').length) {
            if (!input.token.isValid('reg_token')) { errors.push("Invalid token") }

            await input.token.async_checkIfAvailable('reg_token').then((resp) => {
                if (!input.token.isAvailable('reg_token')) { errors.push(resp.message) }
            }).catch(() => { errors.push("Could not check if token is available for use.") })
        } else {
            delete input.token
        }

        if (errors.length === 0) {
            this.setState({ errors }) // Remove input error indicators under text inputs
            const _input = Object.assign(Object.create(Object.getPrototypeOf(input)), input) // Dereference input object
            Object.keys(_input).forEach(key => { if (_input[key] instanceof _Input) _input[key] = _input[key] + "" }) // convert _Input instances to Text

            const add_new_reg_token_modal = bootstrap.Modal.getOrCreateInstance(document.querySelector('#add_new_reg_token_modal'));
            _RegToken.create(_input).then(() => { add_new_reg_token_modal.hide(); this.should_load_items = true; this.populateScreenWithItems(); _Notification.flash({ message: 'Reg token created', duration: 2000 }); })
                .catch((error) => {
                    errors.push(error.message)
                    this.setState({ btn_create_reg_token_working, errors, input: _.cloneDeep(this.default_input) })
                })
        } else {
            this.setState({ btn_create_reg_token_working, errors, input })
        }
    }

    componentDidMount() {
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
                                    {[5, 10, 25, 50, 100].map((per_page, index) => <option key={index} value={per_page} >{per_page}</option>)}
                                </select>
                            </div>

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

                        </div>

                        <div className="d-flex justify-content-between">

                            <button
                                onClick={() => { if (this.state.page_select.page !== 1) { this.setState({ page_select: { page: 1 } }, () => { this.should_load_items = true; this.populateScreenWithItems() }) } else { this.populateScreenWithItems() } }}
                                className="btn btn-outline-danger mt-3"
                            >
                                Load reg tokens
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

                        {this.state.list_loaded ? (
                            <div>
                                <table className="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Token</th>
                                            <th scope="col">Use count</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Creator</th>
                                            <th scope="col">Created datetime</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {this.state.list.map((reg_token, index) => {
                                            return <tr key={index} >
                                                <td className="align-middle">{reg_token.token}</td>
                                                <td className="align-middle">{reg_token.use_count}</td>
                                                <td className="align-middle">{reg_token._status}</td>
                                                <td className="align-middle">{reg_token.creator_username}</td>
                                                <td className="align-middle">{window.ucfirst(new _DateTime(reg_token.created_datetime).prettyDatetime())}</td>
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

                                    <div>

                                        <button type="button" className='btn btn-success' data-bs-toggle="modal" data-bs-target="#add_new_reg_token_modal">Create new</button>

                                        <div className="modal fade" id="add_new_reg_token_modal" tabIndex="-1" >
                                            <div className="modal-dialog modal-dialog-centered">
                                                <div className="modal-content">
                                                    <div className="modal-header">
                                                        <h5 className="modal-title" >Create new reg token</h5>
                                                        <button type="button" className="btn-close" data-bs-dismiss="modal"></button>
                                                    </div>
                                                    <div className="modal-body">

                                                        <div className="form-floating mb-3">
                                                            <input
                                                                type='text'
                                                                className={"form-control rounded-3 " + (this.state.input.token.hasError() ? 'is-invalid' : '')}
                                                                id="input_token"
                                                                value={this.state.input.token + ''}
                                                                onChange={e => this.handleInputChange('token', e.target.value)}
                                                                placeholder="Reg token"
                                                            />
                                                            <label htmlFor="input_token">Reg token (Leave empty to generate)</label>
                                                        </div>

                                                        <div className="mb-3">
                                                            {this.state.errors.map((error, key) => (
                                                                <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                                                            ))}
                                                        </div>
                                                    </div>
                                                    <div className="modal-footer">
                                                        <button type="button" className="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="button" className="btn btn-primary" onClick={this.handleSubmit}>Save or Generate</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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
        </this.props.PageWrapper>
    }
}