/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Element Imports */
import { store } from 'app/controller/config/central_state.config'
import { showFlashNotification } from 'app/controller/actions/flash_notification.actions'
/* Actions, Configs imports */
import { laravel_api_page_selection_t } from 'app/controller/actions/app_backend_api.actions'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'read_datetime'
type dest_t = 'flash' | 'alert' | 'push'
type get_collection_params = {
    get_with_meta?: boolean,
    user_username?: string,
    status?: 'all' | 'read' | 'unread',
}

/* 
    RespObj Export
*/
export const _NotificationRespObj = {
    id: undefined as undefined | null | string,
    user_username: undefined as undefined | null | string,
    dest: undefined as undefined | null | dest_t, // not saved as only push notifications are saved
    content: {} as {
        title?: string,
        subtitle?: string,
        body: string,
        data?: {
            navigation?: {
                native?: { route_name: string, params?: { screen: string, params?: Object } },
                web?: { relative_path: string }
            },
            flash_duration?: number,
            alert_buttons?: {
                text?: string,
                onPress?: (value?: string) => void,
                style?: 'cancel' | 'default' | 'destructive'
            }[]
            [key: string]: unknown
        } | undefined
    },
    created_datetime: undefined as undefined | null | string,
    read_datetime: undefined as undefined | null | string,
}

/*
    Exported Default Class
*/
export default class _Notification extends _Wrapper_ implements Omit<typeof _NotificationRespObj, casts_t> {
    id: string | null = null
    user_username: string | null = null
    dest: dest_t | null = null
    content: typeof _NotificationRespObj.content = _NotificationRespObj.content
    created_datetime: _DateTime | null = null
    read_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _NotificationRespObj) { super(); this.populate(args) }

    protected populate(args: typeof _NotificationRespObj) {
        this._populate(args)
        this.created_datetime = new _DateTime(args.created_datetime)
        this.read_datetime = typeof args.read_datetime === 'string' ? new _DateTime(args.read_datetime) : null
    }

    /* Creator(s) */

    static create(args: typeof _NotificationRespObj) {
        switch (args.dest) {
            case 'flash':
                return store.dispatch(showFlashNotification({ title: args.content.title, message: args.content.body, duration: args.content.data?.flash_duration }))
            case 'alert':
                return
            case 'push':
                return
        }
    }

    static flash(params: { title?: string, message: string, duration?: number }) {
        return this.create({ ..._NotificationRespObj, dest: 'flash', content: { title: params.title, body: params.message, data: { flash_duration: params.duration } }, })
    }

    /* Readers */

    wasRead(): boolean {
        return this.read_datetime !== null
    }

    public static async getCollection(params: get_collection_params | null = null, page_select?: laravel_api_page_selection_t, per_page?: number) {
        return this._mainLaravelDBAPIGetCollection('notifications', params, page_select, per_page)
    }
}