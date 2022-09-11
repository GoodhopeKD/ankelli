import React from "react"
import _ from 'lodash'

import { _Input, _RegToken, _Notification } from 'app/controller'
import SideBar from 'app/views/components/SideBar'
import withRouter from "app/views/navigation/withRouter"

class RegTokensCreateNewScreen extends React.Component {

    default_input = {

    }

    state = {
        btn_create_reg_token_working: false,
        input: _.cloneDeep(this.default_input),
        errors: [],
    }

    handleInputChange(field = 'field.deep_field', value, use_raw = false) {
        const input = this.state.input
        const fields = field.split('.')
        const val = use_raw ? value : new _Input(value)
        if (fields.length === 1) {
            input[fields] = val
        } else {
            input[fields[0]][fields[1]] = val
        }
        this.setState({ input })
    }

    handleSubmit = async () => {
        this.setState({ btn_create_reg_token_working: true })

        const btn_create_reg_token_working = false
        const errors = []
        const input = this.state.input

        if (errors.length === 0) {
            this.setState({ errors }) // Remove input error indicators under text inputs
            const _input = Object.assign(Object.create(Object.getPrototypeOf(input)), input) // Dereference input object
            Object.keys(_input).forEach(key => { if (_input[key] instanceof _Input) _input[key] = _input[key] + "" }) // convert _Input instances to Text

            _RegToken.create(_input).then(() => { _Notification.flash({ message: 'Reg token created', duration: 2000 }); this.props.navigate(-1) })
                .catch((error) => {
                    errors.push(error.message)
                    this.setState({ btn_create_reg_token_working, errors, input: _.cloneDeep(this.default_input) })
                })
        } else {
            this.setState({ btn_create_reg_token_working, errors, input })
        }
    }

    render() {



        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-fluid py-3">
                <div className="row">
                    <div className="col-2">
                        <SideBar nav_menus={[this.props.nav_menus.find(menu => menu.slug === 'admin_menu')]} />
                    </div>
                    <div className="col-10">

                        <div className="card mb-3">
                            <div className="card-header">
                                Create Reg Token
                            </div>
                            <div className="card-body">
                                <form onSubmit={e => { e.preventDefault(); this.handleSubmit() }}>

                                    <div className="mb-3">
                                        {this.state.errors.map((error, key) => (
                                            <div key={key}>• <span style={{ color: 'red' }}>{error}</span></div>
                                        ))}
                                    </div>

                                    <button className="btn btn-info w-100" disabled={this.state.btn_create_reg_token_working} type="submit" >
                                        {this.state.btn_create_reg_token_working ? <div className="spinner-border spinner-border-sm text-light" style={{ width: 20, height: 20 }}></div> : <>Generate</>}
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </this.props.PageWrapper>
    }
}

export default withRouter(RegTokensCreateNewScreen)