import React, { useEffect } from 'react'
import { connect } from 'react-redux'
import { BrowserRouter, Routes, Route, useLocation, Navigate } from 'react-router-dom';

import { connectivityBoot, _User, store } from 'app/controller'

import SplashScreen from 'app/views/screens/Splash.screen'
import ConnectionFailedScreen from 'app/views/screens/ConnectionFailed.screen'
import TopNavbar from 'app/views/components/TopNavbar'
import Footer from 'app/views/components/Footer'

// stack not in menues
import { virtual_menu } from 'app/views/navigation/virtual_menu'
// top_navbar
import { top_navbar_menu } from 'app/views/navigation/top_navbar_menu'
import { top_navbar_user_menu } from 'app/views/navigation/top_navbar_user_menu'
// sidebar
import { account_menu } from 'app/views/navigation/account_menu'
import { account_settings_menu } from 'app/views/navigation/account_settings_menu'
import { admin_menu } from 'app/views/navigation/admin_menu'
// footer
import { footer_menu } from 'app/views/navigation/footer_menu'

const nav_menus = [
    // top_navbar
    top_navbar_menu,
    top_navbar_user_menu,
    // sidebar
    account_menu,
    account_settings_menu,
    admin_menu,
    // virtual stack
    virtual_menu,
    // footer
    footer_menu,
]

let tried = false

