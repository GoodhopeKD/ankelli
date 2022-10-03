import React, { useEffect } from 'react'
import { connect } from 'react-redux'
import { BrowserRouter, Routes, Route, useLocation, Navigate } from 'react-router-dom';

import { connectivityBoot, _User, store } from 'app/controller'

import SplashScreen from 'app/views/screens/Splash.screen'
import ConnectionFailedScreen from 'app/views/screens/ConnectionFailed.screen'
import TopNavbar from 'app/views/components/TopNavbar'
import Footer from 'app/views/components/Footer'

import SignInModal from 'app/views/components/SignIn.modal'
import SignUpModal from 'app/views/components/SignUp.modal'
import GeneratePasswordResetTokenModal from 'app/views/components/GeneratePasswordResetToken.modal'
import ResetLostPasswordModal from 'app/views/components/ResetLostPassword.modal'
import RecoverLostUsernameModal from 'app/views/components/RecoverLostUsername.modal'

// stack not in menues
import { _virtual_menu } from 'app/views/navigation/_virtual_menu'
// top_navbar
import { _top_navbar_menu } from 'app/views/navigation/_top_navbar_menu'
import { _top_navbar_user_menu } from 'app/views/navigation/_top_navbar_user_menu'
// sidebar
import { pay_menu } from 'app/views/navigation/pay_menu'
import { banking_menu } from 'app/views/navigation/banking_menu'
import { accounts_menu } from 'app/views/navigation/accounts_menu'
import { admin_menu } from 'app/views/navigation/admin_menu'
// footer
import { _footer_menu } from 'app/views/navigation/_footer_menu'
import { support_menu } from 'app/views/navigation/support_menu'

const nav_menus_raw = [
    // top_navbar
    _top_navbar_menu,
    _top_navbar_user_menu,
    // sidebar
    pay_menu,
    banking_menu,
    accounts_menu,
    admin_menu,
    // virtual stack
    _virtual_menu,
    // footer
    _footer_menu,
    support_menu,
]

let tried = false

