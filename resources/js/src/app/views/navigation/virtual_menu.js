import React from 'react'
import SignInModal from 'app/views/components/SignIn.modal'
import SignUpModal from 'app/views/components/SignUp.modal'
import GeneratePasswordResetTokenModal from 'app/views/components/GeneratePasswordResetToken.modal'
import ResetLostPasswordModal from 'app/views/components/ResetLostPassword.modal'
import RecoverLostUsernameModal from 'app/views/components/RecoverLostUsername.modal'

class ExampleElement extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-fluid py-3">
                {this.props.title} Screen
            </div>
        </this.props.PageWrapper>
    }
}

class ModalToScreenWrapper extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container">
                <div className="modal py-2 position-static d-block">
                    {this.props.children}
                </div>
            </div>
        </this.props.PageWrapper>
    }
}

class ErrorScreen extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container py-5">
                {this.props.children}
            </div>
        </this.props.PageWrapper>
    }
}

export const virtual_menu = {
    slug: 'virtual_menu',
    menu_title: 'Virtual Menu',
    menu_items: [
        {
            title: 'Sign In',
            path: '/signin',
            element: (props) => <ModalToScreenWrapper {...props} ><SignInModal {...props} component_context="screen" /></ModalToScreenWrapper>,
            show_when_auth_state_is: false,
        },
        {
            title: 'Sign Up',
            path: '/signup',
            element: (props) => <ModalToScreenWrapper {...props} ><SignUpModal {...props} component_context="screen" /></ModalToScreenWrapper>,
            show_when_auth_state_is: false,
        },
        {
            title: 'Reset lost password',
            path: '/generate_password_reset_token',
            element: (props) => <ModalToScreenWrapper {...props} ><GeneratePasswordResetTokenModal {...props} component_context="screen" /></ModalToScreenWrapper>,
            show_when_auth_state_is: false,
        },
        {
            title: 'Reset lost password',
            path: '/reset_lost_password',
            element: (props) => <ModalToScreenWrapper {...props} ><ResetLostPasswordModal {...props} component_context="screen" /></ModalToScreenWrapper>,
            show_when_auth_state_is: false,
        },
        {
            title: 'Recover lost username',
            path: '/recover_lost_username',
            element: (props) => <ModalToScreenWrapper {...props} ><RecoverLostUsernameModal {...props} component_context="screen" /></ModalToScreenWrapper>,
            show_when_auth_state_is: false,
        },
        {
            title: 'Error 403: Not authorized',
            path: '/403',
            element: (props) => <ErrorScreen {...props} >You are not authorized to view this page.</ErrorScreen>,
        },
        {
            title: 'Error 404: Page not found',
            path: '/404',
            element: (props) => <ErrorScreen {...props} >Page not found.</ErrorScreen>,
        },
    ]
}