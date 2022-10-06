import React from "react";
import { NavLink, useLocation } from 'react-router-dom';

class SideBar extends React.Component {

    shouldComponentUpdate() { return false; }

    render() {
        return this.props.nav_menus.map((menu, i) => {

            const TheMenu = React.memo(() => <ul className="list-unstyled ps-0">
                {menu.menu_items.map((item_i, ii) => {
                    const id = menu.menu_title.replace(/ /g, "_") + ii
                    const has_childred = item_i.children && item_i.children.length ? true : false
                    const childclass = has_childred ? "with-dropdown" : '';
                    const is_active = has_childred && useLocation().pathname.includes(item_i.path)
                    return (
                        <li className={`mb-1 ${childclass}`} key={ii}>
                            <NavLink
                                to={item_i.path}
                                className={"btn " + (has_childred ? "btn-toggle" : "btn-toggle-alt") + " d-inline-flex justify-content-between align-items-center rounded border-0 w-100"}
                                data-bs-toggle={has_childred ? "collapse" : undefined} data-bs-target={has_childred ? "#" + id : undefined}
                            >
                                {item_i.title}
                            </NavLink>

                            {has_childred && (
                                <div className={"collapse " + (is_active ? "show" : '')} id={id}>
                                    <ul className="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                        {item_i.children.map((item_j, j) => {
                                            return (
                                                <li className={`nav-item`} key={j}>
                                                    <NavLink
                                                        to={item_j.path}
                                                        className="link-dark d-inline-flex text-decoration-none rounded"
                                                        style={{ width: '90%' }}
                                                    >
                                                        {item_j.title}
                                                    </NavLink>
                                                </li>
                                            );
                                        })}
                                    </ul>
                                </div>
                            )}
                        </li>
                    );
                })}
            </ul>)

            return (
                <React.Fragment key={i}>
                    <div className="d-none d-lg-block">
                        <span className="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
                            <span className="fs-5 fw-semibold">{menu.menu_title}</span>
                        </span>
                        <TheMenu />
                    </div>

                    <div className="d-lg-none">
                        <div className="accordion mb-3" id={"accordion_small_display_menu_" + i}>
                            <div className="accordion-item">
                                <h4 className="accordion-header" >
                                    <button className="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target={"#collapse_small_display_menu_" + i} >
                                        {menu.menu_title}
                                    </button>
                                </h4>
                                <div id={"collapse_small_display_menu_" + i} className="accordion-collapse collapse" data-bs-parent={"#accordion_small_display_menu_" + i} >
                                    <div className="accordion-body pb-0">
                                        <TheMenu />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </React.Fragment>
            );
        })
    }
}

export default SideBar