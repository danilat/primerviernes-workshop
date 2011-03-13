<ul>
<g:each in="${likes}" var="like">
	<li><g:link controller="wifi" action="show" id="${like.wifi.id}">${like.wifi.place} - ${like.wifi.address} - ${like.wifi.city}</g:link></li>
</g:each>
</ul>