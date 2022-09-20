export const _resource_collection_wrapper = {
	data: [] as any[],
	links: {
		first: 'http://api.domain.com/resources?page=1',
		last: 'http://api.domain.com/resources?page=1',
		prev: null as string | null,
		next: null as string | null
	},
	meta: {
		current_page: -1,
		from: null as number | null,
		last_page: -1,
		links: [
			{
				url: null as string | null,
				label: '&laquo; Previous',
				active: false
			},
			{
				url: 'http://api.domain.com/resources?page=1',
				label: '1',
				active: true
			},
			{
				url: null as string | null,
				label: 'Next &raquo;',
				active: false
			}
		],
		path: 'http://api.domain.com/resources',
		per_page: -1,
		to: null as number | null,
		total: -1
	}
}

export const _dataless_resource_collection_wrapper = {
	links: _resource_collection_wrapper.links,
	meta: _resource_collection_wrapper.meta,
}