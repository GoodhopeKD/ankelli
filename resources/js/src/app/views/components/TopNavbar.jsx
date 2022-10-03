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
                <div className="container-xl">
                    <header className="d-flex flex-wrap py-3 align-items-center" >
                        <div className="d-none d-md-block col-1 col-sm-2 col-md-1">
                            <Link to={'/'} className={'d-flex mb-2 mb-md-0 text-dark text-decoration-none'} >
                                <img src={Logo} alt="logo" width="32" height="32" className="rounded-circle" />
                            </Link>
                        </div>

                        <ul className={"nav nav-pills col-" + (this.props.curr_auth_state ? '11' : '8') + " col-sm-" + (this.props.curr_auth_state ? '11' : '8') + " col-md-" + (this.props.curr_auth_state ? '10' : '8') + " justify-content-center"}>
                            {this.props._top_navbar_menu.menu_items.map((item, index) => {
                                return <li className="nav-item" key={index}>
                                    <Link to={item.path} className={"nav-link " + ((item.path === this.props.curr_path || ((this.props.curr_path === '/' || this.props.curr_path === '/p2p') && item.path === '/p2p/offers')) ? 'active' : '')} >
                                        {item.title}
                                    </Link>
                                </li>
                            })}
                        </ul>

                        {this.props.curr_auth_state ?
                            <div className="col-1 col-sm-1 col-md-1 dropdown text-end">
                                <a href="#" className="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" >
                                    <img src={require("app/assets/img/user_avatar/" + (window.padNumber(this.props.auth_user.avatar_image_id ?? '0')) + ".png").default} alt="User avatar" width="32" height="32" className="rounded-circle" />
                                </a>
                                <ul className="dropdown-menu text-small dropdown-menu-end">
                                    <li><i className="dropdown-header">@{this.props.auth_user.username}</i></li>
                                    <li><hr className="dropdown-divider" /></li>
                                    {this.props._top_navbar_user_menu.menu_items.map((item, index) => {
                                        const linkk = <Link to={item.path} className="dropdown-item" onClick={e => { if (item.path === '/#/accounts/auth/signout') { e.stopPropagation(); e.preventDefault(); this.setState({ btn_signout_working: true }); this.props.auth_user.signOut().then(() => { _Notification.flash({ message: "You're now signed out", duration: 1000 }) }) } }} >
                                            {(this.state.btn_signout_working && item.path === '/#/accounts/auth/signout') ? <div className="text-center"><div className="spinner-border spinner-border-sm"></div></div> : item.title}
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
                            <div className="col-4 col-sm-4 col-md-3 text-end">
                                <Link to={'/accounts/auth/signin' + this.props.location.search} className={'btn btn-outline-primary me-2'} style={{ width: 75 }} >Login</Link>
                                <Link to={'/accounts/auth/signup' + this.props.location.search} className={'btn btn-primary'} style={{ width: 75 }} >Signup</Link>
                            </div>
                        }
                    </header>
                </div>
            </div>
        </>
    }
})