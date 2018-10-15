var exec = require('cordova/exec');

var hotelLister = {
  queryHotels: function(successCallback, errorCallback) {
    exec(successCallback, errorCallback, 'HotelFinderPlugin', 'queryHotels');
  },
};

module.exports = hotelLister;