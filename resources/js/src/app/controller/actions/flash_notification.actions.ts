class BgTaskHandler { static runInBackground = (fn:any) => fn() }

export const showFlashNotification = (params: { title?: string, message: string, duration?: number }) => {
    return (dispatch: any) => {
        const bgTask = () => dispatch({ type: 'SYSTEM_STATE_SET_FLASH_NOTIFICATION_PARAMS', flash_notification: { ...params, visible: true } })
        try { BgTaskHandler.runInBackground(() => bgTask()) } catch (e) { bgTask() }
    }
}

export const hideOrClearFlashComponent = () => {
    return (dispatch: any) => {
        dispatch({ type: 'SYSTEM_STATE_SET_FLASH_NOTIFICATION_PARAMS', flash_notification: { message: undefined as undefined | null | string | undefined, duration: 1850, visible: false } })
    }
}