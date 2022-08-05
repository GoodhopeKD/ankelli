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
export const _DepositTokenRespObj = {
    token: undefined as undefined | null | string,
    asset_name: undefined as undefined | null | string,
    asset_value: undefined as undefined | null | number,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    user_username: undefined as undefined | null | string,
    used_datetime: undefined as undefined | null | string
}

/*
    Exported Default Class
*/
export default class _DepositToken extends _Wrapper_ implements Omit<typeof _DepositTokenRespObj, casts_t> {
    token: string | null = null
    asset_name: string | null = null
    asset_value: number | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    user_username: string | null = null
    used_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _DepositTokenRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _DepositTokenRespObj) {
        this._populate(args)
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.used_datetime = args.used_datetime && typeof args.used_datetime === 'string' ? new _DateTime(args.used_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _DepositTokenRespObj) {
        return this._mainLaravelDBAPICreate('systools/deposit_tokens', args)
    }
}