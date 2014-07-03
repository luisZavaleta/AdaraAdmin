
<%@ page import="ajaguaradministration.Localization" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'localization.label', default: 'Localization')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'localization.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="latitude" title="${message(code: 'localization.latitude.label', default: 'Latitude')}" />
                        
                            <g:sortableColumn property="longitude" title="${message(code: 'localization.longitude.label', default: 'Longitude')}" />
                        
                            <g:sortableColumn property="altitude" title="${message(code: 'localization.altitude.label', default: 'Altitude')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${localizationInstanceList}" status="i" var="localizationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${localizationInstance.id}">${fieldValue(bean: localizationInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: localizationInstance, field: "latitude")}</td>
                        
                            <td>${fieldValue(bean: localizationInstance, field: "longitude")}</td>
                        
                            <td>${fieldValue(bean: localizationInstance, field: "altitude")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${localizationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
