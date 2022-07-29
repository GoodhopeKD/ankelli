const initial_state = {
	temp_auth: false,
	theme: 'default',
	lang: 'en'
}

export const local_preferences_data_reducer = (state = initial_state, action: any) => {
	switch (action.type) {
		
		case 'SYSTEM_STATE_SET_TEMP_AUTH':
			return {
				...state,
				temp_auth: action.temp_auth
			}

		case 'SET_LOCAL_PREFERRED_THEME':
			return {
				...state,
				theme: action.theme
			}

		case 'SET_LOCAL_PREFERRED_LANG':
			return {
				...state,
				lang: action.lang
			}

		case 'LOCAL_PREFERENCES_CLEAR_ALL':
			return initial_state

		default:
			return state
	}
}