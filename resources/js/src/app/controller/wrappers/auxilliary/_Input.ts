import moment from 'moment'

import { mainLaravelDBRestAPICallWrapper } from 'app/controller/actions/rest_api.actions'

/*
	Type Definitions
*/
type local_validation_param_type_t = 'email_address' | 'phone_no' | 'surname' | 'name_s' | 'name' | 'username' | 'password' | 'datetime' | 'number' | 'url' | 'reg_token' | 'verif_token'
type available_param_type_t = 'email_address' | 'username' | 'reg_token'
type usable_param_type_t = 'reg_token'

export const validation_param_lengths = {
	reg_token: {
		min_length: 5,
		max_length: 16,
	},
	verif_token: {
		min_length: 5,
		max_length: 16,
	},
	username: {
		min_length: 4,
		max_length: 64,
	},
	email_address: {
		min_length: 5,
		max_length: 64,
	},
	phone_no: {
		min_length: 10,
		max_length: 24,
	},
	phone_no_number: {
		min_length: 6,
		max_length: 16,
	},
	surname: {
		min_length: 2,
		max_length: 22,
	},
	name_s: {
		min_length: 2,
		max_length: 42,
	},
	name: {
		min_length: 4,
		max_length: 64,
	},
	password: {
		min_length: 8,
		max_length: 32,
	},
	peer_review_comment: {
		min_length: 0,
		max_length: 255,
	},
	message_body: {
		min_length: 0,
		max_length: 1024,
	},
	blockchain_addresses: {
		ETH: 42,
		TRON: 34
	}
}

/* 
	Exported Default Class
*/
export default class _Input {

	public static validation_param_lengths = validation_param_lengths
	private _input: any

	private _is_valid_username: boolean | null = null
	private _is_valid_reg_token: boolean | null = null
	private _is_valid_verif_token: boolean | null = null
	private _is_valid_email_address: boolean | null = null
	private _is_valid_phone_no: boolean | null = null
	private _is_valid_surname: boolean | null = null
	private _is_valid_name_s: boolean | null = null
	private _is_valid_name: boolean | null = null
	private _is_valid_number: boolean | null = null

	private _is_available_reg_token: boolean | null = null
	private _is_available_username: boolean | null = null
	private _is_available_email_address: boolean | null = null

	private _is_usable_reg_token: boolean | null = null

	private _passed_validation: boolean | null = null
	private _failed_validation: boolean | null = null
	private _has_check_error: boolean | null = null

	/* Class Constructor */
	constructor(input: any = null) {
		this._input = input ? input : ''
	}

	static flatten(input: object): object {
		const flat_input = Object.assign(Object.create(Object.getPrototypeOf(input)), input) // Dereference input object
		var key: keyof typeof flat_input
		for (key in flat_input) { if (flat_input.hasOwnProperty(key)) { if (!(window as any).isset(flat_input[key]) || (Array.isArray(flat_input[key]) && !(flat_input[key] as any).length)) delete flat_input[key] } } // filter null and undefined
		Object.keys(flat_input).forEach(key => { if (flat_input[key] instanceof _Input) flat_input[key] = flat_input[key].toRaw() }) // convert _Input instances to text
		return flat_input
	}

	toString(): string {
		return this._input
	}

	toRaw(): any {
		return this._input
	}

	sanitize(): void { }

