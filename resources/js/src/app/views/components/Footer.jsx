import React from 'react'
import { NavLink } from "react-router-dom";

export default class Footer extends React.Component {
    render() {
        return <>
            <footer className="fixed-botto" style={{ /*zIndex: -1 */ }}>
                <div className="b-example-divider" style={{ height: 30 }}></div>
                <div className="container-xl pt-5" style={{ zIndex: 0 }}>
                    <div className="row">
                        {this.props._footer_menu.menu_items.map((item_i, ii) => {
                            return (
                                <div className={"col-12 col-sm-4 col-md-" + (ii == 2 ? '3' : '2') + " mb-2"} key={ii}>
                                    <h5>{item_i.title}</h5>
                                    <ul className="nav flex-column">
                                        {item_i.children.map((item_j, j) => {
                                            return (
                                                <li className={`nav-item mb-2`} key={j}>
                                                    <NavLink
                                                        to={item_j.path}
                                                        //reloadDocument={!['/learn', '/support/home'].includes(item_j.path)}
                                                        className="nav-link p-0 text-muted"
                                                    >
                                                        {item_j.title}
                                                    </NavLink>
                                                </li>
                                            );
                                        })}
                                    </ul>
                                </div>
                            );
                        })}

                        <div className="col-12 col-md-5 mb-2">
                            <form>
                                <h5>Subscribe to our newsletter</h5>
                                <p>Monthly digest of what's new and exciting from us.</p>
                                <div className="d-flex flex-column flex-sm-row flex-md-column flex-lg-row w-100 gap-2">
                                    <label htmlFor="newsletter1" className="visually-hidden">Email address</label>
                                    <input id="newsletter1" type="text" className="form-control" placeholder="Email address" />
                                    <button className="btn btn-primary" type="button">Subscribe</button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div className="d-flex flex-column flex-sm-row justify-content-between py-3 my-3 border-top">
                        <p>© 2022 Ankelli, Inc. All rights reserved.</p>
                        <ul className="list-unstyled d-flex">
                            <li className="ms-3"><a className="link-dark" href="#"><i className="fab fa-facebook"></i></a></li>
                            <li className="ms-3"><a className="link-dark" href="#"><i className="fab fa-twitter"></i></a></li>
                            <li className="ms-3"><a className="link-dark" href="#"><i className="fab fa-youtube"></i></a></li>
                        </ul>
                    </div>
                </div>
            </footer>
        </>
    }
}