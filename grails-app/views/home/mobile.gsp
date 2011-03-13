<!doctype html>
<html>
    <head>
		<meta charset="UTF-8"> 
		<meta name="viewport" content="user-scalable=no, width=device-width">
        <title>Redes wifi cercanas</title>
		<g:javascript library="application" />
		<style type="text/css" media="screen"> 
					body, html, div, p {
						margin:0; padding:0;
					}
					body, html {
						font-family: Helvetica;
						text-align:center;
					}
					h1{font-size:14px;}
					#home_map {
						width: 320px;
						height: 370px;
						margin: 0 auto;
					}
				</style>
    </head>
    <body>
            <h1>Redes wifi cercanas</h1>
			<div id="home_map"></div>
			<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
			<script type="text/javascript">
			  function geolocalize() {
				var center;
				if(navigator.geolocation) {
						navigator.geolocation.getCurrentPosition(function(position) {
						center = new google.maps.LatLng(
							position.coords.latitude,
							position.coords.longitude);
						var map = showMap(center);
						var marker = new google.maps.Marker({
													position: center,
													map: map,
													icon: "${resource(dir:'images',file:'local.png')}"
												});
					});
				}else{
					center = new google.maps.LatLng(41.580325775146484, -0.895686149597168);
					showMap(center);
				}
			}
				
			function showMap(center){
				
				var options = {zoom: 14,center: center,navigationControl: false,disableDefaultUI: true,mapTypeId: google.maps.MapTypeId.ROADMAP};
				var map = createGoogleMap("home_map",options);
				var geocoder = new google.maps.Geocoder();
				<g:each in="${wifis}" var="wifi">
				geocoder.geocode( { 'address': "${wifi?.city}, ${wifi.address}"}, function(results, status) {
						if (status == google.maps.GeocoderStatus.OK) {
							addMark(map ,results[0].geometry.location,'${wifi.place}', '${wifi.address} - ${wifi.place}');
						} else {
							alert("Geocode was not successful for the following reason: " + status);
					    }
				});
				</g:each>
				return map;
			  }
			  geolocalize();

			</script>
        </div>
    </body>
</html>
