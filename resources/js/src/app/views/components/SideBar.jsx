import React from "react";
import { NavLink, useLocation } from 'react-router-dom';

function SideBar(props) {
    return props.nav_menus.map((menu, i) => {
        return (
            <React.Fragment key={i}>
                <span className="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
                    <span className="fs-5 fw-semibold">{menu.menu_title}</span>
                </span>

                <ul className="list-unstyled ps-0">
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
                </ul>
            </React.Fragment>
        );
    })
}

export default SideBar