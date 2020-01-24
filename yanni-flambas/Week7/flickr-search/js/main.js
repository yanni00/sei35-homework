console.log('Flickr!');

// https://www.flickr.com/services/rest/?method=flickr.photos.search&text=coral+ocean&api_key=2f5ac274ecfac5a455f38745704ad084&format=json&nojsoncallback=1

const BASE_URL ='https://www.flickr.com/services/rest/'
const API_KEY ='2f5ac274ecfac5a455f38745704ad084'
let currentPage = 1;
const searchFlickr = searchText => {
$('#results').show().empty();
  $.getJSON(BASE_URL, {
    method: 'flickr.photos.search',
    text: searchText,
    api_key: API_KEY,
    format: 'json',
    nojsoncallback: 1
  })
.done( displaySearchResults )
.fail( console.warn );

}; //SearchFlickr

const searchFlickrExtend = searchText => {
$('#results').show();
  $.getJSON(BASE_URL, {
    method: 'flickr.photos.search',
    text: searchText,
    api_key: API_KEY,
    format: 'json',
    nojsoncallback: 1
  })
.done( displayExtendSearchResults )
.fail( console.warn );
}; //SearchFlickrExtend

const displaySearchResults = response => {
  // console.log( response.photos.photo );
  response.photos.photo.forEach(photo =>{
    console.log(photo.id);
    const url = generatePhotoURL( photo )
    $('#results').append(`<img src="${url}">`);
  });// forEach
}; //displaySearchResults

const displayExtendSearchResults = response => {
  // console.log( response.photos.photo );
  response.photos.photo.forEach(photo =>{
    console.log(photo.id);
    const url = generatePhotoURL( photo )
    $('#results').append(`<img src="${url}">`);
  });// forEach
}; //displayExtendSearchResults

const generatePhotoURL = photo => {
  return `http://farm${photo.farm}.staticflickr.com/${photo.server}/${photo.id}_${photo.secret}_q.jpg`
  //
  // return [
  //   'http://farm',
  //   photo.farm,
  //   '.staticflickr.com/',
  // ].join();

};//generatePhotoURL



$(document).ready(() => {
  $('#searchForm').on('submit', () => {

    const query = $('#searchText').val();
    console.log('Form Submitted!', query);

    searchFlickr( query )

    return false;
  }); //Search Form

  const showBottomPage = function(){
    const bottomPage = $( window ).bottomPage() == $(document).height() - $(window).height();
    console.log( "Scroll to bottom is: ", bottomPage )
      if ( bottomPage ) {
        const query = $('#searchText').val();
        console.log('Form Submitted!', query);
        searchFlickrExtend( query )
      return false
    };
  }; //ShowbottomPage
  const throttledShowBottomPage = _.throttle( showbottomPage, 5000 );
  $( window ).scroll( throttledShowBottomPage );

}); // document ready
