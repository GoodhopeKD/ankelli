import React from "react";
import { Link } from "react-router-dom";

import { _Notification } from 'app/controller';

import withRouter from 'app/views/navigation/withRouter'

import Logo from "app/assets/img/logo/logo.jpeg";

export default withRouter(class TopNavbar extends React.Component {

    state = {}

    render() {
        return <>
            <div className="container-fluid fixed-top bg-white shadow" style={{ borderBottomColor: 'black', borderBottomWidth: 1 }}>
                <div className="container">
                    <header className="d-flex flex-wrap py-3 align-items-center" >
                        <div className="col-md-3">
                            <Link to={'/'} className={'d-flex mb-2 mb-md-0 text-dark text-decoration-none'} >
                                <img src={Logo} alt="logo" width="32" height="32" className="rounded-circle" />
                            </Link>
                        </div>

                        <ul className="nav nav-pills col-md-6 justify-content-center">
                            {this.props.top_navbar_menu.menu_items.map((item, index) => {
                                return <li className="nav-item" key={index}>
                                    <Link to={item.path} className={"nav-link " + ((item.path === this.props.curr_path || (this.props.curr_path === '/' && item.path === '/offers')) ? 'active' : '')} >
                                        {item.title}
                                    </Link>
                                </li>
                            })}
                        </ul>

                        {this.props.curr_auth_state ?
                            <div className="col-md-3 dropdown text-end">
                                <a href="#" className="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                    <img src={require("app/assets/img/user_avatar/" + (window.padNumber(this.props.auth_user.avatar_image_id ?? '0')) + ".png").default} alt="User avatar" width="32" height="32" className="rounded-circle" />
                                </a>
                                <ul className="dropdown-menu text-small dropdown-menu-end">
                                    <li><i className="dropdown-header">@{this.props.auth_user.username}</i></li>
                                    <li><hr className="dropdown-divider" /></li>
                                    {this.props.top_navbar_user_menu.menu_items.map((item, index) => {
                                        const linkk = <Link to={item.path} className="dropdown-item" onClick={e => { if (item.path === '/#/signout') { e.stopPropagation(); e.preventDefault(); this.setState({ btn_signout_working: true }); this.props.auth_user.signOut().then(() => { this.setState({ btn_signout_working: false }); _Notification.flash({ message: "You're now signed out", duration: 1000 }) }) } }} >
                                            {(this.state.btn_signout_working && item.path === '/#/signout') ? <div className="text-center"><div className="spinner-border spinner-border-sm"></div></div> : item.title}
                                        </Link>
                                        if (item.has_divider_above) {
                                            return <React.Fragment key={index}>
                                                <li><hr className="dropdown-divider" /></li>
                                                <li>{linkk}</li>
                                            </React.Fragment>
                                        } else {
                                            return <li key={index}>{linkk}</li>
                                        }
                                    })}
                                </ul>
                            </div>
                            :
                            <div className="col-md-3 text-end">
                                <Link to={'/signin' + this.props.location.search} className={'btn btn-outline-primary me-2'} >Login</Link>
                                <Link to={'/signup' + this.props.location.search} className={'btn btn-primary'} >Sign Up</Link>
                            </div>
                        }
                    </header>
                </div>
            </div>
        </>
    }
})