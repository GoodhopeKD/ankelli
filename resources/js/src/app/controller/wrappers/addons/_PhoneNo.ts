/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'updated_datetime' | 'verified_datetime'
type tag_t = 'whatsapp' | 'calls' | 'calls_or_whatsapp'
type parent_table_t = '__users'

/* 
    RespObj Export
*/
export const _PhoneNoRespObj = {
    id: undefined as undefined | null | number,
    country_calling_code: undefined as undefined | null | string,
    number: undefined as undefined | null | string,
    tag: undefined as undefined | null | tag_t,
    parent_table: undefined as undefined | null | parent_table_t,
    parent_uid: undefined as undefined | null | string | number,
    verified_datetime: undefined as undefined | null | string,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    updated_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _PhoneNo extends _Wrapper_ implements Omit<typeof _PhoneNoRespObj, casts_t> {
    id: number | null = null
    country_calling_code: string | null = null
    number: string | null = null
    displayable: string | null = null
    tag: tag_t | null = null
    parent_table: parent_table_t | null = null
    parent_uid: string | number | null = null
    verified_datetime: _DateTime | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    updated_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _PhoneNoRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _PhoneNoRespObj) {
        this._populate(args)
        this.displayable = (this.country_calling_code as string) + (this.number as string)
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.updated_datetime = args.updated_datetime && typeof args.updated_datetime === 'string' ? new _DateTime(args.updated_datetime) : null
        this.verified_datetime = args.verified_datetime && typeof args.verified_datetime === 'string' ? new _DateTime(args.verified_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _PhoneNoRespObj) {
        return this._mainLaravelDBAPICreate('accounts/phone_nos', args)
    }

    /* Readers */

    isVerified(): boolean {
        return typeof this.verified_datetime === typeof _DateTime
    }

    pretty_tag() {
        if (this.tag === 'calls_or_whatsapp')
            return 'calls/whatsapp'
        return this.tag
    }

    /* Updaters */

    public async update(args: typeof _PhoneNoRespObj, update_note: string ) {
        const data = {} as typeof args
        if (typeof args.country_calling_code === typeof this.country_calling_code && args.country_calling_code !== this.country_calling_code) data['country_calling_code'] = args.country_calling_code
        if (typeof args.number === typeof this.number && args.number !== this.number) data.number = args.number
        if (typeof args.tag === typeof this.tag && args.tag !== this.tag) data.tag = args.tag
        return this._mainLaravelDBAPIUpdate('accounts/phone_nos/' + this.id, update_note, data)
    }
}
