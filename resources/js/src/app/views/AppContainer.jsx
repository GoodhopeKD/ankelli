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

const pref_theme = store.getState().app_instance_state_data.pref_theme
require('app/assets/styles/themes/' + (['default', 'dark'].includes(pref_theme) ? pref_theme : 'default') + '/colors.css')

window._tr = (string_en) => {
    const pref_lang = store.getState().app_instance_state_data.pref_lang
    return pref_lang !== 'en' && langs[pref_lang] && langs[pref_lang][string_en] ? langs[pref_lang][string_en] : string_en
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
