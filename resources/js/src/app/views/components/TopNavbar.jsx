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
                    <header className={"d-flex flex-wrap " + (this.props.curr_auth_state ? 'pt-1 pb-2 py-sm-3' : 'py-3') + " align-items-center"} >
                        <div className={"d-none d-sm-block col-1 col-md-" + (this.props.curr_auth_state ? '1' : '2') + " col-lg-2"}>
                            <Link to={'/'} className={'d-flex text-dark text-decoration-none'} >
                                <img src={Logo} alt="logo" width="32" height="32" className="rounded-circle" />
                            </Link>
                        </div>

                        <ul className={"nav nav-pills col-" + (this.props.curr_auth_state ? '11' : '9') + " col-sm-" + (this.props.curr_auth_state ? '10' : '8') + " col-md-" + (this.props.curr_auth_state ? '10' : '8') + " col-lg-8 justify-content-center"}>
                            {this.props._top_navbar_menu.menu_items.map((item, index) => {
                                return <li className="nav-item" key={index}>
                                    <Link to={item.path} className={"nav-link px-1 px-sm-2 px-md-3 " + ((item.path === this.props.curr_path || ((this.props.curr_path === '/' || this.props.curr_path === '/p2p') && item.path === '/p2p/offers')) ? 'active' : '')} >
                                        {item.title}
                                    </Link>
                                </li>
                            })}
                        </ul>

                        {this.props.curr_auth_state ?
                            <div className="col-1 col-lg-2 d-flex justify-content-end dropdown">
                                <a href="#" className="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" >
                                    <img src={require("app/assets/img/user_avatar/" + (window.padUserAvatarImageId(this.props.auth_user.avatar_image_id ?? '0')) + ".png").default} alt="User avatar" width="32" height="32" className="rounded-circle" />
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
                            <div className="col-3 col-md-2 col-lg-2">
                                <div className="d-flex gap-1 justify-content-end">
                                    <Link to={'/accounts/auth/signin' + this.props.location.search} className={'btn btn-outline-primary px-1'} style={{ width: 65 }} >Login</Link>
                                    <Link to={'/accounts/auth/signup' + this.props.location.search} className={'btn btn-primary px-1 d-none d-sm-block'} style={{ width: 65 }} >Signup</Link>
                                </div>
                            </div>
                        }
                    </header>
                </div>
            </div>
        </>
    }
})