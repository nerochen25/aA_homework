//we want to make a GET request to
//http://api.giphy.com/v1/gifs/search?q=${search+term}&api_key=dc6zaTOxFJmzC&limit=2
//where the ${search-term} is replaced with our actual query.
//We tag limit=2 onto the end of our query params to tell Giphy we only want two GIFs back.



export const fetchSearchGiphys = searchTerm => (
  $.ajax({
    method: 'GET',
    url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=dc6zaTOxFJmzC&limit=2`
  })
);
