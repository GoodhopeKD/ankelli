export const auth_user_data_reducer = (state: any = null, action: any) => {
	switch (action.type) {
		case 'AUTH_USER_DATA_UPDATE':
			return { ...state, ...action.auth_user_data, }

		case 'AUTH_DATA_CLEAR_ALL':
			return null

		default:
			return state
	}
}