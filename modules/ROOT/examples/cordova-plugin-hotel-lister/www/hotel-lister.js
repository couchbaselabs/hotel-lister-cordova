var exec = require('cordova/exec');

var hotelLister = {
  queryHotels: function(successCallback, errorCallback) {
    exec(successCallback, errorCallback, 'HotelLister', 'queryHotels');
  },
};

module.exports = hotelLister;