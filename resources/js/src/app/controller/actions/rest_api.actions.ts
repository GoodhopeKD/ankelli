import { store } from 'app/controller/config/central_state.config'

/*
	Type Definitions
*/
type rest_api_call_args = {
	type: string,
	method: 'POST' | 'GET' | 'PUT' | 'DELETE',
	endpoint: string,
	data?: any,
	get_data_to_preserve?: [],
	data_has_files?: boolean,
}

// Work around for redux toolkit
export class mainLaravelDBRestAPICallWrapper {
	static dispatch = async (args: rest_api_call_args) => {
		return await store.dispatch({ ...args, path: args.data_has_files ? 'file_upload' : null } as any)
	}
}