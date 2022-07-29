/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'read_datetime'
type parent_table_t = '__chats' | '__trades'

/*  
    ResponseObject Export
*/
export const _MessageResponseObject = {
    id: undefined as undefined | null | number,
    parent_table: undefined as undefined | null | parent_table_t,
    parent_id: undefined as undefined | null | number,
    body: undefined as undefined | null | string,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    read_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _Message extends _Wrapper_ implements Omit<typeof _MessageResponseObject, casts_t> {
    id: number | null = null
    parent_table: parent_table_t | null = null
    parent_id: number | null = null
    body: string | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    read_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _MessageResponseObject) { super(); this.populate(args) }

    protected populate(args: typeof _MessageResponseObject) {
        this._populate(args)
        this.created_datetime = new _DateTime(args.created_datetime)
        this.read_datetime = args.read_datetime && typeof args.read_datetime === 'string' ? new _DateTime(args.read_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _MessageResponseObject) {
        return this._mainLaravelDBAPICreate('messages', args)
    }
}