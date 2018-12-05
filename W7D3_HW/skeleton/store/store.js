//The store holds the global state of an application,
//so we need to create it before we can test our reducer.
//Remember that Redux provides a createStore method that
//receives a reducer, optional preloadedState, and an optional enhancer.
//We'll begin by writing a configureStore function that
//passes our rootReducer to createStore.

import { createStore, applyMiddleware } from 'redux';
import thunk from 'redux-thunk';
import RootReducer from '../reducers/root_reducer';


//Refactor your configureStore function in store/store.js to
//incorporate your thunk action creator. Remember that Redux provides thunk middleware from
//the redux-thunk module. We'll import Redux's thunk middleware and applyMiddleware function.
const configureStore = () => {
  return createStore(RootReducer, applyMiddleware(thunk));
};

export default configureStore;
