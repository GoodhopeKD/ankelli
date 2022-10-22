import React from "react"
import _ from 'lodash'

import { _User, _Notification, _Asset, _DateTime, _Input } from 'app/controller'

import SideBar from 'app/views/components/SideBar'
import withRouter from 'app/views/navigation/withRouter'

export default withRouter(class AssetsViewSingleScreen extends React.Component {

    default_input = {
        password: new _Input(),
        activation_batch_size: new _Input(5),
    }

    state = {
        focused_asset_loaded: false,
        input: _.cloneDeep(this.default_input),
    }

    focused_asset = null

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

    componentDidMount = () => {
        _Asset.getOne({ id: this.props.params.id })
            .then(asset => {
                this.focused_asset = new _Asset(asset)
                this.setState({ focused_asset_loaded: true, })
            })
            .catch(e => {
                _Notification.flash({ message: e.message, duration: 5000 });
                if (e.request && e.request._status == 404) { this.setState({ single_item_not_found: true }) }
            })
    }

    render() {

        const load_condition = this.state.focused_asset_loaded

        if (this.state.single_item_not_found)
            return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
                <div className="container-xl py-5">
                    <div className="d-flex align-items-center justify-content-center">
                        <div className="text-center">
                            <h1 className="display-1 fw-bold">404</h1>
                            <p className="fs-3"> <span className="text-danger">Opps!</span> Page not found.</p>
                            <p className="lead">
                                The page you’re looking for doesn’t exist.
                            </p>
                        </div>
                    </div>
                </div>
            </this.props.PageWrapper>

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-xl py-3">
                <div className="row">
                    <div className="col-lg-2">
                        <SideBar nav_menus={this.props.nav_menus.filter(menu => menu.slug === 'admin_menu')} />
                    </div>
                    <div className="col-lg-10">
                        {load_condition ? <>
                            <div className="row">
                                <div className="col">
                                    <h5>Asset name: {this.focused_asset.name}</h5>
                                    <br />
                                    <p style={{ whiteSpace: 'pre-wrap' }}>Onchain disclaimer: <br />{this.focused_asset.onchain_disclaimer}</p>

                                    <div className="card-body">
                                        <div className="accordion" id="accordion_edit_asset_params">

                                            <div className="accordion-item">
                                                <h4 className="accordion-header" >
                                                    <button className="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_activate_next_gp_addresses_batch" >
                                                        Activate next gaspump addresses batch
                                                    </button>
                                                </h4>
                                                <div id="collapse_activate_next_gp_addresses_batch" className="accordion-collapse collapse" data-bs-parent="#accordion_edit_asset_params" >
                                                    <div className="accordion-body">
                                                        <div className="row mb-3">
                                                            <div className="col">
                                                                <label htmlFor="input_activation_batch_size" className="form-label">Size of batch to activate</label>
                                                                <div className="input-group">
                                                                    <input
                                                                        type="number" className="form-control" id="input_activation_batch_size"
                                                                        min={1}
                                                                        step={1}
                                                                        max={270}
                                                                        value={this.state.input.activation_batch_size.toRaw()}
                                                                        onChange={elem => this.handleInputChange('activation_batch_size', elem.target.value)}
                                                                    />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button type="button"
                                                            onClick={() => {
                                                                this.setState({ btn_activate_next_gp_addresses_batch_working: true })
                                                                this.focused_asset.activate_next_gp_addresses_batch(this.state.input.activation_batch_size.toRaw())
                                                                    .then(() => { _Notification.flash({ message: "Request sent", duration: 5000 }); this.componentDidMount() })
                                                                    .catch(e => _Notification.flash({ message: e.message, duration: 5000 }))
                                                                    .finally(() => this.setState({ btn_activate_next_gp_addresses_batch_working: false }))
                                                            }}
                                                            className="btn btn-primary" disabled={this.state.btn_activate_next_gp_addresses_batch_working} >
                                                            {this.state.btn_activate_next_gp_addresses_batch_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Activate</>}
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </> :
                            <div style={{ alignItems: 'center', padding: 40 }} className='d-grid'>
                                <div className="spinner-grow text-danger" style={{ justifySelf: 'center', width: 50, height: 50 }}></div>
                            </div>
                        }
                    </div>
                </div>
            </div>
        </this.props.PageWrapper>
    }
})