/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Actions, Configs imports */
import { store } from 'app/controller/config/central_state.config'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'updated_datetime'
type item_table_t = '__offers' | '__users'
type pinning_type_t = 'favourite' | 'blocking'

/* 
    RespObj Export
*/
export const _PinningRespObj = {
    id: undefined as undefined | null | number,
    user_username: undefined as undefined | null | string,
    item_table: undefined as undefined | null | item_table_t,
    item_pmkey: undefined as undefined | null | string,
    pinning_type: undefined as undefined | null | pinning_type_t,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _Pinning extends _Wrapper_ implements Omit<typeof _PinningRespObj, casts_t> {
    id: number | null = null
    user_username: string | null = null
    item_table: item_table_t | null = null
    item_pmkey: string | null = null
    pinning_type: pinning_type_t | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _PinningRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _PinningRespObj) {
        this._populate(args)
        this.created_datetime = typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _PinningRespObj) {
        return this._mainLaravelDBAPICreate('pinnings', args)
    }

    /* Updaters */

    public async update(args: typeof _PinningRespObj, update_note: string) {
        const data = {} as typeof args
        if (typeof args.pinning_type === typeof this.pinning_type && args.pinning_type !== this.pinning_type) data.pinning_type = args.pinning_type
        return this._mainLaravelDBAPIUpdate('pinnings/' + this.id, update_note, data)
    }

    /* Deleter */
    public async delete() {
        return this._delete('pinnings/' + this.id)
    }
}