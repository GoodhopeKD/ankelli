import React from 'react'

export default class TermsOfServiceScreen extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container py-5">Terms Of Service Screen</div>
        </this.props.PageWrapper>
    }
}