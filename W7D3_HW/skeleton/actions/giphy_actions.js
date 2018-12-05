import * as APIUtil from '../util/api_util';

export const RECEIVE_SEARCH_GIPHYS = 'RECEIVE_SEARCH_GIPHYS';
export const REQUEST_SEARCH_GIPHYS = 'REQUEST_SEARCH_GIPHYS';

export const receiveSearchGiphys = giphys => {
  return {
    type: RECEIVE_SEARCH_GIPHYS,
    giphys,
  };
};

//Returns a function that can be called with dispatch
//and uses a promise to dispatch receiveSearchGiphys with the received data
//after APIUtil.fetchSearchGiphys is successful.

export const fetchSearchGiphys = (searchItem) => {
  return (dispatch) => {
    APIUtil.fetchSearchGiphys(searchItem)
      .then(giphys => dispatch(receiveSearchGiphys(giphys.data)));
  };
};
