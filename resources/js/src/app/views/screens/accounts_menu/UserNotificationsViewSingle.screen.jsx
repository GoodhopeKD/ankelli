import React from "react"
import _ from 'lodash'

import { _User, _Notification, _DateTime, _Session, _Input } from 'app/controller'

import withRouter from 'app/views/navigation/withRouter'

export default withRouter(class NotificationsViewSingleScreen extends React.Component {

    state = {
        focused_notification_loaded: false,
    }

    focused_notification = null

    componentDidMount = () => {
        _Notification.getOne({ id: this.props.params.notification_id })
            .then(notification => {
                this.focused_notification = new _Notification(notification)
                this.setState({ focused_notification_loaded: true, })
            })
            .catch(e => {
                _Notification.flash({ message: e.message, duration: 5000 });
                if (e.request && e.request._status == 404) { this.setState({ single_item_not_found: true }) }
            })
            .finally(() => _Session.refresh())
    }

    render() {

        const load_condition = this.state.focused_notification_loaded

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
            <div className="container-xl py-4">
                {load_condition ? <>
                    <div className="row">
                        <div className="col">
                            <h5>Title: {this.focused_notification.content.title}</h5>
                            <p>Subtitle: {this.focused_notification.content.subtitle}</p>
                            <p style={{ whiteSpace: 'pre-wrap' }}>Body: <br />{this.focused_notification.content.body}</p>
                        </div>
                    </div>
                </> :
                    <div style={{ alignItems: 'center', padding: 40 }} className='d-grid'>
                        <div className="spinner-grow text-danger" style={{ justifySelf: 'center', width: 50, height: 50 }}></div>
                    </div>
                }
            </div>
        </this.props.PageWrapper>
    }
})