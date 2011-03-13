function createGoogleMap(id, options){
	var map = new google.maps.Map(document.getElementById(id), options);
	return map
}

function addMark(map, location, title, content){
	var marker = new google.maps.Marker({position: location, title: title});
	var infowindow = new google.maps.InfoWindow();
	google.maps.event.addListener(marker, 'click', function() {
				infowindow.setContent(content);
				infowindow.open(map,marker);
			});
	marker.setMap(map);
}