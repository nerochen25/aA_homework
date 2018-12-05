//Create a functional component in root.jsx that will
//render all of the app's React components.
//It should receive the app's Redux store as a prop
//and will wrap our all of our app's components with the Provider from react-redux.

import React from 'react';
import { Provider } from 'react-redux';

import GiphysSearchContainer from './giphys_search_container';

const Root = ({ store }) => {
  return (
    <Provider store={store}>
      <GiphysSearchContainer />
    </Provider>
  );
};

export default Root;
