/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'verified_datetime'
type status_t = 'unused' | 'verified' | 'annulled'
type recepient_resource_table_t = '__email_addresses' | '__phone_numbers'
type charge_t = 'email_address_verification' | 'phone_number_verification' | 'password_reset'

/* 
    ResponseObject Export
*/
export const _VerificationTokenResponseObject = {
    id: undefined as undefined | null | number,
    user_username: undefined as undefined | null | string,
    token: undefined as undefined | null | string,
    charge: undefined as undefined | null | charge_t,
    status: undefined as undefined | null | status_t,
    recepient_resource_table: undefined as undefined | null | recepient_resource_table_t,
    recepient_resource_id: undefined as undefined | null | number,
    recepient_resource_value: undefined as undefined | null | string,

    created_datetime: undefined as undefined | null | string,
    verified_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _VerificationToken extends _Wrapper_ implements Omit<typeof _VerificationTokenResponseObject, casts_t> {
    id: number | null = null
    user_username: string | null = null
    token: string | null = null
    charge: charge_t | null = null
    status: status_t | null = null
    recepient_resource_table: recepient_resource_table_t | null = null
    recepient_resource_id: number | null = null
    recepient_resource_value: string | null = null

    created_datetime: _DateTime | null = null
    verified_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _VerificationTokenResponseObject) { super(); this.populate(args) }

    protected populate(args: typeof _VerificationTokenResponseObject) {
        this._populate(args)
        this.created_datetime = args.created_datetime && typeof args.created_datetime === 'string' ? new _DateTime(args.created_datetime) : null
        this.verified_datetime = args.verified_datetime && typeof args.verified_datetime === 'string' ? new _DateTime(args.verified_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _VerificationTokenResponseObject) {
        return this._mainLaravelDBAPICreate('system_tools/verification_tokens/' + args.charge, args)
    }

    /* Updaters */
}