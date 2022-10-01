/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'verified_datetime'

/* 
    RespObj Export
*/
export const _EmailAddressRespObj = {
    id: undefined as undefined | null | number,
    user_username: undefined as undefined | null | string,
    email_address: undefined as undefined | null | string,
    receive_notifications: undefined as undefined | null | boolean,
    receive_promos_email_inbox: undefined as undefined | null | boolean,

    created_datetime: undefined as undefined | null | string,
    verified_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _EmailAddress extends _Wrapper_ implements Omit<typeof _EmailAddressRespObj, casts_t> {
    id: number | null = null
    user_username: string | null = null
    email_address: string | null = null
    receive_notifications: boolean | null = null
    receive_promos_email_inbox: boolean | null = null

    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null
    verified_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _EmailAddressRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _EmailAddressRespObj) {
        this._populate(args)

        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.verified_datetime = args.verified_datetime && typeof args.verified_datetime === 'string' ? new _DateTime(args.verified_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _EmailAddressRespObj) {
        return this._mainLaravelDBAPICreate('accounts/email_addresses', args)
    }

    /* Readers */

    isVerified(): boolean {
        return typeof this.verified_datetime === typeof _DateTime
    }

    isPrimary(primary_email_address: string): boolean {
        return this.email_address === primary_email_address
    }
}