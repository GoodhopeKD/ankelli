import React from "react"
import Logo from "app/assets/img/logo/logo.jpeg";

export default class SplashScreen extends React.Component {
    render() {
        return <div className="d-flex min-vh-100 min-vw-100 align-items-center justify-content-center">
            <div className='d-grid' >
                <div className="spinner-grow text-danger" style={{ justifySelf: 'center', width:50, height:50 }}></div>
                <img src={Logo} alt="logo" style={{ maxHeight: 300 }} />
            </div>
        </div>
    }
}