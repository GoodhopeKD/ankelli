import React from "react"

export default class OffersCreateNewScreen extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container py-5">Create New Offer</div>
        </this.props.PageWrapper>
    }
}