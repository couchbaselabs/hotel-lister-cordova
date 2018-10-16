var exec = require('cordova/exec');

var hotelLister = {
  // tag::query-hotels[]
  queryHotels: function(successCallback, errorCallback) {
    exec(successCallback, errorCallback, 'HotelLister', 'queryHotels');
  },
  // end::query-hotels[]
};

module.exports = hotelLister;