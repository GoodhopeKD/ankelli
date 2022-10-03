import React from 'react'

export default class PrivacyPolicyScreen extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-xl py-5">Privacy policy screen</div>
        </this.props.PageWrapper>
    }
}