import React from 'react'
import { connect } from 'react-redux'
import { BrowserRouter, Routes, Route, useLocation, Navigate } from 'react-router-dom';

import { connectivityBoot, _User } from 'app/controller'

import TopNavbar from 'app/views/components/TopNavbar'

// stack not in menues
import { virtual_menu } from 'app/views/navigation/virtual_menu'
// top_navbar
import { top_navbar_menu } from 'app/views/navigation/top_navbar_menu'
import { top_navbar_user_menu } from 'app/views/navigation/top_navbar_user_menu'
// sidebar
import { user_profile_menu } from 'app/views/navigation/user_profile_menu'
import { account_settings_menu } from 'app/views/navigation/account_settings_menu'
import { admin_menu } from 'app/views/navigation/admin_menu'
// footer
import { footer_menu } from 'app/views/navigation/footer_menu'

const nav_menus = [
    // top_navbar
    top_navbar_menu,
    top_navbar_user_menu,
    // sidebar
    user_profile_menu,
    account_settings_menu,
    admin_menu,
    // virtual stack
    virtual_menu,
    // footer
    footer_menu,
]

function Navigator(props) {

    const login = props.login
    const logout = props.logout
    const auth_user = props.auth_user

    const curr_auth_state = props.temp_auth;

    const nav_list = []    // flattened, slugs added // for 404 and 403 messages
    const nav_list_filtered = []    // flattened, auth_state, auth_user: permissions & groups filtered // for router
    const nav_menus_filtered = []    // auth filtered, virtual routes filtered // for drawer

    if (nav_menus && nav_menus.length) {
        for (let i = 0; i < nav_menus.length; i++) {

            const visible_in_menu_i = nav_menus[i].visible_in_menu !== undefined ? nav_menus[i].visible_in_menu : false
            const auth_state_required_i = nav_menus[i].auth_state_required !== undefined ? nav_menus[i].auth_state_required : null

            const nav_menus_filtered_element = visible_in_menu_i ? { ...nav_menus[i], menu_items: [] } : null

            if (nav_menus[i] && nav_menus[i].menu_items) {
                for (let j = 0; j < nav_menus[i].menu_items.length; j++) {

                    const visible_in_menu_j = nav_menus[i].menu_items[j].visible_in_menu !== undefined ? nav_menus[i].menu_items[j].visible_in_menu : visible_in_menu_i
                    const auth_state_required_j = nav_menus[i].menu_items[j].auth_state_required !== undefined ? nav_menus[i].menu_items[j].auth_state_required : auth_state_required_i

                    if (!nav_menus[i].menu_items[j].path.includes('#') && nav_menus[i].menu_items[j].element) {
                        nav_list.push({ ...nav_menus[i].menu_items[j], children: undefined })
                        if (auth_state_required_j === null || auth_state_required_j === curr_auth_state) {
                            nav_list_filtered.push({ ...nav_menus[i].menu_items[j], path_alias: undefined, children: undefined })
                            if (nav_menus[i].menu_items[j].path_alias !== undefined) {
                                nav_list_filtered.push({ ...nav_menus[i].menu_items[j], path: nav_menus[i].menu_items[j].path_alias, path_alias: undefined, children: undefined })
                            }
                        }
                    }
                    const nav_menus_filtered_element_menu_item = nav_menus_filtered_element && visible_in_menu_j && (auth_state_required_j === null || auth_state_required_j === curr_auth_state) ? { ...nav_menus[i].menu_items[j], children: [] } : null

                    if (nav_menus[i].menu_items[j] && nav_menus[i].menu_items[j].children) {
                        for (let k = 0; k < nav_menus[i].menu_items[j].children.length; k++) {

                            const visible_in_menu_k = nav_menus[i].menu_items[j].children[k].visible_in_menu !== undefined ? nav_menus[i].menu_items[j].children[k].visible_in_menu : visible_in_menu_j
                            const auth_state_required_k = nav_menus[i].menu_items[j].children[k].auth_state_required !== undefined ? nav_menus[i].menu_items[j].children[k].auth_state_required : auth_state_required_j

                            const nav_menus_filtered_element_menu_item_child = nav_menus_filtered_element_menu_item && visible_in_menu_k && (auth_state_required_k === null || auth_state_required_k === curr_auth_state) ? nav_menus[i].menu_items[j].children[k] : null

                            if (nav_menus_filtered_element_menu_item_child) {
                                nav_menus_filtered_element_menu_item.children.push({ ...nav_menus_filtered_element_menu_item_child, element: undefined })
                            }

                            if (!nav_menus[i].menu_items[j].children[k].path.includes('#') && nav_menus[i].menu_items[j].children[k].element) {
                                nav_list.push(nav_menus[i].menu_items[j].children[k])
                                if (auth_state_required_k === null || auth_state_required_k === curr_auth_state) {
                                    nav_list_filtered.push({ ...nav_menus[i].menu_items[j].children[k], path_alias: undefined })
                                    if (nav_menus[i].menu_items[j].children[k].path_alias !== undefined) {
                                        nav_list_filtered.push({ ...nav_menus[i].menu_items[j].children[k], path: nav_menus[i].menu_items[j].children[k].path_alias, path_alias: undefined })
                                    }
                                }
                            }
                        }
                    }
                    if (nav_menus_filtered_element_menu_item) {
                        nav_menus_filtered_element.menu_items.push(nav_menus_filtered_element_menu_item)
                    }
                }
            }

            if (nav_menus_filtered_element) {
                nav_menus_filtered.push(nav_menus_filtered_element)
            }
        }
    }

    const Wrapper = (props) => {
        return <React.Fragment>
            <TopNavbar
                curr_auth_state={curr_auth_state}
                login={login} logout={logout}
                curr_path={useLocation().pathname}
                top_navbar_menu={nav_menus_filtered.find(menu => menu.slug === 'top_navbar_menu')}
                top_navbar_user_menu={nav_menus_filtered.find(menu => menu.slug === 'top_navbar_user_menu')}
            />
            <props.item.element nav_menus={nav_menus_filtered} title={props.item.title} />
        </React.Fragment>
    }

    const NoMatch = () => !curr_auth_state ? <Navigate to='/offers' /> : <Wrapper item={nav_list.find(rt => rt.path === useLocation().pathname) ? { title: '403', element: (props) => <div>Probably a 403</div> } : { title: '404', element: (props) => <div>Maybe a 404</div> }} />

    return (
        <BrowserRouter basename='/ankelli/public'>
            <Routes>
                {nav_list_filtered.map((item, i) => <Route key={i} path={item.path} element={<Wrapper item={item} />} />)}
                <Route path='*' element={<NoMatch />} />
            </Routes>
        </BrowserRouter>
    );
}

const mapStateToProps = (state) => {
    return {
        temp_auth: state.local_preferences_data.temp_auth,
        auth_user: state.auth_user_data ? new _User(state.auth_user_data, ['active_navigation_screens', 'profile_image']) : null,
    }
}

const mapDispatchToProps = (dispatch) => {
    return {
        login: () => dispatch({ type: 'SYSTEM_STATE_SET_TEMP_AUTH', temp_auth: true }),
        logout: () => dispatch({ type: 'SYSTEM_STATE_SET_TEMP_AUTH', temp_auth: false }),
        connectivityBoot: () => dispatch(connectivityBoot()),
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(Navigator)
