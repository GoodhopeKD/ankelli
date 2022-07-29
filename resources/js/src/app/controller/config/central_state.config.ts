/* Library Imports */
import storage from 'redux-persist/lib/storage'
import { combineReducers, configureStore } from '@reduxjs/toolkit'
import { persistReducer, persistStore, FLUSH, REHYDRATE, PAUSE, PERSIST, PURGE, REGISTER } from 'redux-persist'

/* Thunk argument imports */
//import { getFirebase } from 'react-redux-firebase'
import { main_laravel_db_rest_api } from 'app/controller/config/main_laravel_db_rest_api.config'

/* Reducer Imports */
import { local_pinnings_collection_reducer } from 'app/controller/redux_reducers/local_pinnings_collection.reducer'
import { local_preferences_data_reducer } from 'app/controller/redux_reducers/local_preferences_data.reducer'
import { active_session_data_reducer } from 'app/controller/redux_reducers/active_session_data.reducer'
import { auth_user_data_reducer } from 'app/controller/redux_reducers/auth_user_data.reducer'
import { system_state_data_reducer } from 'app/controller/redux_reducers/system_state_data.reducer'

/* middleware Imports */
import { mainLaravelDBAPICallMiddleware } from 'app/controller/actions/main_laravel_db_rest_api.actions'
//import { firebaseAPICallMiddleware } from 'app/controller/actions/firebase_api.actions'

const root_persist_config = {
    key: 'root',
    storage,
    whitelist: [
        'active_session_data',
        'local_preferences_data',
    ]
}

const local_pinnings_collection_persist_config = {
    key: 'local_pinnings_collection',
    storage
};

const local_preferences_data_persist_config = {
    key: 'local_preferences_data',
    storage
}

const active_session_persist_config = {
    key: 'active_session_data',
    storage,
    whitelist: ['auth_token', 'session_token']
}

const root_reducer = persistReducer(root_persist_config, combineReducers({
    // collections
    local_pinnings_collection: persistReducer(local_pinnings_collection_persist_config, local_pinnings_collection_reducer),
    // data points
    local_preferences_data: persistReducer(local_preferences_data_persist_config, local_preferences_data_reducer),
    active_session_data: persistReducer(active_session_persist_config, active_session_data_reducer),
    auth_user_data: auth_user_data_reducer,
    system_state_data: system_state_data_reducer,
}))

const store = configureStore({
    reducer: root_reducer,
    middleware: (getDefaultMiddleware) =>
        getDefaultMiddleware({
            serializableCheck: {
                ignoredActions: [FLUSH, REHYDRATE, PAUSE, PERSIST, PURGE, REGISTER, 'MAIN_LARAVEL_DB_REST_API_CALL_WITH_FILES'],
                //ignoredActionPaths: ['file_upload'],
                //ignoredPaths: ['file_upload']
            },
            thunk: {
                extraArgument: {
                    //getFirebase,
                    main_laravel_db_rest_api
                },
            },
        })
            .concat(mainLaravelDBAPICallMiddleware)
    //.concat(firebaseAPICallMiddleware)
})

const persistor = persistStore(store)
export { store, persistor }
