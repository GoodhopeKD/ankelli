import React from 'react'

export default class FAQsScreen extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-xl py-5">FAQs screen</div>
        </this.props.PageWrapper>
    }
}