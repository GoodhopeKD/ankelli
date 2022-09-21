import React from "react"
import Logo from "app/assets/img/logo/logo.jpeg";

export default class ConnectionFailedScreen extends React.Component {
    render() {
        return <div className="d-grid min-vh-100 min-vw-100 align-items-center justify-content-center">
            <div className="d-grid">
                <img src={Logo} alt="logo" style={{ maxHeight: 200, justifySelf:'center' }} />
                <p>Connection with backend server could not be established.</p>
                <p>Press the button below to retry.</p>
                <button className="w-100 mb-5 btn btn-md rounded-3 btn-primary" onClick={this.props.connectivityBoot}>Retry</button>
            </div>
        </div>
    }
}