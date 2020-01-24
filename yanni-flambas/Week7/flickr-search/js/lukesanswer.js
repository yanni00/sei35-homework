console.log('flickr!');

// https://www.flickr.com/services/rest/?method=flickr.photos.search&text=coral+ocean&api_key=2f5ac274ecfac5a455f38745704ad084&format=json&nojsoncallback=1

const BASE_URL = 'https://www.flickr.com/services/rest/';
const API_KEY = '2f5ac274ecfac5a455f38745704ad084';

let searchQuery = '';
let currentPage = 0;

const searchFlickr = searchText => {

  currentPage++; // always increment the page counter (TODO: use an argument instead?)

  $.getJSON(BASE_URL, {
    method: 'flickr.photos.search',
    text: searchText,
    api_key: API_KEY,
    format: 'json',
    nojsoncallback: 1,
    page: currentPage
  })
  .done( displaySearchResults )
  .fail( console.warn );

};  // searchFlickr()

// Generate a new version of our searchFlickr function, which is
// guaranteed to run no more often than every 5 seconds.
// The new function takes the same arguments as our original function!
//NOTE: This is functions as "first-class" in JS:
// - they can be passed in as arguments to other functions
// - they can be returned by other fucntions
// - i.e. they're just *values*, like anything else you can put in a variable.
const throttledSearchFlickr = _.throttle( searchFlickr, 5000 );

const displaySearchResults = response => {
  // console.log( response.photos.photo );
  response.photos.photo.forEach( photo => {
    const url = generatePhotoURL( photo );
    // console.log( url );
    const $img = $(`<img src="${url}">`).on('click', () => displayFullscreenImage( photo ));
    $('#results').append($img);
  }); // forEach
}; // displaySearchResults()

const generatePhotoURL = (photo, size='q') => {
  return `https://farm${photo.farm}.staticflickr.com/${photo.server}/${photo.id}_${photo.secret}_${size}.jpg`;

  // return [
  //   'http://farm',
  //   photo.farm,
  //   '.staticflickr.com/'
  // ].join();

};

const displayFullscreenImage = photoObj => {
  console.log( photoObj );
  const fullsizeURL = generatePhotoURL( photoObj, 'c' );
  console.log('fullsizeURL', fullsizeURL);
  $('#fullscreen')
  .css('background-image', `url(${fullsizeURL})`)
  .show();
};

$(document).ready( () => {

  $('#searchText').focus(); // cursor focus

  $(document).on('keydown', ev => {
    if( ev.key === 'Escape' ){
      $('#fullscreen').fadeOut(500);
    }
  });

  //Handle a click on a thumbnail image to show a larger version
  // BECAUSE there are no images on the page yet, when we attach this handler to the query results,
  // we need a different style of a
  // $('#results > img').on('click', () => {
  // $(document).on('click', '#results > img', () => {
  //   console.log('clicked!');
  // });






  $('#searchForm').on('submit', () => {
    searchQuery = $('#searchText').val(); //save into global variable(infinite scroll needs it)

    //Clear previous results
    $('#results').empty();

    // Reset the current page count to 0
    currentPage = 0;

    searchFlickr( searchQuery );

    return false; // do not actually submit the form
                  // which reloads the page
  });

  // Attach an event handler to scroll events on the whole window
  $(window).on('scroll', () => {

    //have we scrolled to the bottom of the document yet?
    // console.log('scroll!');
    // console.log('document height:', $(document).height() );
    // console.log('window height:', $(window).height() );
    // console.log('scrollTop:', $(window).scrollTop(), window.pageYOffset );

    //What is the distance of the window bottom from the TOP of the document?
    //(This will be an increasing number, with a max value of document height)
    const scrollBottom = $(window).scrollTop() + $(window).height();
    // console.log('scrollBottom: ', scrollBottom);

    //What is the distance of the window bottom from the END of the document?
    //(This will be a decreasing number (as we scroll down), with a min value of 0)
    const windowBottomToEnd = $(document).height() - scrollBottom;
    // console.log('windowBottomToEnd', windowBottomToEnd);

    if( windowBottomToEnd < 200){
      // Load next page ofresults
      console.log('%cLoad next page', 'font-size: 18pt');

      throttledSearchFlickr( searchQuery )

    }
  });// Scroll handler
}); // document ready
