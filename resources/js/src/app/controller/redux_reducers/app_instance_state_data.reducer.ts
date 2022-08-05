const initial_state = {
	temp_auth: false,
	// connectivity
	main_laravel_db_rest_api_connectivity: null,
	firebase_api_connectivity: null,
	// flash notification storage
	flash_notification: {
		visible: false,
		title: '',
		message: '',
		duration: 1850
	},
	// prefs
	learn_mode_enabled: false,
	pref_theme: 'default',
	pref_lang: 'en',
}

export const app_instance_state_data_reducer = (state = initial_state, action: any) => {
	switch (action.type) {
		case 'APP_INSTANCE_STATE_RESET_CONNECTIVITY':
			return {
				...state,
				main_laravel_db_rest_api_connectivity: null,
				firebase_api_connectivity: null,
			}

		case 'APP_INSTANCE_STATE_SET_MAIN_LARAVEL_DB_REST_API_CONNECTIVITY':
			return {
				...state,
				main_laravel_db_rest_api_connectivity: action.main_laravel_db_rest_api_connectivity
			}

		case 'APP_INSTANCE_STATE_SET_FIREBASE_API_CONNECTIVITY':
			return {
				...state,
				firebase_api_connectivity: action.firebase_api_connectivity
			}

		case 'APP_INSTANCE_STATE_SET_FLASH_NOTIFICATION_PARAMS':
			return {
				...state,
				flash_notification: { ...state.flash_notification, ...action.flash_notification, title: (action.flash_notification.title) ? action.flash_notification.title : '' }
			}

		case 'APP_INSTANCE_STATE_SET_TEMP_AUTH':
			return {
				...state,
				temp_auth: action.temp_auth
			}

		case 'APP_INSTANCE_STATE_SET_PREF_THEME':
			return {
				...state,
				pref_theme: action.pref_theme
			}

		case 'APP_INSTANCE_STATE_SET_PREF_LANG':
			return {
				...state,
				pref_lang: action.pref_lang
			}

		case 'APP_INSTANCE_STATE_CLEAR_ALL':
			return initial_state

		default:
			return state
	}
}