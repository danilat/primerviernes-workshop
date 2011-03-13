

<%@ page import="example.Wifi" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'wifi.label', default: 'Wifi')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${wifiInstance}">
            <div class="errors">
                <g:renderErrors bean="${wifiInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${wifiInstance?.id}" />
                <g:hiddenField name="version" value="${wifiInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="place"><g:message code="wifi.place.label" default="Place" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: wifiInstance, field: 'place', 'errors')}">
                                    <g:textField name="place" value="${wifiInstance?.place}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ssid"><g:message code="wifi.ssid.label" default="Ssid" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: wifiInstance, field: 'ssid', 'errors')}">
                                    <g:textField name="ssid" value="${wifiInstance?.ssid}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="address"><g:message code="wifi.address.label" default="Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: wifiInstance, field: 'address', 'errors')}">
                                    <g:textField name="address" value="${wifiInstance?.address}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="city"><g:message code="wifi.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: wifiInstance, field: 'city', 'errors')}">
                                    <g:textField name="city" value="${wifiInstance?.city}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="password"><g:message code="wifi.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: wifiInstance, field: 'password', 'errors')}">
                                    <g:textField name="password" value="${wifiInstance?.password}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
