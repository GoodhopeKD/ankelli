export const sysconfig_params_data_reducer = (state: any = null, action: any) => {
	switch (action.type) {
		case 'SYSCONFIG_PARAMS_DATA_UPDATE':
			const prefs = {} as any
			for (var i = 0; i < action.sysconfig_params_data.length; i++) {
				prefs[action.sysconfig_params_data[i].key_slug as string] = action.sysconfig_params_data[i].value
			}
			return { ...state, ...prefs }

		case 'SYSCONFIG_PARAMS_CLEAR_ALL':
			return null

		default:
			return state
	}
}