import React from "react"
import { connect } from 'react-redux'
import _ from 'lodash'

import { _User, _Notification, _DateTime, _Session, _Input } from 'app/controller'

import withRouter from 'app/views/navigation/withRouter'

class NotificationsSingleViewScreen extends React.Component {

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
            .catch(e => console.log(e))
            .finally(() => _Session.refresh())
    }

    render() {

        const load_condition = this.state.focused_notification_loaded

        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container py-4">
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
}

const mapStateToProps = (state) => {
    return {
        datalists: state.datalists_data,
        sysconfig_params: state.sysconfig_params_data,
        auth_user: state.auth_user_data ? new _User(state.auth_user_data, ['asset_accounts']) : null,
    }
}

export default connect(mapStateToProps)(withRouter(NotificationsSingleViewScreen))