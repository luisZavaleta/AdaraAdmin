
<%@ page import="ajaguaradministration.Marker" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'marker.label', default: 'Marker')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'marker.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'marker.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="pattern" title="${message(code: 'marker.pattern.label', default: 'Pattern')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${markerInstanceList}" status="i" var="markerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${markerInstance.id}">${fieldValue(bean: markerInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: markerInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: markerInstance, field: "pattern")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${markerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
