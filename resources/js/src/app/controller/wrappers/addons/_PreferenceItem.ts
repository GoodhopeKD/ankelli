/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'updated_datetime'
type parent_table_t = '__users' | '__stores' | '__email_addresses'

/* 
    ResponseObject Export
*/
export const _PreferenceItemResponseObject = {
    id: undefined as undefined | null | number,
    key_name: undefined as undefined | null | string,
    key_slug: undefined as undefined | null | string,
    value: undefined as undefined | null | string | number | boolean,
    parent_table: undefined as undefined | null | parent_table_t,
    parent_uid: undefined as undefined | null | string | number,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _PreferenceItem extends _Wrapper_ implements Omit<typeof _PreferenceItemResponseObject, casts_t> {
    id: number | null = null
    key_name: string | null = null
    key_slug: string | null = null
    value: string | number | boolean | null = null
    parent_table: parent_table_t | null = null
    parent_uid: string | number | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _PreferenceItemResponseObject) { super(); this.populate(args) }

    protected populate(args: typeof _PreferenceItemResponseObject) {
        this._populate(args)
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = args.updated_datetime && typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _PreferenceItemResponseObject) {
        return this._mainLaravelDBAPICreate('preference_items', args)
    }
}
