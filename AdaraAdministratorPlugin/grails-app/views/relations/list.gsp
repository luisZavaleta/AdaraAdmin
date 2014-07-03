
<%@ page import="ajaguaradministration.Relations" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'relations.label', default: 'Relations')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'relations.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="latitude" title="${message(code: 'relations.latitude.label', default: 'Latitude')}" />
                        
                            <g:sortableColumn property="longitude" title="${message(code: 'relations.longitude.label', default: 'Longitude')}" />
                        
                            <g:sortableColumn property="altitude" title="${message(code: 'relations.altitude.label', default: 'Altitude')}" />
                        
                            <th><g:message code="relations._3DObject.label" default="3 DO bject" /></th>
                        
                            <th><g:message code="relations.marker.label" default="Marker" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${relationsInstanceList}" status="i" var="relationsInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${relationsInstance.id}">${fieldValue(bean: relationsInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: relationsInstance, field: "latitude")}</td>
                        
                            <td>${fieldValue(bean: relationsInstance, field: "longitude")}</td>
                        
                            <td>${fieldValue(bean: relationsInstance, field: "altitude")}</td>
                        
                            <td>${fieldValue(bean: relationsInstance, field: "_3DObject")}</td>
                        
                            <td>${fieldValue(bean: relationsInstance, field: "marker")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${relationsInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
