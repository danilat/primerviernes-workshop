<html>
    <head>
        <title>Hola!!</title>
        <meta name="layout" content="main" />
        <style type="text/css" media="screen">

        #nav {
            margin-top:20px;
            margin-left:30px;
            width:228px;
            float:left;

        }
        .homePagePanel * {
            margin:0px;
        }
        .homePagePanel .panelBody ul {
            list-style-type:none;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody h1 {
            text-transform:uppercase;
            font-size:1.1em;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody {
            background: url(images/leftnav_midstretch.png) repeat-y top;
            margin:0px;
            padding:15px;
        }
        .homePagePanel .panelBtm {
            background: url(images/leftnav_btm.png) no-repeat top;
            height:20px;
            margin:0px;
        }

        .homePagePanel .panelTop {
            background: url(images/leftnav_top.png) no-repeat top;
            height:11px;
            margin:0px;
        }
        h2 {
            margin-top:15px;
            margin-bottom:15px;
            font-size:1.2em;
        }
        #pageBody {
            margin-left:280px;
            margin-right:20px;
        }
        </style>
    </head>
    <body>
		<div class="nav">
            <span class="menuButton"></span>
        </div>
        <div id="nav">
            <div class="homePagePanel">
                <div class="panelTop"></div>
                <div class="panelBody">
                    <g:include controller="person" action="last"/>
					<g:include controller="wifi" action="last"/>
					<g:link controller="wifi">Ver más puntos wifi</g:link> <g:if test="${session.person}">| <g:link controller="wifi" action="create">Añadir un punto wifi</g:link></g:if>
                </div>
                <div class="panelBtm"></div>
            </div>
        </div>
        <div id="pageBody">
            <h1>Hola!</h1>
			<div id="home_map" style="width:600px; height:600px"></div>
			<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
			<script type="text/javascript">
			  function initialize() {
				var center = new google.maps.LatLng(41.580325775146484, -0.895686149597168);
				var options = {zoom: 11,center: center,mapTypeId: google.maps.MapTypeId.ROADMAP};
				var map = createGoogleMap("home_map",options);
				var geocoder = new google.maps.Geocoder();
				
				<g:each in="${wifis}" var="wifi">
					
						addMark(map , new google.maps.LatLng(${wifi.lat}, ${wifi.lng}),'${wifi.place}', '<g:link controller="wifi" action="show" id="${wifi.id}">${wifi.address} - ${wifi.place}</g:link>');
				
				</g:each>
			  }
			  initialize();

			</script>
        </div>
    </body>
</html>
