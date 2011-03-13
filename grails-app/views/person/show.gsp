
<%@ page import="example.Wifi" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
		<div class="nav">
            <span class="menuButton"></span>
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
                            <td valign="top" class="name"><g:message code="person.username.label" default="Username" /></td>
                            
                            <td valign="top" class="value">@${fieldValue(bean: person, field: "username")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.avatar.label" default="Avatar" /></td>
                            
                            <td valign="top" class="value"><img src="${fieldValue(bean: person, field: 'avatar')}"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.web.label" default="Web" /></td>
                            
                            <td valign="top" class="value"><a href="${fieldValue(bean: person, field: "web")}">${fieldValue(bean: person, field: "web")}</a></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="person.description.label" default="description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: person, field: "description")}</td>
                            
                        </tr>
						<tr class="prop">
							
                            <td valign="top" class="name">Wifi points</td>
                            
                            <td valign="top" class="value">
								<g:include controller="person" action="likes" id="${person.id}"/>
                            </td>
                            
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
