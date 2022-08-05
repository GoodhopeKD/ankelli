/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'used_datetime'

/* 
    RespObj Export
*/
export const _RegTokenRespObj = {
    token: undefined as undefined | null | string,
    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    used_datetime: undefined as undefined | null | string
}

/*
    Exported Default Class
*/
export default class _RegToken extends _Wrapper_ implements Omit<typeof _RegTokenRespObj, casts_t> {
    token: string | null = null
    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    used_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _RegTokenRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _RegTokenRespObj) {
        this._populate(args)
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.used_datetime = args.used_datetime && typeof args.used_datetime === 'string' ? new _DateTime(args.used_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _RegTokenRespObj) {
        return this._mainLaravelDBAPICreate('systools/reg_tokens', args)
    }
}