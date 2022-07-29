const initial_state = {
	connectivity: null,
	flash_notification: {
		visible: false,
		title: '',
		message: '',
		duration: 1850
	},
	demo_enabled: false,
}

export const system_state_data_reducer = (state = initial_state, action: any) => {
	switch (action.type) {
		case 'SYSTEM_STATE_SET_CONNECTIVITY':
			return {
				...state,
				connectivity: action.connectivity
			}

		case 'SYSTEM_STATE_SET_FLASH_NOTIFICATION_PARAMS':
			return {
				...state,
				flash_notification: { ...state.flash_notification, ...action.flash_notification, title: (action.flash_notification.title) ? action.flash_notification.title : '' }
			}

		case 'SYSTEM_STATE_CLEAR_ALL':
			return initial_state

		default:
			return state
	}
}