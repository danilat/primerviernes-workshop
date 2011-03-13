<h1>Last users</h1>
<ul>
	<g:each in="${users}" var="user">
    <li><g:link controller="person" action="show" id="${user.id}">${user.username}</g:link></li>
	</g:each>
</ul>