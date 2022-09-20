const placeholderFirebaseAction = (action: any) => {
	return (dispatch: any, getState: any, { getFirebase }: any) => {
		return getFirebase().firestore()
			.collection(action.resource)
			.doc(action.resource.id)
			.set(
				{ ...action.resource },
				{ merge: true }
			)
	}
}

export const firebaseAPICallMiddleware = (store: any) => (next: any) => (action: any) => {
	if (action.type === 'placeholderFirebaseAction') {
		return store.dispatch(placeholderFirebaseAction(action))
	}
	return next(action)
}
