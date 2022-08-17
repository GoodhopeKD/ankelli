import React from "react"

export default class TradesSingleViewScreen extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container py-5">Trades Single View</div>
        </this.props.PageWrapper>
    }
}