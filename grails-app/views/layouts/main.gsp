<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="grailsLogo"><g:link controller="home"><img src="${resource(dir:'images',file:'logo.jpg')}" alt="Grails" border="0" /></g:link></div>
		<g:if test="${!session.person}">
		<g:oauthLink consumer='twitter' returnTo="[controller:'callback', action:'index']">
		Sign in using twitter
		</g:oauthLink>
		</g:if>
		<g:else>
			Hi <g:link controller="person" action="show" id="${session.person.id}">${session.person.username}</g:link>
		</g:else>
        <g:layoutBody />
    </body>
</html>