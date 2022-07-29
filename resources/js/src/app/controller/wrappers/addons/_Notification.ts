/* Auxilliary Imports */
import _DateTime from 'app/controller/wrappers/auxilliary/_DateTime'
/* Parent Class import */
import _Wrapper_ from 'app/controller/wrappers/_Wrapper_'
/* Element Imports */
import { store } from 'app/controller/config/central_state.config'
import { showFlashNotification } from 'app/controller/actions/flash_notification.actions'

/*
    Type Definitions
*/
type casts_t = 'created_datetime' | 'read_datetime'
type dest_t = 'flash' | 'alert' | 'push'

/* 
    ResponseObject Export
*/
export const _NotificationResponseObject = {
    id: undefined as undefined | null | number,
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
export default class _Notification extends _Wrapper_ implements Omit<typeof _NotificationResponseObject, casts_t> {
    id: number | null = null
    user_username: string | null = null
    dest: dest_t | null = null
    content: typeof _NotificationResponseObject.content = _NotificationResponseObject.content
    created_datetime: _DateTime | null = null
    read_datetime: _DateTime | null = null

    /* Class Constructor */
    constructor(args: typeof _NotificationResponseObject) { super(); this.populate(args) }

    protected populate(args: typeof _NotificationResponseObject) {
        this._populate(args)
        this.created_datetime = new _DateTime(args.created_datetime)
        this.read_datetime = typeof args.read_datetime === 'string' ? new _DateTime(args.read_datetime) : null
    }

    /* Creator(s) */

    static create(args: typeof _NotificationResponseObject) {
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
        return this.create({ ..._NotificationResponseObject, dest: 'flash', content: { title: params.title, body: params.message, data: { flash_duration: params.duration } }, })
    }

    /* Readers */

    wasRead(): boolean {
        return this.read_datetime !== null
    }
}