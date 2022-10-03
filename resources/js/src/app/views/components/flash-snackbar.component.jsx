import React from 'react';
import { connect } from 'react-redux';

import { hideOrClearFlashComponent } from 'app/controller/actions/flash_notification.actions';

const FlashSnackbar = (props) => {

    const domss = () =>
        <div
            style={{ position: 'absolute', borderRadius: 10 }}
            visible={props.flash_notification.visible}
            duration={props.flash_notification.duration}
            onDismiss={props.hideOrClearFlashComponent}
        >
            {props.flash_notification.message}
        </div>

    let timeout_started = false
    const timeouter = () => setTimeout(() => {
        props.hideOrClearFlashComponent()
    }, props.flash_notification.duration);

    if (props.flash_notification.visible && !timeout_started) {
        timeout_started = true
        timeouter()
    }

    return (
        <div className="toast-container position-fixed" style={{ top: 30, right:30 }}>
            <div className={"toast fade " + (props.flash_notification.visible ? "show" : 'hide')} >
                <div className="toast-header">
                    <svg className="bd-placeholder-img rounded me-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#007aff"></rect></svg>
                    <strong className="me-auto">Ankelli</strong>
                    <small className="text-muted">Just now</small>
                    <button type="button" className="btn-close" onClick={props.hideOrClearFlashComponent} data-bs-dismiss="toast" ></button>
                </div>
                <div className="toast-body bg-white rounded-bottom">
                    {props.flash_notification.message}
                </div>
            </div>
        </div>
    )
}

const mapStateToProps = (central_state) => {
    return {
        flash_notification: central_state.app_instance_state_data.flash_notification
    };
};

const mapDispatchToProps = (dispatch) => {
    return {
        hideOrClearFlashComponent: () => dispatch(hideOrClearFlashComponent()),
    };
};

export default connect(mapStateToProps, mapDispatchToProps)(FlashSnackbar);