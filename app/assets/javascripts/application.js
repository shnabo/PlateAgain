// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require gmaps/google
//= require underscore

var currgeocoder;
navigator.geolocation.getCurrentPosition(function(position, html5Error) {
     geo_loc = processGeolocationResult(position);
     currLatLong = geo_loc.split(",");
     initializeCurrent(currLatLong[0], currLatLong[1]);
     users_latitude = currLatLong[0];
     users_longitude = currLatLong[1];
});

//Get geo location result
function processGeolocationResult(position) {
     html5Lat = position.coords.latitude; //Get latitude
     html5Lon = position.coords.longitude; //Get longitude
     html5TimeStamp = position.timestamp; //Get timestamp
     html5Accuracy = position.coords.accuracy; //Get accuracy in meters
     return (html5Lat).toFixed(8) + ", " + (html5Lon).toFixed(8);
}

//Check value is present or not & call google api function
function initializeCurrent(latcurr, longcurr) {
     currgeocoder = new google.maps.Geocoder();
     console.log(latcurr + "-- ######## --" + longcurr);

     if (latcurr != '' && longcurr != '') {
         var myLatlng = new google.maps.LatLng(latcurr, longcurr);
     }
}

//Get current address
function getCurrentAddress(location) {
	currgeocoder.geocode({
		'location': location
	}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			$("#address").html(results[0].formatted_address);
		} else {
			alert('Geocode was not successful for the following reason: ' + status);
		}
	});
}
</script>
