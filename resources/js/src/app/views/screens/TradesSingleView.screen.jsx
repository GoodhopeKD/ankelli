import React from "react"
import { connect } from 'react-redux'
import { Link } from "react-router-dom";

import { _User, _Trade, _Notification, _DateTime, _Session, _Input } from 'app/controller'
import withRouter from 'app/views/navigation/withRouter'

class TradesSingleViewScreen extends React.Component {

    default_input = {
        source_user_password: new _Input('Def-Pass#123'),
        message_body: new _Input(),
        message_attachment: undefined,
    }

    state = {
        focused_trade_loaded: false,
        source_user_password_prompt_open: false,
        input: _.cloneDeep(this.default_input),
        errors: [],
    }

    focused_trade = null

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

    handleSubmit = async () => {
        this.setState({ btn_send_message_working: true })

        const btn_send_message_working = false
        const errors = []
        const input = this.state.input

        if (input.message_attachment) {
            input.message_attachment.uri = URL.createObjectURL(input.message_attachment)
            input.message_attachment.original_filename = input.message_attachment.name
            if ((input.message_body + '').length)
                if (!(input.message_body.isSafeText(1))) { errors.push('Message body invalid') }
        } else {
            //delete input.message_attachment
            if (!(input.message_body.isSafeText(1))) { errors.push('Message body invalid') }
        }

        if (errors.length === 0) {
            //delete input.pymt_details
            this.setState({ errors, input }) // Reload input error/success indicators on text/password/number inputs
            this.focused_trade.sendMessage(_Input.flatten(input)).then(() => { this.state.input.message_attachment = undefined; this.state.input.message_body = new _Input(); _Notification.flash({ message: 'Message sent', duration: 2000 }); this.componentDidMount(); this.setState({ btn_send_message_working, errors }) })
                .catch((error) => {
                    if (error.request && error.request._response && error.request._response.errors && Object.keys(error.request._response.errors).length) {
                        Object.keys(error.request._response.errors).forEach(input_key => { error.request._response.errors[input_key].forEach(input_key_error => { errors.push(input_key_error) }) })
                    } else { errors.push(error.message) }
                    this.setState({ btn_send_message_working, errors })
                })
        } else {
            this.setState({ btn_send_message_working, errors, input })
        }
    }

    handleSubmit2 = async () => {
        this.setState({ btn_confirm_pymt_working: true })
        const errors = []
        const input = this.state.input
        if (!input.source_user_password.isValid('password')) { errors.push("Invalid password") }
        if (errors.length === 0) {
            this.setState({ errors, input }) // Reload input error/success indicators on text/password/number inputs
            const _input = _Input.flatten(input)
            const password_confirmation_modal = bootstrap.Modal.getOrCreateInstance(document.getElementById('password_confirmation_modal'));
            this.focused_trade.confirmPymt(_input.source_user_password)
                .then(() => { password_confirmation_modal.hide(); this.setState({ btn_confirm_pymt_working: false }); _Notification.flash({ message: 'Payment confirmed.', duration: 2000 }); })
                .catch((error) => {
                    if (error.request && error.request._response && error.request._response.errors && Object.keys(error.request._response.errors).length) {
                        Object.keys(error.request._response.errors).forEach(input_key => { error.request._response.errors[input_key].forEach(input_key_error => { errors.push(input_key_error) }) })
                    } else { errors.push(error.message) }
                    this.setState({ btn_confirm_pymt_working: false, errors })
                })
        } else {
            this.setState({ btn_confirm_pymt_working: false, errors, input })
        }
    }

    componentDidMount = () => {
        _Trade.getOne({ ref_code: this.props.params.ref_code })
            .then(trade => {
                this.focused_trade = new _Trade(trade)
                this.handleInputChange('pymt_details', trade.pymt_details, true)
                this.setState({ focused_trade_loaded: true })
            })
            .catch(e => _Notification.flash({ message: e.message, duration: 5000 }))
            .finally(() => _Session.refresh())
    }

