
<%@ page import="example.Wifi" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'wifi.label', default: 'Wifi')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="wifi.place.label" default="Place" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: wifiInstance, field: "place")}, ${fieldValue(bean: wifiInstance, field: "likesCounter")} likes
							<g:form controller="wifi" action="like" id="${wifiInstance.id}">
								<input type="submit" value="I like!"/>
							</g:form>
							</td>
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="wifi.ssid.label" default="Ssid" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: wifiInstance, field: "ssid")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="wifi.address.label" default="Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: wifiInstance, field: "address")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="wifi.city.label" default="City" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: wifiInstance, field: "city")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="wifi.password.label" default="Password" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: wifiInstance, field: "password")}</td>
                            
                        </tr>

						<tr class="prop">
                            <td valign="top" class="name"></td>
                            
                            <td valign="top" class="value">
                            	<div id="map_canvas" style="width:400px; height:300px"></div>
								<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
								<script type="text/javascript">
								  function initialize() {
									//var latltng = new google.maps.LatLng(${wifiInstance?.lat}, ${wifiInstance?.lng});
									
									
									var address = "${wifiInstance?.city}, ${wifiInstance.address}";
									var geocoder = new google.maps.Geocoder();
									geocoder.geocode( { 'address': address}, function(results, status) {
									      if (status == google.maps.GeocoderStatus.OK) {
											var options = {zoom: 13,center: results[0].geometry.location,mapTypeId: google.maps.MapTypeId.ROADMAP};
									        var map = createGoogleMap("map_canvas",options);
											addMark(map ,results[0].geometry.location,'${wifiInstance.place}', '${wifiInstance.address} - ${wifiInstance.place}');
									      } else {
									        alert("Geocode was not successful for the following reason: " + status);
									      }
									});
								  }
								  initialize();

								</script>
                            </td>
                            
                        </tr>

						<tr class="prop">
                            <td valign="top" class="name"><g:message code="wifi.creator.label" default="Created by" /></td>
                            
                            <td valign="top" class="value"><g:link controller="person" action="show" id="${wifiInstance.creator?.id}">${fieldValue(bean: wifiInstance.creator, field: "username")}</g:link></td>
                            
                        </tr>
						<g:if test="${session.person}">
						<tr class="prop">
                            <td valign="top" class="name">Send to a friend</td>
                            
                            <td valign="top" class="value">
								<g:form controller="wifi" action="share" id="${wifiInstance.id}">
									<input type="text" name="email"/>
									<input type="submit" value="enviar">
								</g:form>
							</td>
                            
                        </tr>
						</g:if>
                    
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