function ScrollToTop() {
    const { pathname } = useLocation();
    useEffect(() => { window.scrollTo(0, 0); }, [pathname]);
    return null;
}

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
        props.connectivityBoot()
        tried = true
    }

    if (props.app_backend_api_connectivity_indicator === null || !props.sysconfig_params) {
        return <SplashScreen />;
    }

    const auth_user = props.auth_user

    const curr_auth_state = auth_user ? true : false;

    const nav_menus = _.cloneDeep(nav_menus_raw)
    const nav_path_list = []    // flattened // for 404 and 403 messages // for laravel router
    const nav_list_filtered = []    // flattened, auth_state, auth_user: permissions & groups filtered // for router
    const nav_menus_filtered = []    // auth filtered, virtual routes filtered // for drawer

    if (nav_menus && nav_menus.length) {
        for (let i = 0; i < nav_menus.length; i++) {

            const disabled_i = window.isset(nav_menus[i].disabled) ? nav_menus[i].disabled : null
            const subdomain_i = window.isset(nav_menus[i].subdomain) ? nav_menus[i].subdomain : null
            const show_in_menu_i = window.isset(nav_menus[i].show_in_menu) ? nav_menus[i].show_in_menu : false
            const show_when_auth_state_is_i = window.isset(nav_menus[i].show_when_auth_state_is) ? nav_menus[i].show_when_auth_state_is : null
            const required_active_user_group_membership_slugs_i = nav_menus[i].required_active_user_group_membership_slugs
            let required_params_passed_i = (!auth_user || auth_user.isInUserGroup('developers') || !(auth_user.isInUserGroup('default_users') && nav_menus[i].restricted_for_default_users))
            if (required_params_passed_i && required_active_user_group_membership_slugs_i) {
                required_params_passed_i = false
                required_active_user_group_membership_slugs_i.forEach(user_group_membership_slug => {
                    if (auth_user && (auth_user.isInUserGroup(user_group_membership_slug) || auth_user.isInUserGroup('developers'))) {
                        required_params_passed_i = true
                    }
                });
            }

            const nav_menus_filtered_element = show_in_menu_i && !disabled_i && required_params_passed_i ? { ...nav_menus[i], menu_items: [] } : null

            if (nav_menus[i] && nav_menus[i].menu_items) {
                for (let j = 0; j < nav_menus[i].menu_items.length; j++) {

                    const nav_item_j = nav_menus[i].menu_items[j]
                    const disabled_j = window.isset(nav_item_j.disabled) ? nav_item_j.disabled : disabled_i
                    const show_in_menu_j = window.isset(nav_item_j.show_in_menu) ? nav_item_j.show_in_menu : show_in_menu_i
                    const show_when_auth_state_is_j = window.isset(nav_item_j.show_when_auth_state_is) ? nav_item_j.show_when_auth_state_is : show_when_auth_state_is_i
                    const required_active_user_group_membership_slugs_j = nav_item_j.required_active_user_group_membership_slugs ?? nav_menus[i].required_active_user_group_membership_slugs
                    let required_params_passed_j = (!auth_user || auth_user.isInUserGroup('developers') || !(auth_user.isInUserGroup('default_users') && nav_item_j.restricted_for_default_users))
                    if (required_params_passed_j && required_active_user_group_membership_slugs_j) {
                        required_params_passed_j = false
                        required_active_user_group_membership_slugs_j.forEach(user_group_membership_slug => {
                            if (auth_user && (auth_user.isInUserGroup(user_group_membership_slug) || auth_user.isInUserGroup('developers'))) {
                                required_params_passed_j = true
                            }
                        });
                    }

                    const subdomain = nav_item_j.subdomain ?? subdomain_i
                    nav_item_j.path = ('/' + (subdomain !== 'default' ? subdomain + '/' : '') + nav_item_j.path.replace(/^\/|\/$/g, ''))
                    if (window.isset(nav_item_j.path_alias)) {
                        nav_item_j.path_alias = ('/' + (subdomain !== 'default' ? subdomain + '/' : '') + nav_item_j.path_alias.replace(/^\/|\/$/g, ''))
                    }

                    if (!nav_item_j.path.includes('#') && nav_item_j.element) {
                        nav_path_list.push(nav_item_j.path)
                        if (window.isset(nav_item_j.path_alias)) {
                            nav_path_list.push(nav_item_j.path_alias)
                        }
                        if (!disabled_j && required_params_passed_j && (show_when_auth_state_is_j === null || show_when_auth_state_is_j === curr_auth_state)) {
                            nav_list_filtered.push({ ...nav_item_j, path_alias: undefined, children: undefined })
                            if (window.isset(nav_item_j.path_alias)) {
                                nav_list_filtered.push({ ...nav_item_j, path: nav_item_j.path_alias, path_alias: undefined, children: undefined })
                            }
                        }
                    }
                    const nav_menus_filtered_element_menu_item = nav_menus_filtered_element && show_in_menu_j && !disabled_j && required_params_passed_j && (show_when_auth_state_is_j === null || show_when_auth_state_is_j === curr_auth_state) ? { ...nav_item_j, children: [] } : null

                    if (nav_item_j && nav_item_j.children) {
                        for (let k = 0; k < nav_item_j.children.length; k++) {

                            const nav_item_j_child_k = nav_item_j.children[k]
                            const disabled_k = window.isset(nav_item_j_child_k.disabled) ? nav_item_j_child_k.disabled : disabled_j
                            const show_in_menu_k = window.isset(nav_item_j_child_k.show_in_menu) ? nav_item_j_child_k.show_in_menu : show_in_menu_j
                            const show_when_auth_state_is_k = window.isset(nav_item_j_child_k.show_when_auth_state_is) ? nav_item_j_child_k.show_when_auth_state_is : show_when_auth_state_is_j
                            const required_active_user_group_membership_slugs_k = nav_item_j_child_k.required_active_user_group_membership_slugs ?? nav_item_j.required_active_user_group_membership_slugs
                            let required_params_passed_k = (!auth_user || auth_user.isInUserGroup('developers') || !(auth_user.isInUserGroup('default_users') && nav_item_j_child_k.restricted_for_default_users))
                            if (required_params_passed_k && required_active_user_group_membership_slugs_k) {
                                required_params_passed_k = false
                                required_active_user_group_membership_slugs_k.forEach(user_group_membership_slug => {
                                    if (auth_user && (auth_user.isInUserGroup(user_group_membership_slug) || auth_user.isInUserGroup('developers'))) {
                                        required_params_passed_k = true
                                    }
                                });
                            }

                            const subdomain = nav_item_j_child_k.subdomain ?? subdomain_i
                            nav_item_j_child_k.path = ('/' + (subdomain !== 'default' ? subdomain + '/' : '') + nav_item_j_child_k.path.replace(/^\/|\/$/g, ''))
                            if (window.isset(nav_item_j_child_k.path_alias)) {
                                nav_item_j_child_k.path_alias = ('/' + (subdomain !== 'default' ? subdomain + '/' : '') + nav_item_j_child_k.path_alias.replace(/^\/|\/$/g, ''))
                            }

                            const nav_menus_filtered_element_menu_item_child = nav_menus_filtered_element_menu_item && show_in_menu_k && !disabled_k && required_params_passed_k && (show_when_auth_state_is_k === null || show_when_auth_state_is_k === curr_auth_state) ? nav_item_j_child_k : null

                            if (nav_menus_filtered_element_menu_item_child) {
                                nav_menus_filtered_element_menu_item.children.push({ ...nav_menus_filtered_element_menu_item_child, element: undefined })
                            }

                            if (!nav_item_j_child_k.path.includes('#') && nav_item_j_child_k.element) {
                                nav_path_list.push(nav_item_j_child_k.path)
                                if (window.isset(nav_item_j_child_k.path_alias)) {
                                    nav_path_list.push(nav_item_j_child_k.path_alias)
                                }
                                if (!disabled_k && required_params_passed_k && (show_when_auth_state_is_k === null || show_when_auth_state_is_k === curr_auth_state)) {
                                    nav_list_filtered.push({ ...nav_item_j_child_k, path_alias: undefined })
                                    if (window.isset(nav_item_j_child_k.path_alias)) {
                                        nav_list_filtered.push({ ...nav_item_j_child_k, path: nav_item_j_child_k.path_alias, path_alias: undefined })
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

    const regenerate_nav_path_list_laravel = false
    if (regenerate_nav_path_list_laravel) {
        const nav_path_list_laravel = []
        nav_path_list.forEach(path => {
            if (path.includes(':')) {
                const path_segments = path.split('/').filter(path_segment => path_segment.length)
                path = ''
                path_segments.forEach(path_segment => {
                    path = path + '/'
                    if (path_segment.includes(':')) {
                        path = path + '{' + path_segment.replace(/:/g, '') + '}'
                    } else {
                        path = path + path_segment
                    }
                });
            }
            if (!['/404', '/403'].includes(path))
                nav_path_list_laravel.push(path)
        });

        const TextFile = () => {
            const element = document.createElement("a");
            const textFile = new Blob([JSON.stringify(nav_path_list_laravel, null, 2)], { type: 'text/json' }); //pass data from localStorage API to blob
            element.href = URL.createObjectURL(textFile);
            element.download = "nav_path_list_laravel.json";
            document.body.appendChild(element);
            element.click();
        }

        TextFile()
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
                _top_navbar_menu={nav_menus_filtered.find(menu => menu.slug === '_top_navbar_menu')}
                _top_navbar_user_menu={nav_menus_filtered.find(menu => menu.slug === '_top_navbar_user_menu')}
            />
            <div className="bg-white shadow" style={{ borderBottomColor: 'black', borderBottomWidth: 1 }}>
                <div className="b-example-divider" style={{ height: 105 }}></div>
                {props.children}
            </div>
            {/*<div style={{ minHeight: 379, zIndex: -2 }} />*/}
            <Footer _footer_menu={nav_menus_filtered.find(menu => menu.slug === '_footer_menu')} />
            {!curr_auth_state && <>
                <div className="modal fade" id="signin_modal" tabIndex="-1" >
                    <SignInModal />
                </div>
                <div className="modal fade" id="signup_modal" tabIndex="-1" >
                    <SignUpModal />
                </div>
                <div className="modal fade" id="generate_password_reset_token_modal" tabIndex="-1" >
                    <GeneratePasswordResetTokenModal />
                </div>
                <div className="modal fade" id="reset_lost_password_modal" tabIndex="-1" >
                    <ResetLostPasswordModal />
                </div>
                <div className="modal fade" id="get_lost_username_modal" tabIndex="-1" >
                    <RecoverLostUsernameModal />
                </div>
            </>}
        </React.Fragment>
    }


    const NoMatch = () => {
        const curr_path = useLocation().pathname
        const curr_path_exists = nav_path_list.includes(curr_path)
        if (['/accounts/auth/signin', '/accounts/auth/signup'].includes(curr_path)) {
            const get_param = useLocation().search;
            return <Navigate to={get_param.length > 6 && get_param.includes('?rdr=') ? get_param.split('?rdr=')[1] : '/'} />
        }
        if (curr_path_exists && !curr_auth_state) {
            return <Navigate to={'/accounts/auth/signin?rdr=' + curr_path} />
        }
        const item = nav_list_filtered.find(rt => rt.path === (curr_path_exists ? '/403' : '/404'))
        return <item.element PageWrapper={PageWrapper} title={item.title} path={item.path} />
    }

    return (
        <BrowserRouter basename={''}>
            <ScrollToTop />
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
        auth_user: state.auth_user_data ? new _User(state.auth_user_data, ['active_user_group_membership_slugs', 'active_permission_instances']) : null,
    }
}

const mapDispatchToProps = (dispatch) => {
    return {
        connectivityBoot: () => dispatch(connectivityBoot()),
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(Navigator)
