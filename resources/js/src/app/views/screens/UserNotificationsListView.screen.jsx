import React from "react"

export default class UserNotificationsListViewScreen extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container py-5">User Notifications List View</div>
        </this.props.PageWrapper>
    }
}