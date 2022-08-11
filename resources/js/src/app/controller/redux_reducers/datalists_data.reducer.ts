const initial_state = {
	active_assets : {},
	active_currencies : {},
	active_pymt_methods : {},
	active_countries : {},
}

export const datalists_data_reducer = (state = initial_state, action: any) => {
	switch (action.type) {
		case 'DATALISTS_DATA_UPDATE':
            var active_assets = state.active_assets as any
            if (action.datalists_data.active_assets){
                active_assets = {}
                action.datalists_data.active_assets.forEach((element: any) => {
                    active_assets[element.code] = element
                });
            }
            var active_currencies = state.active_currencies as any
            if (action.datalists_data.active_currencies){
                active_currencies = {}
                action.datalists_data.active_currencies.forEach((element: any) => {
                    active_currencies[element.code] = element
                });
            }
            var active_pymt_methods = state.active_pymt_methods as any
            if (action.datalists_data.active_pymt_methods){
                active_pymt_methods = {}
                action.datalists_data.active_pymt_methods.forEach((element: any) => {
                    active_pymt_methods[element.slug] = element
                });
            }
			return { ...state, active_assets, active_currencies, active_pymt_methods }

		case 'DATALISTS_CLEAR_ALL':
			return null

		default:
			return state
	}
}