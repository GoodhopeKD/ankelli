import React from 'react'

export default class PrivacyPolicyScreen extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container py-5">Privacy Policy Screen</div>
        </this.props.PageWrapper>
    }
}