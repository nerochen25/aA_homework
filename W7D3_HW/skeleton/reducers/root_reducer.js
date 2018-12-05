//We use a rootReducer with Redux's combineReducers function to
//assign control of different slices of state to their reducers
//and create the application state.


import { combineReducers } from 'redux';
import giphysReducer from './giphys_reducer';
//when we do {giphysReducer} and when not??


export default combineReducers({
  giphys: giphysReducer
});
