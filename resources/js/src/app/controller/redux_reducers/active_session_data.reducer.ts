import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'

let device_info = {
	name:  '',
	version:  '',
}

let agent_app_info = {
	//name: pkg.name,
	//version: pkg.version,
	extra: 'Ankelli Mobile App'
}

const initial_state = {
	auth_token: null,
	session_token: null,
	signin_datetime: null,
	signout_datetime: null,
	device_info,
	agent_app_info,
	utc_offset: _DateTime.timezoneUTCOffset(),
	last_request_location: { ip: '192.168.1.5' }
}

export const active_session_data_reducer = (state = initial_state, action: any) => {
	switch (action.type) {
		case 'ACTIVE_CONNECT_INSTANCE_DATA_SET_AUTH_ACCESS_TOKEN':
			return {
				...state,
				auth_token: action.auth_token
			}

		case 'ACTIVE_CONNECT_INSTANCE_DATA_UPDATE':
			return {
				...state,
				...action.active_session_data,
				device_info,
				agent_app_info
			}

		case 'AUTH_DATA_CLEAR_ALL':
			return initial_state

		default:
			return state
	}
}