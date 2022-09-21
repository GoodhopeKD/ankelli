import React from "react"
import { connect } from 'react-redux'
import { Link } from "react-router-dom";

import { _DepositToken, _Notification, _User, _DateTime, _Input, _UserGroup, _Permission, _Exportable, _UserGroupMembership } from 'app/controller'
import SideBar from 'app/views/components/SideBar'
import withRouter from 'app/views/navigation/withRouter'

class BgTaskHandler { static runInBackground = (fn) => fn() }

export default withRouter(class SysToolsListViewScreen extends React.Component {

    list_name = ''
    list_Type = null

    focused_user_group = null

    working = false

    default_input = {
        creator_username: undefined,
        _status: 'all',
    }

    state = {
        system_tools_list_loaded: false,
        list: [],
        list_loaded: false,
        list_full: false,
        list_refreshing: false,
        _collecion: { meta: {}, links: {} },

        input: _.cloneDeep(this.default_input),
        page_select: { page: 1, },
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
                system_tools_list_loaded: false,
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
        await this.universalGetCollection(this.list_Type, 'system_tools_list_loaded', JSON.parse(JSON.stringify(this.state.input)), this.state.page_select, this.state.per_page)
        if (show_list_refreshing_loader) this.setState({ list_refreshing: false })
    };

    componentDidMount = async () => {
        let list_Type = null
        switch (this.props.title) {
            case 'User Groups': list_Type = _UserGroup; break;
            case 'View User Group Members': list_Type = _UserGroupMembership; break;
            case 'Permissions': list_Type = _Permission; break;
            case 'Exportables': list_Type = _Exportable; break;
        }
        if (this.props.title == 'View User Group Members') {
            this.state.input.user_group_slug = this.props.params.user_group_slug
            this.state.input.get_with_meta = true
            this.focused_user_group = await _UserGroup.getOne({ slug: this.props.params.user_group_slug }).catch(e => console.log(e))
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
                        <h5>{this.props.title}</h5>
                        <hr />

                        {this.props.title == 'View User Group Members' && window.isset(this.focused_user_group) && <>
                            <p><b>Group name: {this.focused_user_group.name}</b></p>
                            <p style={{ whiteSpace: 'pre-wrap' }}><b>Description:</b><br />{this.focused_user_group.description}</p>
                            <hr />
                        </>}

                        <div>
                            <table className="table">
                                <thead>
                                    <tr>
                                        {this.props.title == 'User Groups' && <>
                                            <th scope="col">Name</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Status</th>
                                            <th scope="col" style={{ width: 140 }}>View members</th>
                                        </>}
                                        {this.props.title == 'View User Group Members' && <>
                                            <th scope="col">Username</th>
                                            <th scope="col">Post Title</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Adder</th>
                                            <th scope="col">Added datetime</th>
                                        </>}
                                        {this.props.title == 'Permissions' && <>
                                            <th scope="col">Name</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Status</th>
                                        </>}
                                        {this.props.title == 'Exportables' && <>
                                            <th scope="col">Name</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Status</th>
                                        </>}
                                    </tr>
                                </thead>
                                <tbody>
                                    {this.state.list_loaded ? (
                                        this.state.list.map((system_tools_item, index) => {
                                            return <tr key={index} >
                                                {this.props.title == 'User Groups' && <>
                                                    <td className="align-middle">{system_tools_item.name}</td>
                                                    <td className="align-middle" style={{ whiteSpace: 'pre-wrap' }}>{system_tools_item.description}</td>
                                                    <td className="align-middle">{system_tools_item._status}</td>
                                                    <td className="align-middle"><Link className="btn btn-sm btn-info" to={"/systools/user_groups/" + system_tools_item.slug + "/user_group_memberships"}>Open</Link></td>
                                                </>}
                                                {this.props.title == 'View User Group Members' && <>
                                                    <td className="align-middle">{system_tools_item.user_username}</td>
                                                    <td className="align-middle">{system_tools_item.post_title ?? '-'}</td>
                                                    <td className="align-middle">{system_tools_item._status}</td>
                                                    <td className="align-middle">{system_tools_item.creator_username}</td>
                                                    <td className="align-middle">{window.ucfirst(new _DateTime(system_tools_item.created_datetime).prettyDatetime())}</td>
                                                </>}
                                                {this.props.title == 'Permissions' && <>
                                                    <td className="align-middle">{system_tools_item.name}</td>
                                                    <td className="align-middle" style={{ whiteSpace: 'pre-wrap' }}>{system_tools_item.description}</td>
                                                    <td className="align-middle">{system_tools_item._status}</td>
                                                </>}
                                                {this.props.title == 'Exportables' && <>
                                                    <td className="align-middle">{system_tools_item.name}</td>
                                                    <td className="align-middle" style={{ whiteSpace: 'pre-wrap' }}>{system_tools_item.description}</td>
                                                    <td className="align-middle">{system_tools_item._status}</td>
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
                </div>
            </div>
        </this.props.PageWrapper >
    }
})