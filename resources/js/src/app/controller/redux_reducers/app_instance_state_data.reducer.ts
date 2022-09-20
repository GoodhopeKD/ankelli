const initial_state = {
	// connectivity
	app_backend_api_connectivity_indicator: null,
	firebase_api_connectivity_indicator: null,
	// flash notification storage
	flash_notification: {
		visible: false,
		title: '',
		message: '',
		duration: 1850
	},
	// prefs
	learn_mode_enabled: false,
	pref_theme: 'light',
	pref_lang: 'en',
}

export const app_instance_state_data_reducer = (state = initial_state, action: any) => {
	switch (action.type) {
		case 'APP_INSTANCE_STATE_RESET_CONNECTIVITY_INDICATORS':
			return {
				...state,
				app_backend_api_connectivity_indicator: null,
				firebase_api_connectivity_indicator: null,
			}

		case 'APP_INSTANCE_STATE_SET_APP_BACKEND_API_CONNECTIVITY_INDICATOR':
			return {
				...state,
				app_backend_api_connectivity_indicator: action.app_backend_api_connectivity_indicator,
			}

		case 'APP_INSTANCE_STATE_SET_FIREBASE_API_CONNECTIVITY_INDICATOR':
			return {
				...state,
				firebase_api_connectivity_indicator: action.firebase_api_connectivity_indicator,
			}

		case 'APP_INSTANCE_STATE_SET_FLASH_NOTIFICATION_PARAMS':
			return {
				...state,
				flash_notification: { ...state.flash_notification, ...action.flash_notification, title: (action.flash_notification.title) ? action.flash_notification.title : '' }
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