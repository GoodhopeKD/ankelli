import React from "react"

export default class LearnScreen extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-xl py-5">Learn how the platform works.</div>
        </this.props.PageWrapper>
    }
}