    render() {

        const load_condition = this.state.focused_trade_loaded
        const pymt_method = load_condition ? this.props.datalists.active_pymt_methods[this.focused_trade.pymt_method_slug] : null
        const asset = load_condition ? this.props.datalists.active_assets[this.focused_trade.asset_code] : null
        const currency = load_condition ? this.props.datalists.active_currencies[this.focused_trade.currency_code] : null

        const trade_peer_username = load_condition ? (this.focused_trade.creator_username == this.props.auth_user.username ? this.focused_trade.offer_creator_username : this.focused_trade.creator_username) : null
        const auth_user_is_buyer = load_condition && ((this.focused_trade.was_offer_to == 'sell' && this.focused_trade.creator_username == this.props.auth_user.username) || (this.focused_trade.was_offer_to == 'buy' && this.focused_trade.offer_creator_username == this.props.auth_user.username))
        const auth_user_is_seller = load_condition && ((this.focused_trade.was_offer_to == 'buy' && this.focused_trade.creator_username == this.props.auth_user.username) || (this.focused_trade.was_offer_to == 'sell' && this.focused_trade.offer_creator_username == this.props.auth_user.username))

        var btn_class = 'success'
        if (load_condition)
            switch (this.focused_trade._status) {
                case 'active': btn_class = 'primary'; break;
                case 'flagged': btn_class = 'warning'; break;
                case 'cancelled': btn_class = 'danger'; break;
                case 'completed': btn_class = 'success'; break;
            }

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container py-4">
                {load_condition ? <>
                    <div className="row">
                        <div className="col-4">
                            <div className="card mb-3">
                                <div className="card-header">
                                    Trade Details
                                </div>
                                <div className="card-body">
                                    <div className="progress mb-3">
                                        <div className={"progress-bar bg-" + btn_class + " w-" + this.focused_trade.progress} role="progressbar" aria-valuenow={this.focused_trade.progress} aria-valuemin="0" aria-valuemax="100">{this.focused_trade.progress}%</div>
                                    </div>
                                    <p>Initiated: {this.focused_trade.created_datetime.prettyDatetime()}</p>
                                    <p>Status: {window.ucfirst(this.focused_trade._status)}</p>
                                    <p>{auth_user_is_buyer ? <>Seller</> : <>Buyer</>}: <Link to={'/accounts/profiles/' + trade_peer_username} style={{ textDecoration: 'none' }} target='_blank'>@{trade_peer_username}</Link></p>
                                    <p>{this.focused_trade.was_offer_to == 'buy' && <>Purchase</>} {this.focused_trade.was_offer_to == 'sell' && <>Sale</>} amount: {window.currencyAmountString(this.focused_trade.currency_amount, currency)} ({currency.code})</p>
                                    <p>
                                        <>Asset value on sale: {window.assetValueString(this.focused_trade.currency_amount / this.focused_trade.offer_price, asset)} </>
                                    (@ {window.currencyAmountString(this.focused_trade.offer_price, currency)})
                                    </p>
                                    {['active', 'flagged'].includes(this.focused_trade._status) && <>
                                        <p>{pymt_method.name} <img src={pymt_method.icon.uri} alt={pymt_method.name + " icon"} width="24" height="24" className="mx-2" /> payment details:</p>
                                        {Object.keys(this.state.input.pymt_details).map((detail_key, index) => {
                                            return <div key={index} className="input-group mb-3">
                                                <div className="form-floating">
                                                    <input
                                                        type="password" className="form-control roundd-3" id={'input_pymt_method_detail_' + detail_key}
                                                        required
                                                        disabled
                                                        value={this.state.input.pymt_details[detail_key]}
                                                        onChange={e => this.handleInputChange('pymt_details.' + detail_key, e.target.value, true)}
                                                    />
                                                    <label htmlFor={'input_pymt_method_detail_' + detail_key} className="form-label">{detail_key.replace(/_/g, " ").capitalize()}</label>
                                                </div>
                                                <span className="btn btn-sm btn-outline-secondary d-grid align-content-center" onClick={() => document.getElementById('input_pymt_method_detail_' + detail_key).setAttribute('type', document.getElementById('input_pymt_method_detail_' + detail_key).getAttribute('type') == 'text' ? 'password' : 'text')}>𓁹</span>
                                            </div>
                                        })}
                                    </>}
                                    {['completed', 'cancelled'].includes(this.focused_trade._status) && <div>Payment method: {pymt_method.name} <img src={pymt_method.icon.uri} alt={pymt_method.name + " icon"} width="24" height="24" className="mx-2" /> (details hidden)</div>}
                                </div>
                            </div>
                            <div className="card mb-3">
                                <div className="card-header">
                                    Trade Actions
                                </div>
                                <div className="card-body">
                                    <div className="accordion" id="accordionExample">

                                        {(this.focused_trade._status !== 'cancelled' && auth_user_is_buyer && this.focused_trade.pymt_declared_datetime == null) && <>
                                            <div className="accordion-item">
                                                <h4 className="accordion-header" >
                                                    <button className="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_declare_payment" >
                                                        Declare payment
                                                    </button>
                                                </h4>
                                                <div id="collapse_declare_payment" className="accordion-collapse collapse" data-bs-parent="#accordionExample" >
                                                    <div className="accordion-body">
                                                        <p>As the buyer, when you have processed the payment, you should declare it with the button below</p>
                                                        <button className="w-100 btn rounded-3 btn-primary" disabled={this.state.btn_declare_pymt_working}
                                                            onClick={() => { this.setState({ btn_declare_pymt_working: true }, () => this.focused_trade.declarePymt().catch(e => _Notification.flash({ message: e.message, duration: 5000 })).finally(() => this.setState({ btn_declare_pymt_working: false }, () => _Notification.flash({ message: 'Payment declared', duration: 2000 })))) }} >
                                                            {this.state.btn_declare_pymt_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Declare payment</>}
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </>}

                                        {auth_user_is_seller && this.focused_trade.pymt_confirmed_datetime == null && <>
                                            <div className="accordion-item">
                                                <h4 className="accordion-header" >
                                                    <button className="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_confirm_payment" >
                                                        Confirm payment
                                                    </button>
                                                </h4>
                                                <div id="collapse_confirm_payment" className="accordion-collapse collapse" data-bs-parent="#accordionExample" >
                                                    <div className="accordion-body">

                                                        <p>As the seller, when the payment has been processed, you should confirm it with the button below</p>
                                                        <button className="w-100 btn rounded-3 btn-success" disabled={this.state.btn_confirm_pymt_working}
                                                            onClick={() => bootstrap.Modal.getOrCreateInstance(document.getElementById('password_confirmation_modal')).show()}  >
                                                            {this.state.btn_confirm_pymt_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Confirm payment</>}
                                                        </button>

                                                        <div className="modal fade" id="password_confirmation_modal" tabIndex="-1" >
                                                            <div className="modal-dialog modal-dialog-centered">
                                                                <div className="modal-content">
                                                                    <div className="modal-header">
                                                                        <h5 className="modal-title" >Password confirmation</h5>
                                                                        <button type="button" className="btn-close" data-bs-dismiss="modal"></button>
                                                                    </div>
                                                                    <div className="modal-body">
                                                                        <p>Funds are about to be released from your account. Confirm.</p>
                                                                        <div className="form-floating mb-3">
                                                                            <input
                                                                                type="password"
                                                                                className={"form-control" + (this.state.input.source_user_password.failedValidation() ? ' is-invalid' : '')}
                                                                                id="input_source_user_password"
                                                                                value={this.state.input.source_user_password + ''}
                                                                                onChange={e => this.handleInputChange('source_user_password', e.target.value)}
                                                                                required={this.state.source_user_password_prompt_open}
                                                                                placeholder="Pasword"
                                                                            />
                                                                            <span className="btn btn-sm" style={{ position: 'absolute', top: 13, right: 2 }} onClick={() => document.getElementById('input_source_user_password').setAttribute('type', document.getElementById('input_source_user_password').getAttribute('type') == 'text' ? 'password' : 'text')}>𓁹</span>
                                                                            <label htmlFor="input_source_user_password">Password</label>
                                                                        </div>

                                                                        <div className="mb-1">
                                                                            {this.state.errors.map((error, key) => (
                                                                                <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                                                                            ))}
                                                                        </div>
                                                                    </div>
                                                                    <div className="modal-footer justify-content-between">
                                                                        <button type="button" className="btn btn-secondary" data-bs-dismiss="modal" >Cancel</button>
                                                                        <button className="btn btn-primary" disabled={this.state.btn_confirm_pymt_working} onClick={this.handleSubmit2} >
                                                                            {this.state.btn_confirm_pymt_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Confirm payment</>}
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </>}

                                        {(auth_user_is_buyer && !['cancelled', 'completed'].includes(this.focused_trade._status) || (auth_user_is_seller && this.focused_trade.buyer_opened_datetime == null)) && <>
                                            <div className="accordion-item">
                                                <h4 className="accordion-header" >
                                                    <button className="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_cancel_trade" >
                                                        Cancel trade
                                                    </button>
                                                </h4>
                                                <div id="collapse_cancel_trade" className="accordion-collapse collapse" data-bs-parent="#accordionExample" >
                                                    <div className="accordion-body">
                                                        {(auth_user_is_buyer && !['cancelled', 'completed'].includes(this.focused_trade._status)) && <>
                                                            <button className="w-100 btn rounded-3 btn-danger" disabled={this.state.btn_cancel_trade_working}
                                                                onClick={() => {
                                                                    this.setState({ btn_cancel_trade_working: true },
                                                                        () => this.focused_trade.cancel()
                                                                            .then(() => _Notification.flash({ message: 'Trade cancelled', duration: 2000 }))
                                                                            .catch(e => _Notification.flash({ message: e.message, duration: 5000 }))
                                                                            .finally(() => this.setState({ btn_cancel_trade_working: false }))
                                                                    )
                                                                }} >
                                                                {this.state.btn_cancel_trade_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Cancel</>}
                                                            </button>
                                                        </>}

                                                        {auth_user_is_seller && this.focused_trade.buyer_opened_datetime == null && <>
                                                            <p>As the seller, you can cancel the trade if the buyer doesn't open it {this.props.sysconfig_params.buyer_open_trade_min_mins_tmt} minutes after it has been initiated.</p>
                                                            <button className="w-100 btn rounded-3 btn-danger" disabled={this.state.btn_cancel_trade_working || ((_DateTime.nowUnixTimeStamp() - this.focused_trade.created_datetime._unix_timestamp) < (this.props.sysconfig_params.buyer_open_trade_min_mins_tmt * 60))}
                                                                onClick={() => {
                                                                    this.setState({ btn_cancel_trade_working: true },
                                                                        () => this.focused_trade.cancel()
                                                                            .then(() => _Notification.flash({ message: 'Trade cancelled', duration: 2000 }))
                                                                            .catch(e => _Notification.flash({ message: e.message, duration: 5000 }))
                                                                            .finally(() => this.setState({ btn_cancel_trade_working: false }))
                                                                    )
                                                                }} >
                                                                {this.state.btn_cancel_trade_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Cancel</>}
                                                            </button>
                                                        </>}
                                                    </div>
                                                </div>
                                            </div>
                                        </>}

                                        {['active', 'completed'].includes(this.focused_trade._status) && (this.focused_trade.pymt_declared_datetime == null || (this.focused_trade.pymt_declared_datetime && ((_DateTime.nowUnixTimeStamp() - this.focused_trade.pymt_declared_datetime._unix_timestamp) < (10 * 60)))) && <>
                                            <div className="accordion-item">
                                                <h4 className="accordion-header" >
                                                    <button className="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_flag_trade" >
                                                        Flag trade
                                                    </button>
                                                </h4>
                                                <div id="collapse_flag_trade" className="accordion-collapse collapse" data-bs-parent="#accordionExample" >
                                                    <div className="accordion-body">
                                                        <p>You can raise flag to invite moderators to referee trade in the event of abuse.</p>
                                                        <button className="w-100 btn rounded-3 btn-warning" disabled={this.state.btn_flag_trade_working}
                                                            onClick={() => { this.setState({ btn_flag_trade_working: true }, () => this.focused_trade.flag().catch(e => _Notification.flash({ message: e.message, duration: 5000 })).finally(() => this.setState({ btn_flag_trade_working: false }, () => _Notification.flash({ message: 'Trade flagged', duration: 2000 })))) }}  >
                                                            {this.state.btn_flag_trade_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Flag trade</>}
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </>}

                                        {auth_user_is_seller && this.focused_trade._status == 'flagged' && <>
                                            <div className="accordion-item">
                                                <h4 className="accordion-header" >
                                                    <button className="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_unflag_trade" >
                                                        Unflag trade
                                                    </button>
                                                </h4>
                                                <div id="collapse_unflag_trade" className="accordion-collapse collapse" data-bs-parent="#accordionExample" >
                                                    <div className="accordion-body">
                                                        <button className="w-100 btn rounded-3 btn-primary" disabled={this.state.btn_flag_trade_working}
                                                            onClick={() => { this.setState({ btn_flag_trade_working: true }, () => this.focused_trade.unFlag().catch(e => _Notification.flash({ message: e.message, duration: 5000 })).finally(() => this.setState({ btn_flag_trade_working: false }, () => _Notification.flash({ message: 'Trade unflagged', duration: 2000 })))) }}  >
                                                            {this.state.btn_flag_trade_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Unflag trade</>}
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </>}

                                        {['cancelled', 'completed'].includes(this.focused_trade._status) && <>
                                            <div className="accordion-item">
                                                <h4 className="accordion-header" >
                                                    <button className="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_archive_trade" >
                                                        Archive trade
                                                    </button>
                                                </h4>
                                                <div id="collapse_archive_trade" className="accordion-collapse collapse" data-bs-parent="#accordionExample" >
                                                    <div className="accordion-body">
                                                        {this.focused_trade.visible_to_creator && this.focused_trade.creator_username == this.props.auth_user.username && <>
                                                            <button className="w-100 btn rounded-3 btn-info" disabled={this.state.btn_set_creator_visibility_working}
                                                                onClick={() => { this.setState({ btn_set_creator_visibility_working: true }, () => this.focused_trade.creatorArchive().catch(e => _Notification.flash({ message: e.message, duration: 5000 })).finally(() => this.setState({ btn_set_creator_visibility_working: false }, () => { _Notification.flash({ message: 'Trade archived', duration: 2000 }); this.props.navigate(-1) }))) }} >
                                                                {this.state.btn_set_creator_visibility_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Archive trade</>}
                                                            </button>
                                                        </>}

                                                        {this.focused_trade.visible_to_offer_creator && this.focused_trade.offer_creator_username == this.props.auth_user.username && <>
                                                            <button className="w-100 btn rounded-3 btn-info" disabled={this.state.btn_set_offer_creator_visibility_working}
                                                                onClick={() => { this.setState({ btn_set_offer_creator_visibility_working: true }, () => this.focused_trade.offerCreatorArchive().catch(e => _Notification.flash({ message: e.message, duration: 5000 })).finally(() => this.setState({ btn_set_offer_creator_visibility_working: false }, () => { _Notification.flash({ message: 'Trade archived', duration: 2000 }); this.props.navigate(-1) }))) }} >
                                                                {this.state.btn_set_offer_creator_visibility_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Archive trade</>}
                                                            </button>
                                                        </>}
                                                    </div>
                                                </div>
                                            </div>
                                        </>}
                                    </div>



                                </div>
                            </div>
                        </div>
                        <div className="col-8">
                            <div className="card">
                                <div className="card-header">
                                    Chat panel
                                </div>
                                <div className="card-body py-0" style={{ maxHeight: 460, overflowY: 'auto' }}>
                                    {this.focused_trade.messages.map((message, index) => {
                                        if (message.creator_username == 'system')
                                            return <div key={index} className={'my-1 px-5 text-center'}>
                                                <div className={'border text-muted'}>
                                                    <i className="text-muted small">{window.ucfirst((new _DateTime(message.created_datetime)).prettyDatetime())}</i>
                                                    <br />
                                                    <span style={{ whiteSpace: 'pre-wrap' }}>{message.body}</span>
                                                </div>
                                            </div>
                                        if (message.creator_username !== this.props.auth_user.username)
                                            return <div key={index} className="d-flex pt-2 border my-1">
                                                <img src={require("app/assets/img/user_avatar/" + (window.padNumber(message.creator_avatar_image_id ?? '0')) + ".png").default} alt="User avater image" width="32" height="32" className="bd-placeholder-img flex-shrink-0 mx-2 my-1 rounded" />
                                                <p className="pb-2 mb-0 lh-sm ">
                                                    <i className="d-flex text-muted small">@{message.creator_username} - {window.ucfirst((new _DateTime(message.created_datetime)).prettyDatetime())}</i>
                                                    {window.isset(message.attachment) && <><img src={message.attachment.uri} alt={message.attachment.title} height="300" className="bd-placeholder-img flex-shrink-0 my-1" /><br /></>}
                                                    <span style={{ whiteSpace: 'pre-wrap' }}>{message.body}</span>
                                                </p>
                                            </div>

                                        return <div key={index} className="d-flex justify-content-end bg-light pt-2 border my-1">
                                            <div>
                                                <p className="mb-0 lh-sm text-end">
                                                    <i className="text-muted small text-end">You - {window.ucfirst((new _DateTime(message.created_datetime)).prettyDatetime())}</i>
                                                </p>
                                                <p className="ms-2 pb-2 mb-0 lh-sm text-end">
                                                    {window.isset(message.attachment) && <><img src={message.attachment.uri} alt={message.attachment.title} height="300" className="bd-placeholder-img flex-shrink-0 my-1" /><br /></>}
                                                    <span style={{ whiteSpace: 'pre-wrap' }}>{message.body}</span>
                                                </p>
                                            </div>
                                            <img src={require("app/assets/img/user_avatar/" + (window.padNumber(message.creator_avatar_image_id ?? '0')) + ".png").default} alt="User avater image" width="32" height="32" className="bd-placeholder-img flex-shrink-0 mx-2 my-1 rounded" />
                                        </div>
                                    })}
                                </div>
                                <div className="card-footer">
                                    {this.state.errors.length !== 0 && <div className="mb-2">
                                        {this.state.errors.map((error, key) => (
                                            <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                                        ))}
                                    </div>}
                                    <form onSubmit={e => { e.preventDefault(); this.handleSubmit() }}>
                                        <div className="input-group">

                                            <span className="input-group-text d-block p-0">
                                                <label className={"btn btn-dark w-100 d-flex align-items-center " + (window.isset(this.state.input.message_attachment) ? "h-50" : "h-100")} style={{ borderBottomLeftRadius: this.state.input.message_attachment ? 0 : undefined, borderBottomRightRadius: 0, borderTopRightRadius: 0 }} type="submit" htmlFor="message_attachment_upload" >
                                                    📎
                                                    <input
                                                        type="file"
                                                        id="message_attachment_upload"
                                                        className="form-control d-none"
                                                        accept="image/*"
                                                        onChange={e => this.handleInputChange('message_attachment', e.target.files[0], true)}
                                                    />
                                                </label>
                                                {window.isset(this.state.input.message_attachment) && <>
                                                    <button className="btn btn-danger w-100 h-50" onClick={e => this.handleInputChange('message_attachment', undefined, true)} style={{ borderTopLeftRadius: 0, borderTopRightRadius: 0, borderBottomRightRadius: 0 }} type="submit" >
                                                        🗑️
                                                    </button>
                                                </>}
                                            </span>


                                            {window.isset(this.state.input.message_attachment) && <span className="input-group-text p-1">
                                                <img src={URL.createObjectURL(this.state.input.message_attachment)} alt="Attachement" height="92" />
                                            </span>}

                                            <textarea
                                                className="form-control"
                                                onChange={e => this.handleInputChange('message_body', e.target.value)}
                                                value={this.state.input.message_body + ''}
                                            >
                                            </textarea>
                                            <button className="btn btn-primary" type="submit" disabled={this.state.btn_send_message_working}>
                                                {this.state.btn_send_message_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Send</>}
                                            </button>
                                        </div>
                                    </form>
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
        </this.props.PageWrapper >
    }
}

const mapStateToProps = (state) => {
    return {
        datalists: state.datalists_data,
        sysconfig_params: state.sysconfig_params_data,
        auth_user: state.auth_user_data ? new _User(state.auth_user_data, ['asset_accounts']) : null,
    }
}

export default connect(mapStateToProps)(withRouter(TradesSingleViewScreen))