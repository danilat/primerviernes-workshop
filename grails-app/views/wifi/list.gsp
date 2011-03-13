
<%@ page import="example.Wifi" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'wifi.label', default: 'Wifi')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'wifi.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="place" title="${message(code: 'wifi.place.label', default: 'Place')}" />
                        
                            <g:sortableColumn property="ssid" title="${message(code: 'wifi.ssid.label', default: 'Ssid')}" />
                        
                            <g:sortableColumn property="address" title="${message(code: 'wifi.address.label', default: 'Address')}" />
                        
                            <g:sortableColumn property="city" title="${message(code: 'wifi.city.label', default: 'City')}" />
                        
                            <g:sortableColumn property="password" title="${message(code: 'wifi.password.label', default: 'Password')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${wifiInstanceList}" status="i" var="wifiInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${wifiInstance.id}">${fieldValue(bean: wifiInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: wifiInstance, field: "place")}</td>
                        
                            <td>${fieldValue(bean: wifiInstance, field: "ssid")}</td>
                        
                            <td>${fieldValue(bean: wifiInstance, field: "address")}</td>
                        
                            <td>${fieldValue(bean: wifiInstance, field: "city")}</td>
                        
                            <td>${fieldValue(bean: wifiInstance, field: "password")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${wifiInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
