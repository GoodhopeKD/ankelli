/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Element Imports */
import _File, { _FileRespObj } from 'app/controller/wrappers/addons/_File'

/*
    Type Definitions
*/
type casts_t = 'attachement' | 'created_datetime' | 'read_datetime'
type parent_table_t = '__chats' | '__trades'

/*  
    RespObj Export
*/
export const _MessageRespObj = {
    id: undefined as undefined | null | string,
    parent_table: undefined as undefined | null | parent_table_t,
    parent_uid: undefined as undefined | null | string,
    body: undefined as undefined | null | string,
    attachement: undefined as undefined | null | typeof _FileRespObj,

    creator_username: undefined as undefined | null | string,
    created_datetime: undefined as undefined | null | string,
    read_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _Message extends _Wrapper_ implements Omit<typeof _MessageRespObj, casts_t> {
    id: string | null = null
    parent_table: parent_table_t | null = null
    parent_uid: string | null = null
    body: string | null = null
    attachement: _File | null = null

    creator_username: string | null = null
    created_datetime: _DateTime | null = null
    read_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _MessageRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _MessageRespObj) {
        this._populate(args)
        this.attachement = args.attachement && typeof args.attachement === typeof _FileRespObj ? new _File(args.attachement) : null
        this.created_datetime = new _DateTime(args.created_datetime)
        this.read_datetime = args.read_datetime && typeof args.read_datetime === 'string' ? new _DateTime(args.read_datetime) : null
    }

    /* Creator(s) */

    public static async create(args: typeof _MessageRespObj) {
        return this._mainLaravelDBAPICreate('messages', args)
    }
}