function Navigator(props) {

    if (!tried) {
        //return <SplashScreen />;
    }

    if (!tried) {
        if (window.sysconfig_params_data) {
            store.dispatch({ type: 'SYSCONFIG_PARAMS_DATA_UPDATE', sysconfig_params_data: window.sysconfig_params_data })
        }
        if (window.datalists_data) {
            store.dispatch({ type: 'DATALISTS_DATA_UPDATE', datalists_data: window.datalists_data })
        }
        tried = true
        props.connectivityBoot()
    }

    if (props.app_backend_api_connectivity_indicator === null || !props.sysconfig_params) {
        return <SplashScreen />;
    }

    const auth_user = props.auth_user

    const curr_auth_state = auth_user ? true : false;

    const nav_list = []    // flattened, slugs added // for 404 and 403 messages
    const nav_list_filtered = []    // flattened, auth_state, auth_user: permissions & groups filtered // for router
    const nav_menus_filtered = []    // auth filtered, virtual routes filtered // for drawer

    if (nav_menus && nav_menus.length) {
        for (let i = 0; i < nav_menus.length; i++) {

            const disabled_i = nav_menus[i].disabled !== undefined ? nav_menus[i].disabled : null
            const show_in_menu_i = nav_menus[i].show_in_menu !== undefined ? nav_menus[i].show_in_menu : false
            const show_when_auth_state_is_i = nav_menus[i].show_when_auth_state_is !== undefined ? nav_menus[i].show_when_auth_state_is : null
            let required_params_passed_i = true
            if (nav_menus[i].required_sysconfig_params_data) {
                required_params_passed_i = false
                Object.keys(nav_menus[i].required_sysconfig_params_data).forEach(param_key => {
                    if (nav_menus[i].required_sysconfig_params_data[param_key] == props.sysconfig_params[param_key]) {
                        required_params_passed_i = true
                    }
                });
            }

            const nav_menus_filtered_element = show_in_menu_i && !disabled_i && required_params_passed_i ? { ...nav_menus[i], menu_items: [] } : null

            if (nav_menus[i] && nav_menus[i].menu_items) {
                for (let j = 0; j < nav_menus[i].menu_items.length; j++) {

                    const disabled_j = nav_menus[i].menu_items[j].disabled !== undefined ? nav_menus[i].menu_items[j].disabled : disabled_i
                    const show_in_menu_j = nav_menus[i].menu_items[j].show_in_menu !== undefined ? nav_menus[i].menu_items[j].show_in_menu : show_in_menu_i
                    const show_when_auth_state_is_j = nav_menus[i].menu_items[j].show_when_auth_state_is !== undefined ? nav_menus[i].menu_items[j].show_when_auth_state_is : show_when_auth_state_is_i
                    let required_params_passed_j = true
                    if (nav_menus[i].menu_items[j].required_sysconfig_params_data) {
                        required_params_passed_j = false
                        Object.keys(nav_menus[i].menu_items[j].required_sysconfig_params_data).forEach(param_key => {
                            if (nav_menus[i].menu_items[j].required_sysconfig_params_data[param_key] == props.sysconfig_params[param_key]) {
                                required_params_passed_j = true
                            }
                        });
                    }

                    if (!nav_menus[i].menu_items[j].path.includes('#') && nav_menus[i].menu_items[j].element) {
                        nav_list.push({ ...nav_menus[i].menu_items[j], children: undefined })
                        if (!disabled_j && required_params_passed_j && (show_when_auth_state_is_j === null || show_when_auth_state_is_j === curr_auth_state)) {
                            nav_list_filtered.push({ ...nav_menus[i].menu_items[j], path_alias: undefined, children: undefined })
                            if (nav_menus[i].menu_items[j].path_alias !== undefined) {
                                nav_list_filtered.push({ ...nav_menus[i].menu_items[j], path: nav_menus[i].menu_items[j].path_alias, path_alias: undefined, children: undefined })
                            }
                        }
                    }
                    const nav_menus_filtered_element_menu_item = nav_menus_filtered_element && show_in_menu_j && !disabled_j && required_params_passed_j && (show_when_auth_state_is_j === null || show_when_auth_state_is_j === curr_auth_state) ? { ...nav_menus[i].menu_items[j], children: [] } : null

                    if (nav_menus[i].menu_items[j] && nav_menus[i].menu_items[j].children) {
                        for (let k = 0; k < nav_menus[i].menu_items[j].children.length; k++) {

                            const disabled_k = nav_menus[i].menu_items[j].children[k].disabled !== undefined ? nav_menus[i].menu_items[j].children[k].disabled : disabled_j
                            const show_in_menu_k = nav_menus[i].menu_items[j].children[k].show_in_menu !== undefined ? nav_menus[i].menu_items[j].children[k].show_in_menu : show_in_menu_j
                            const show_when_auth_state_is_k = nav_menus[i].menu_items[j].children[k].show_when_auth_state_is !== undefined ? nav_menus[i].menu_items[j].children[k].show_when_auth_state_is : show_when_auth_state_is_j
                            let required_params_passed_k = true
                            if (nav_menus[i].menu_items[j].children[k].required_sysconfig_params_data) {
                                required_params_passed_k = false
                                Object.keys(nav_menus[i].menu_items[j].children[k].required_sysconfig_params_data).forEach(param_key => {
                                    if (nav_menus[i].menu_items[j].children[k].required_sysconfig_params_data[param_key] == props.sysconfig_params[param_key]) {
                                        required_params_passed_k = true
                                    }
                                });
                            }

                            const nav_menus_filtered_element_menu_item_child = nav_menus_filtered_element_menu_item && show_in_menu_k && !disabled_k && required_params_passed_k && (show_when_auth_state_is_k === null || show_when_auth_state_is_k === curr_auth_state) ? nav_menus[i].menu_items[j].children[k] : null

                            if (nav_menus_filtered_element_menu_item_child) {
                                nav_menus_filtered_element_menu_item.children.push({ ...nav_menus_filtered_element_menu_item_child, element: undefined })
                            }

                            if (!nav_menus[i].menu_items[j].children[k].path.includes('#') && nav_menus[i].menu_items[j].children[k].element) {
                                nav_list.push(nav_menus[i].menu_items[j].children[k])
                                if (!disabled_k && required_params_passed_k && (show_when_auth_state_is_k === null || show_when_auth_state_is_k === curr_auth_state)) {
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

    const PageWrapper = (props) => {

        useEffect(() => {
            document.title = (props.path == '/') ? 'Ankelli - Home' : props.title + " - Ankelli";
        }, [props.title]);

        return <React.Fragment>
            <TopNavbar
                curr_auth_state={curr_auth_state}
                auth_user={auth_user}
                curr_path={useLocation().pathname}
                top_navbar_menu={nav_menus_filtered.find(menu => menu.slug === 'top_navbar_menu')}
                top_navbar_auth_menu={nav_menus_filtered.find(menu => menu.slug === 'virtual_menu')}
                top_navbar_user_menu={nav_menus_filtered.find(menu => menu.slug === 'top_navbar_user_menu')}
            />
            <div className="bg-white shadow" style={{ borderBottomColor: 'black', borderBottomWidth: 1 }}>
                <div className="b-example-divider" style={{ height: 105 }}></div>
                {props.children}
            </div>
            {/*<div style={{ minHeight: 379, zIndex: -2 }} />*/}
            <Footer footer_menu={nav_menus_filtered.find(menu => menu.slug === 'footer_menu')} />
        </React.Fragment>
    }

    const NoMatch = () => {
        const curr_path = useLocation().pathname
        const curr_path_exists = nav_list.some(rt => rt.path === curr_path)
        if (['/signin', '/signup'].includes(curr_path)) {
            const get_param = useLocation().search;
            return <Navigate to={get_param.length > 6 && get_param.includes('?rdr=') ? get_param.split('?rdr=')[1] : '/'} />
        }
        if (curr_path_exists && !curr_auth_state) {
            return <Navigate to={'/signin?rdr=' + curr_path} />
        }
        const item = nav_list.find(rt => rt.path === (curr_path_exists ? '/403' : '/404'))
        return <item.element PageWrapper={PageWrapper} title={item.title} path={item.path} />
    }

    return (
        <BrowserRouter basename={'/'}>
            <Routes>
                {nav_list_filtered.map((item, i) => <Route key={i} path={item.path} element={<item.element PageWrapper={PageWrapper} nav_menus={nav_menus_filtered} title={item.title} path={item.path} />} />)}
                <Route path='*' element={<NoMatch />} />
            </Routes>
        </BrowserRouter>
    );
}

const mapStateToProps = (state) => {
    return {
        sysconfig_params: state.sysconfig_params_data,
        app_backend_api_connectivity_indicator: state.app_instance_state_data.app_backend_api_connectivity_indicator,
        firebase_api_connectivity_indicator: state.app_instance_state_data.firebase_api_connectivity_indicator,
        auth_user: state.auth_user_data ? new _User(state.auth_user_data, ['active_user_group_memberships', 'active_permission_instances']) : null,
    }
}

const mapDispatchToProps = (dispatch) => {
    return {
        connectivityBoot: () => dispatch(connectivityBoot()),
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(Navigator)
