/* Library Imports */
import persistStorage from 'redux-persist/lib/storage'
import { combineReducers, configureStore } from '@reduxjs/toolkit'
import { persistReducer, persistStore, FLUSH, REHYDRATE, PAUSE, PERSIST, PURGE, REGISTER } from 'redux-persist'

/* Thunk argument imports */
//import { getFirebase } from 'react-redux-firebase'
import { app_backend_api } from 'app/controller/config/app_backend_api.config'

/* Reducer Imports */
import { active_session_data_reducer } from 'app/controller/redux_reducers/active_session_data.reducer'
import { app_instance_state_data_reducer } from 'app/controller/redux_reducers/app_instance_state_data.reducer'
import { auth_user_data_reducer } from 'app/controller/redux_reducers/auth_user_data.reducer'
import { datalists_data_reducer } from 'app/controller/redux_reducers/datalists_data.reducer'
import { local_pinnings_collection_reducer } from 'app/controller/redux_reducers/local_pinnings_collection.reducer'
import { sysconfig_params_data_reducer } from 'app/controller/redux_reducers/sysconfig_params_data.reducer'

/* middleware Imports */
import { mainLaravelDBAPICallMiddleware } from 'app/controller/actions/app_backend_api.actions'
//import { firebaseAPICallMiddleware } from 'app/controller/actions/firebase_api.actions'

const root_persist_config = {
    key: 'root',
    storage: persistStorage,
    whitelist: [
        'active_session_data',
        'app_instance_state_data',
        'local_pinnings_collection',
    ]
}

const active_session_persist_config = {
    key: 'active_session_data',
    storage: persistStorage,
    whitelist: ['token', 'auth_token']
}

const app_instance_state_data_persist_config = {
    key: 'app_instance_state_data',
    storage: persistStorage,
    whitelist: ['pref_theme', 'pref_lang']
}

const local_pinnings_collection_persist_config = {
    key: 'local_pinnings_collection',
    storage: persistStorage
}

const root_reducer = persistReducer(root_persist_config, combineReducers({
    // data sinks
    active_session_data: persistReducer(active_session_persist_config, active_session_data_reducer),
    app_instance_state_data: persistReducer(app_instance_state_data_persist_config, app_instance_state_data_reducer),
    auth_user_data: auth_user_data_reducer,
    datalists_data: datalists_data_reducer,
    sysconfig_params_data: sysconfig_params_data_reducer,
    // collections
    local_pinnings_collection: persistReducer(local_pinnings_collection_persist_config, local_pinnings_collection_reducer),
}))

const store = configureStore({
    reducer: root_reducer,
    middleware: (getDefaultMiddleware) =>
        getDefaultMiddleware({
            serializableCheck: {
                ignoredActions: [FLUSH, REHYDRATE, PAUSE, PERSIST, PURGE, REGISTER, 'APP_BACKEND_API_CALL_WITH_FILES', 'FIREBASE_API_CALL_WITH_FILES'],
                //ignoredActionPaths: ['file_upload'],
                //ignoredPaths: ['file_upload']
            },
            thunk: {
                extraArgument: {
                    //getFirebase,
                    app_backend_api
                },
            },
        })
            .concat(mainLaravelDBAPICallMiddleware)
    //.concat(firebaseAPICallMiddleware)
})

const persistor = persistStore(store)
export { store, persistor }
