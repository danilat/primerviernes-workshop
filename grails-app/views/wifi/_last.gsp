<h1>Last Wifi points</h1>
<ul>
    <g:each in="${wifis}" var="wifi">
    <li><g:link controller="wifi" action="show" id="${wifi.id}">${wifi.place} - ${wifi.city}</g:link></li>
	</g:each>
	
</ul>