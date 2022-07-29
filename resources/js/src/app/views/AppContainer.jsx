import { Provider as StoreProvider } from 'react-redux'
import { PersistGate } from 'redux-persist/integration/react'
/*
import { ReactReduxFirebaseProvider } from 'react-redux-firebase'
import { createFirestoreInstance } from 'redux-firestore'
*/
import 'app/controller/utils/globals'
import { store, persistor } from 'app/controller'
import { AppNavigation } from 'app/views'
import { langs } from 'app/assets'

/*
const rrfProps = {
    firebase: firebase_api_config,
    config: {
        useFirestoreForProfile: true,
        userProfile: 'users',
    },
    dispatch: store.dispatch,
    createFirestoreInstance,
}
*/

const stored_theme = store.getState().local_preferences_data.theme
require('app/assets/styles/themes/' + (['default', 'dark'].includes(stored_theme) ? stored_theme : 'default') + '/colors.css')

window._tr = (string_en) => {
    const stored_lang = store.getState().local_preferences_data.lang
    return stored_lang !== 'en' && langs[stored_lang] && langs[stored_lang][string_en] ? langs[stored_lang][string_en] : string_en
}

export default function AppContainer() {
    return (
        <StoreProvider store={store}>
            <PersistGate loading={null} persistor={persistor}>
                {/*<ReactReduxFirebaseProvider {...rrfProps}>*/}
                <AppNavigation />
                {/*</ReactReduxFirebaseProvider>*/}
            </PersistGate>
        </StoreProvider>
    )
}
