/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'verified_datetime'
type _status_t = 'unused' | 'verified' | 'annulled'
type recipient_resource_table_t = '__email_addresses' | '__phone_nos'
type charge_t = 'email_address_verification' | 'phone_no_verification' | 'password_reset'

/* 
    RespObj Export
*/
export const _VerifTokenRespObj = {
    token: undefined as undefined | null | string,
    user_username: undefined as undefined | null | string,
    charge: undefined as undefined | null | charge_t,
    _status: undefined as undefined | null | _status_t,
    recipient_resource_table: undefined as undefined | null | recipient_resource_table_t,
    recipient_resource_id: undefined as undefined | null | number,
    recipient_resource_value: undefined as undefined | null | string,

    created_datetime: undefined as undefined | null | string,
    verified_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _VerifToken extends _Wrapper_ implements Omit<typeof _VerifTokenRespObj, casts_t> {
    token: string | null = null
    user_username: string | null = null
    charge: charge_t | null = null
    _status: _status_t | null = null
    recipient_resource_table: recipient_resource_table_t | null = null
    recipient_resource_id: number | null = null
    recipient_resource_value: string | null = null

    created_datetime: _DateTime | null = null
    verified_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _VerifTokenRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _VerifTokenRespObj) {
        this._populate(args)
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.verified_datetime = args.verified_datetime && typeof args.verified_datetime === 'string' ? new _DateTime(args.verified_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _VerifTokenRespObj) {
        return this._mainLaravelDBAPICreate('accounts/systools/verif_tokens/' + args.charge, args)
    }

    /* Updaters */
}