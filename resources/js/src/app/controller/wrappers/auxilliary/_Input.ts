import moment from 'moment'

import { mainLaravelDBRestAPICallWrapper } from 'app/controller/actions/rest_api.actions'

/*
	Type Definitions
*/
type local_validation_param_type = 'email_address' | 'surname' | 'name_s' | 'name' | 'username' | 'password' | 'datetime' | 'number' | 'url' | 'passport_number' | 'reg_token'
type remote_validation_param_type = 'reg_token'
type unique_param_type = 'email_address' | 'username'

export const validation_param_lengths = {
	email_address: {
		min_length: 2,
		max_length: 64,
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
	username: {
		min_length: 4,
		max_length: 64,
	},
	password: {
		min_length: 8,
		max_length: 32,
	},
	passport_number: {
		min_length: 8,
		max_length: 8,
	},
	reg_token: {
		min_length: 4,
		max_length: 20,
	},
	item_name: {
		min_length: 4,
		max_length: 64,
	},
	item_description: {
		min_length: 0,
		max_length: 128,
	}
}

/* 
	Exported Default Class
*/
export default class _Input {
	private _input: any

	private _is_valid_email_address: boolean | null = null
	private _is_valid_surname: boolean | null = null
	private _is_valid_name_s: boolean | null = null
	private _is_valid_username: boolean | null = null
	private _is_valid_name: boolean | null = null
	private _is_valid_number: boolean | null = null

	private _is_valid_reg_token: boolean | null = null

	private _is_unique_email_address: boolean | null = null
	private _is_unique_username: boolean | null = null

	private _has_error: boolean | null = null
	private _has_check_error: boolean | null = null

	/* Class Constructor */
	constructor(input: any = null) {
		this._input = input ? input : ''
	}

	toString(): string {
		return this._input
	}

	sanitize(): void { }

	async async_checkIfValid(validation_param: remote_validation_param_type) {
		if (validation_param === 'reg_token') {

		}
	}

	isValid(validation_param: local_validation_param_type, min_int_val?: number, max_int_val?: number): boolean {
		if (validation_param === 'email_address') {
			this._is_valid_email_address =
				this._is_valid_email_address !== null
					? this._is_valid_email_address
					: /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/i.test(
						this._input
					) && this._input.length >= validation_param_lengths.email_address.min_length && this._input.length <= validation_param_lengths.email_address.max_length
			this._has_error = !this._is_valid_email_address
			return this._is_valid_email_address
		}

		if (validation_param === 'surname') {
			this._is_valid_surname =
				/^[a-zA-Z0-9 -_()À-ÿ\u00f1\u00d1]+$/.test(this._input) &&
				(this._input.length >= validation_param_lengths.surname.min_length && this._input.length <= validation_param_lengths.surname.max_length)
			this._has_error = !this._is_valid_surname
			return this._is_valid_surname
		}

		if (validation_param === 'name_s') {
			this._is_valid_name_s =
				/^[a-zA-Z0-9 -_()À-ÿ\u00f1\u00d1]+$/.test(this._input) &&
				(this._input.length >= validation_param_lengths.name_s.min_length && this._input.length <= validation_param_lengths.name_s.max_length)
			this._has_error = !this._is_valid_name_s
			return this._is_valid_name_s
		}

		if (validation_param === 'username') {
			this._is_valid_username =
				this._is_valid_username !== null
					? this._is_valid_username
					: /^[a-zA-Z0-9_À-ÿ\u00f1\u00d1]+$/.test(this._input) && this._input.length >= validation_param_lengths.username.min_length && this._input.length <= validation_param_lengths.username.max_length
			this._has_error = !this._is_valid_username
			return this._is_valid_username
		}

		if (validation_param === 'name') {
			this._is_valid_name =
				/^[a-zA-Z0-9 -_()À-ÿ\u00f1\u00d1]+$/.test(this._input) &&
				(this._input.length >= validation_param_lengths.name.min_length && this._input.length <= validation_param_lengths.name.max_length)
			this._has_error = !this._is_valid_name
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
			this._has_error = !is_valid_passsword
			return is_valid_passsword
		}

		if (validation_param === 'datetime') {
			let is_valid_datetime = moment(this._input).isValid()
			this._has_error = !is_valid_datetime
			return is_valid_datetime
		}

		if (validation_param === 'number') {
			this._is_valid_number = !isNaN(this._input) && !isNaN(parseFloat(this._input)) && (!min_int_val || this._input >= min_int_val) && (!max_int_val || this._input <= max_int_val)
			this._has_error = !this._is_valid_number
			return this._is_valid_number
		}

		return false
	}

	async async_checkIfUnique(resource_name: unique_param_type) {
		return await mainLaravelDBRestAPICallWrapper
			.dispatch({
				type: 'MAIN_LARAVEL_DB_REST_API_CALL',
				method: 'GET',
				endpoint: 'users/check/{check_param_name}/{check_param}',
				data: { check_param_name: resource_name, check_param: this._input }
			})
			.then((resp: any) => {
				if (resource_name === 'email_address') this._is_unique_email_address = resp.found === false
				if (resource_name === 'username') this._is_unique_username = resp.found === false
				this._has_error = resp.found !== false
				return Promise.resolve(resp)
			})
			.catch((e: any) => {
				this._has_check_error = true
				return Promise.reject(e)
			})
	}

	isUnique(resource_name: unique_param_type): boolean {
		if (resource_name === 'email_address') return this._is_unique_email_address !== null ? this._is_unique_email_address : false
		if (resource_name === 'username') return this._is_unique_username !== null ? this._is_unique_username : false
		return false
	}

	isSafeText(min_length: number = 2, max_length: number = 255): boolean {
		//const blacklist = ["https://", 'http://', 'www.']
		let is_safe_text = this._input.length >= min_length && this._input.length <= max_length && /^[a-zA-Z0-9À-ÿ\u00f1\u00d1 !"'‘’`#$%&()*+,-./:;=?@[\]^_{|}~\r\n\u2700-\u27bf\ud83c\udde6-\uddff\ud800-\udbff\udc00-\udfff\u0023-\u0039\ufe0f?\u20e3\u3299\u3297\u303d\u3030\u24c2\ud83c\udd70-\udd71\ud83c\udd7e-\udd7f\ud83c\udd8e\ud83c\udd91-\udd9a\ud83c\udde6-\uddff\ud83c\ude01-\ude02\ud83c\ude1a\ud83c\ude2f\ud83c\ude32-\ude3a\ud83c\ude50-\ude51\u203c\u2049\u25aa-\u25ab\u25b6\u25c0\u25fb-\u25fe\u00a9\u00ae\u2122\u2139\ud83c\udc04\u2600-\u26FF\u2b05\u2b06\u2b07\u2b1b\u2b1c\u2b50\u2b55\u231a\u231b\u2328\u23cf\u23e9-\u23f3\u23f8-\u23fa\ud83c\udccf\u2934\u2935\u2190-\u21ff]+$/.test(this._input)
		this._has_error = !is_safe_text
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
		this._has_error = !result
		return result
	}

	hasCheckError(): boolean {
		return this._has_check_error as boolean
	}

	hasError(): boolean {
		return this._has_check_error ? true : this._has_error as boolean
	}

	overrideError(): void {
		this._has_check_error = false
		this._has_error = false
	}

	static generate_reg_token(): string {
		return ''
	}

	static debug_form_autofill(debug: boolean, input: any) {
		return debug && input ? input : ''
	}
}
