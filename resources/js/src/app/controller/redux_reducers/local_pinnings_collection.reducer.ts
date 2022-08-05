const initial_state = {
	data: []
};

const local_pinnings_collection_reducer = (state = initial_state, action: any) => {
	switch (action.type) {
		case 'LOCAL_PINNINGS_ADD_ONE':
			return {
				...state,
				data: [
					...state.data.filter((pinning: any) => !(pinning.item_table === action.pinning.item_table && pinning.item_ref_code === action.pinning.item_ref_code)),
					{ ...action.pinning }
				]
			};
		case 'LOCAL_PINNINGS_UPDATE_ONE':
			const data = JSON.parse(JSON.stringify(state.data)) // dereferencing to prevent state mutation
			const item_index = data.findIndex(((pinning: any) => (pinning.item_table === action.pinning.item_table && pinning.item_ref_code === action.pinning.item_ref_code)));
			data[item_index] = { ...data[item_index], ...action.pinning }
			return { ...state, data };

		case 'LOCAL_PINNINGS_REMOVE_ONE':
			return { ...state, data: state.data.filter((pinning: any) => !(pinning.item_table === action.pinning.item_table && pinning.item_ref_code === action.pinning.item_ref_code)) };

		case 'LOCAL_PINNINGS_CLEAR_ALL':
			return initial_state;

		default:
			return state;
	}
};

export { local_pinnings_collection_reducer }
