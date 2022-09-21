import React from 'react'

export default class CustomSelect extends React.Component {

    default_props = {
        options: [],
        max_shown_options_count: 3,
        selected_option_value: undefined,
        none_option_value: undefined,
        none_option_output_element: () => <>None</>,
        has_none_option: true,
        disabled: false
    }

    state = {
        search_query_string: '',
    }

    onChange = (value) => {
        this.props.onChange(value)
        if (this.state.search_query_string.length) this.setState({ search_query_string: '' })
    }

    render() {

        const max_shown_options_count = this.state.max_shown_options_count ?? (this.props.max_shown_options_count ?? this.default_props.max_shown_options_count)
        const has_none_option = this.props.has_none_option ?? this.default_props.has_none_option
        const options = this.props.options ?? this.default_props.options
        const element_id = this.props.element_id ?? this.element_id
        const disabled = this.props.disabled ?? this.default_props.disabled

        const shown_element = [...options, {
            value: this.props.none_option_value ?? this.default_props.none_option_value,
            searchable_text: '',
            output_element: this.props.none_option_output_element ?? this.default_props.none_option_output_element,
        }].find(option => option.value == this.props.selected_option_value)

        return <>
            <div className="dropdown">
                <a disabled={disabled} href="#" style={{ backgroundColor: disabled ? "#e9ecef" : null }} className="d-flex link-dark text-decoration-none form-select gap-2" data-bs-toggle="dropdown" aria-expanded="true">
                    <shown_element.output_element />
                </a>
                <div className="dropdown-menu pt-0 w-100" data-popper-placement="bottom-start">
                    <div className="p-2 mb-2 bg-light border-bottom rounded-top">
                        <input
                            disabled={disabled}
                            type="search"
                            id={'input_search_query_string_' + element_id}
                            className="form-control"
                            autoComplete="false"
                            value={this.state.search_query_string}
                            onChange={() => this.setState({ search_query_string: document.getElementById('input_search_query_string_' + element_id).value })}
                            placeholder="Type to filter..."
                        />
                    </div>
                    <ul className="list-unstyled mb-0">
                        {options.filter(option => option.searchable_text.toLowerCase().includes(this.state.search_query_string.toLowerCase())).slice(0, max_shown_options_count).map((option, index) =>
                            <li key={index} >
                                <a className="dropdown-item d-flex align-items-center gap-2 py-2" href="#"
                                    onClick={e => {
                                        e.preventDefault()
                                        if (option.value != shown_element.value)
                                            this.onChange(option.value)
                                    }}
                                >
                                    <option.output_element />
                                </a>
                            </li>
                        )}
                        {has_none_option && <>
                            <li>
                                <a className="dropdown-item d-flex align-items-center gap-2 py-2 list-group-item-warning" href="#"
                                    onClick={e => {
                                        e.preventDefault()
                                        if (this.props.none_option_value != shown_element.value)
                                            this.onChange(this.props.none_option_value ?? this.default_props.none_option_value)
                                    }}
                                >
                                    {this.props.none_option_output_element ? <this.props.none_option_output_element /> : <this.default_props.none_option_output_element />}
                                </a>
                            </li>
                        </>}
                        {max_shown_options_count < options.length && <>
                            <li><hr className="dropdown-divider" /></li>
                            <li className="px-2">
                                <a className="btn btn-outline-secondary w-100" href="#"
                                    onClick={e => {
                                        e.preventDefault()
                                        this.setState({ max_shown_options_count: options.length, search_query_string: '' })
                                    }}
                                >
                                    Show All
                                </a>
                            </li>
                        </>}
                    </ul>
                </div>
            </div>
        </>
    }
}