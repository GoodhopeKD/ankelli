/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'updated_datetime'
type parent_table_t = '__users' | '__merchants'
type pivot_parent_table_t = '__trades' | '__orders'

/* 
    RespObj Export
*/
export const _ReviewRespObj = {
    id: undefined as undefined | null | number,
    parent_table: undefined as undefined | null | parent_table_t,
    parent_uid: undefined as undefined | null | string,
    pivot_parent_table: undefined as undefined | null | pivot_parent_table_t,
    pivot_parent_uid: undefined as undefined | null | string,
    rating: undefined as undefined | null | number,
    comment: undefined as undefined | null | string,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _Review extends _Wrapper_ implements Omit<typeof _ReviewRespObj, casts_t> {
    id: number | null = null
    parent_table: parent_table_t | null = null
    parent_uid: string | null = null
    pivot_parent_table: pivot_parent_table_t | null = null
    pivot_parent_uid: string | null = null
    rating: number | null = null
    comment: string | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _ReviewRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _ReviewRespObj) {
        this._populate(args)
        this.created_datetime = typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _ReviewRespObj) {
        return this._mainLaravelDBAPICreate('content/reviews', args)
    }

    /* Updaters */

    public async update(args: { rating?: number, comment?: string }, update_note: string) {
        const data = {} as typeof args
        if (typeof args.rating === 'number' && args.rating !== this.rating) data.rating = args.rating
        if (typeof args.comment === 'string' && args.comment !== this.comment) data.comment = args.comment
        return this._mainLaravelDBAPIUpdate('content/reviews/' + this.id, update_note, data)
    }

    /* Deleter */
    public async delete() {
        return this._delete('content/reviews/' + this.id)
    }
}