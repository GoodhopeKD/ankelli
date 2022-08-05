import React from 'react'
import { connect } from 'react-redux'
import { useLocation, useNavigate } from "react-router-dom";


function SignInScreen(props) {
    const get_param = useLocation().search
    const redirector = useNavigate()
    const login = () => {
        props.login()
        const rdr = get_param.length > 6 && get_param.includes('?rdr=') ? get_param.split('?rdr=')[1] : '/'
        if (rdr) redirector(rdr)
    }
    return <div className="container">
        <div className="modal py-5 position-static d-block">
            <div className="modal-dialog" role="document">
                <div className="modal-content rounded-4 shadow">
                    <div className="modal-header p-5 pb-4 border-bottom-0">
                        <h2 className="fw-bold mb-0">Sign in</h2>
                    </div>

                    <div className="modal-body p-5 pt-0">
                        <form className="">
                            <div className="form-floating mb-3">
                                <input type='text' className="form-control rounded-3" id="floatingInput" placeholder="Username" />
                                <label htmlFor="floatingInput">Username</label>
                            </div>
                            <div className="form-floating mb-3">
                                <input type="password" className="form-control rounded-3" id="floating_password" placeholder="Password" />
                                <label htmlFor="floating_password">Password</label>
                            </div>
                            <button className="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit" onClick={() => login()}>Sign in</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
}


const mapDispatchToProps = (dispatch) => {
    return {
        login: () => dispatch({ type: 'APP_INSTANCE_STATE_SET_TEMP_AUTH', temp_auth: true }),
    }
}

export default connect(null, mapDispatchToProps)(SignInScreen)