	isValid(validation_param: local_validation_param_type_t, min_int_val?: number, max_int_val?: number): boolean {

		if (validation_param === 'reg_token') {
			this._is_valid_reg_token =
				this._is_valid_reg_token !== null
					? this._is_valid_reg_token
					: /^[a-zA-Z0-9_À-ÿ\u00f1\u00d1]+$/.test(this._input) && this._input.length >= validation_param_lengths.reg_token.min_length && this._input.length <= validation_param_lengths.reg_token.max_length
			this._failed_validation = !this._is_valid_reg_token
			this._passed_validation = !this._failed_validation
			return this._is_valid_reg_token
		}

		if (validation_param === 'verif_token') {
			this._is_valid_verif_token =
				this._is_valid_verif_token !== null
					? this._is_valid_verif_token
					: /^[a-zA-Z0-9_À-ÿ\u00f1\u00d1]+$/.test(this._input) && this._input.length >= validation_param_lengths.verif_token.min_length && this._input.length <= validation_param_lengths.verif_token.max_length
			this._failed_validation = !this._is_valid_verif_token
			this._passed_validation = !this._failed_validation
			return this._is_valid_verif_token
		}

		if (validation_param === 'username') {
			this._is_valid_username =
				this._is_valid_username !== null
					? this._is_valid_username
					: /^[a-zA-Z0-9_À-ÿ\u00f1\u00d1]+$/.test(this._input) && this._input.length >= validation_param_lengths.username.min_length && this._input.length <= validation_param_lengths.username.max_length
			this._failed_validation = !this._is_valid_username
			this._passed_validation = !this._failed_validation
			return this._is_valid_username
		}

		if (validation_param === 'email_address') {
			this._is_valid_email_address =
				this._is_valid_email_address !== null
					? this._is_valid_email_address
					: /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/i.test(
						this._input
					) && this._input.length >= validation_param_lengths.email_address.min_length && this._input.length <= validation_param_lengths.email_address.max_length
			this._failed_validation = !this._is_valid_email_address
			this._passed_validation = !this._failed_validation
			return this._is_valid_email_address
		}

		if (validation_param === 'phone_no') {
			this._is_valid_phone_no =
				this._is_valid_phone_no !== null
					? this._is_valid_phone_no
					: /\+[0-9-\ .()]+$/i.test(
						this._input
					) && this._input.length >= validation_param_lengths.phone_no.min_length && this._input.length <= validation_param_lengths.phone_no.max_length
			this._failed_validation = !this._is_valid_phone_no
			this._passed_validation = !this._failed_validation
			return this._is_valid_phone_no
		}

		if (validation_param === 'surname') {
			this._is_valid_surname =
				/^[a-zA-Z0-9 -_()À-ÿ\u00f1\u00d1]+$/.test(this._input) &&
				(this._input.length >= validation_param_lengths.surname.min_length && this._input.length <= validation_param_lengths.surname.max_length)
			this._failed_validation = !this._is_valid_surname
			this._passed_validation = !this._failed_validation
			return this._is_valid_surname
		}

		if (validation_param === 'name_s') {
			this._is_valid_name_s =
				/^[a-zA-Z0-9 -_()À-ÿ\u00f1\u00d1]+$/.test(this._input) &&
				(this._input.length >= validation_param_lengths.name_s.min_length && this._input.length <= validation_param_lengths.name_s.max_length)
			this._failed_validation = !this._is_valid_name_s
			this._passed_validation = !this._failed_validation
			return this._is_valid_name_s
		}

		if (validation_param === 'name') {
			this._is_valid_name =
				/^[a-zA-Z0-9 -_()À-ÿ\u00f1\u00d1]+$/.test(this._input) &&
				(this._input.length >= validation_param_lengths.name.min_length && this._input.length <= validation_param_lengths.name.max_length)
			this._failed_validation = !this._is_valid_name
			this._passed_validation = !this._failed_validation
			return this._is_valid_name
		}

		if (validation_param === 'password') {
			let contains_uppercase = /[A-Z]/.test(this._input) // Contains at least 1 uppercase letter
			let contains_lowercase = /[a-z]/.test(this._input) // Contains at least 1 lowercase letter
			let contains_number = /[0-9]/.test(this._input) // Contains at least 1 number
			let is_between_bounds = this._input.length >= validation_param_lengths.password.min_length && this._input.length <= validation_param_lengths.password.max_length
			let is_valid_passsword =
				is_between_bounds &&
				contains_uppercase &&
				contains_lowercase &&
				contains_number &&
				/^[a-zA-Z0-9À-ÿ\u00f1\u00d1 !"#$%&'()*+,-./:;<=>?@[\]^_`{|}~]+$/.test(this._input)
			this._failed_validation = !is_valid_passsword
			this._passed_validation = !this._failed_validation
			return is_valid_passsword
		}

		if (validation_param === 'datetime') {
			let is_valid_datetime = moment(this._input).isValid()
			this._failed_validation = !is_valid_datetime
			this._passed_validation = !this._failed_validation
			return is_valid_datetime
		}

		if (validation_param === 'number') {
			this._is_valid_number = !isNaN(this._input) && !isNaN(parseFloat(this._input)) && (!min_int_val || this._input >= min_int_val) && (!max_int_val || this._input <= max_int_val)
			this._failed_validation = !this._is_valid_number
			this._passed_validation = !this._failed_validation
			return this._is_valid_number
		}

		return false
	}

	async async_checkIfAvailable(resource_name: available_param_type_t) {
		return await mainLaravelDBRestAPICallWrapper
			.dispatch({
				type: 'APP_BACKEND_API_CALL',
				method: 'GET',
				endpoint: 'content/param_checks/availability/{param_name}/{param_value}',
				data: { param_name: resource_name, param_value: this._input }
			})
			.then((resp: any) => {
				if (resource_name === 'reg_token') this._is_available_reg_token = resp.available === true
				if (resource_name === 'username') this._is_available_username = resp.available === true
				if (resource_name === 'email_address') this._is_available_email_address = resp.available === true
				this._failed_validation = resp.available !== true
				this._passed_validation = !this._failed_validation
				return Promise.resolve(resp)
			})
			.catch((e: any) => {
				this._has_check_error = true
				return Promise.reject(e)
			})
	}

	isAvailable(resource_name: available_param_type_t): boolean {
		if (resource_name === 'reg_token') return this._is_available_reg_token !== null ? this._is_available_reg_token : false
		if (resource_name === 'username') return this._is_available_username !== null ? this._is_available_username : false
		if (resource_name === 'email_address') return this._is_available_email_address !== null ? this._is_available_email_address : false
		return false
	}

	async async_checkIfUsable(resource_name: usable_param_type_t) {
		return await mainLaravelDBRestAPICallWrapper
			.dispatch({
				type: 'APP_BACKEND_API_CALL',
				method: 'GET',
				endpoint: 'param_checks/usability/{param_name}/{param_value}',
				data: { param_name: resource_name, param_value: this._input }
			})
			.then((resp: any) => {
				if (resource_name === 'reg_token') this._is_usable_reg_token = resp.usable === true
				this._failed_validation = resp.usable !== true
				this._passed_validation = !this._failed_validation
				return Promise.resolve(resp)
			})
			.catch((e: any) => {
				this._has_check_error = true
				return Promise.reject(e)
			})
	}

	isUsable(resource_name: usable_param_type_t): boolean {
		if (resource_name === 'reg_token') return this._is_usable_reg_token !== null ? this._is_usable_reg_token : false
		return false
	}

	isSafeText(min_length: number = 2, max_length: number = 255): boolean {
		//const blacklist = ["https://", 'http://', 'www.']
		let is_safe_text = this._input.length >= min_length && this._input.length <= max_length && /^[a-zA-Z0-9À-ÿ\u00f1\u00d1 !"'‘’`#$%&()*+,-./:;=?@[\]^_{|}~\r\n\u2700-\u27bf\ud83c\udde6-\uddff\ud800-\udbff\udc00-\udfff\u0023-\u0039\ufe0f?\u20e3\u3299\u3297\u303d\u3030\u24c2\ud83c\udd70-\udd71\ud83c\udd7e-\udd7f\ud83c\udd8e\ud83c\udd91-\udd9a\ud83c\udde6-\uddff\ud83c\ude01-\ude02\ud83c\ude1a\ud83c\ude2f\ud83c\ude32-\ude3a\ud83c\ude50-\ude51\u203c\u2049\u25aa-\u25ab\u25b6\u25c0\u25fb-\u25fe\u00a9\u00ae\u2122\u2139\ud83c\udc04\u2600-\u26FF\u2b05\u2b06\u2b07\u2b1b\u2b1c\u2b50\u2b55\u231a\u231b\u2328\u23cf\u23e9-\u23f3\u23f8-\u23fa\ud83c\udccf\u2934\u2935\u2190-\u21ff]+$/.test(this._input)
		this._failed_validation = !is_safe_text
		this._passed_validation = !this._failed_validation
		return is_safe_text
	}

	mysql_real_escape_string(str: string): string {
		if (typeof str !== 'string')
			return str

		return str.replace(/[\0\x08\x09\x1a\n\r"'\\\%]/g, (char: string) => {
			switch (char) {
				case "\0":
					return "\\0"
				case "\x08":
					return "\\b"
				case "\x09":
					return "\\t"
				case "\x1a":
					return "\\z"
				case "\n":
					return "\\n"
				case "\r":
					return "\\r"
				case "\"":
				case "'":
				case "\\":
				case "%":
					return "\\" + char // prepends a backslash to backslash, percent,
				// and double/single quotes
			}
			return char
		})
	}

	matches(test_input: any): boolean {
		let result = test_input === this._input
		this._failed_validation = !result
		this._passed_validation = !this._failed_validation
		return result
	}

	hasCheckError(): boolean {
		return this._has_check_error as boolean
	}

	failedValidation(): boolean {
		return this._has_check_error ? true : this._failed_validation as boolean
	}

	passedValidation(): boolean {
		return this._has_check_error ? false : this._passed_validation as boolean
	}

	clearValidation(): void {
		this._has_check_error = null
		this._failed_validation = null
		this._passed_validation = null
	}

	static generate_reg_token(): string {
		return ''
	}

	static debug_form_autofill(debug: boolean, input: any) {
		return debug && input ? input : ''
	}
}
