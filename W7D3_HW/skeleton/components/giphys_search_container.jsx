//To allow user search, we are going to create a presentational
//and container component. Remember that
//container components subscribe to the store, read state,
//and pass props while presentational components render the user interface.

import { connect } from 'react-redux';
import GiphysSearch from './giphys_search';
import { fetchSearchGiphys } from '../actions/giphy_actions';

const mapStateToProps = state => {
  return { giphys: state.giphys };
};

const mapDispatchToProps = dispatch => {
  return {
    fetchSearchGiphys: searchTerm => dispatch(fetchSearchGiphys(searchTerm))
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(GiphysSearch);
