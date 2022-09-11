import React from 'react'
import SignInScreen from 'app/views/screens/virtual_menu/SignIn.screen'
import SignUpScreen from 'app/views/screens/virtual_menu/SignUp.screen'

class ExampleElement extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-fluid py-3">
                {this.props.title} Screen
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
            element: (props) => <SignInScreen {...props} />,
            show_when_auth_state_is: false,
        },
        {
            title: 'Sign Up',
            path: '/signup',
            element: (props) => <SignUpScreen {...props} />,
            show_when_auth_state_is: false,
        },
        {
            title: 'Reset lost password',
            path: '/reset_lost_password',
            element: (props) => <ExampleElement {...props} />,
            show_when_auth_state_is: false,
        },
        {
            title: 'Recover lost username',
            path: '/recover_lost_username',
            element: (props) => <ExampleElement {...props} />,
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