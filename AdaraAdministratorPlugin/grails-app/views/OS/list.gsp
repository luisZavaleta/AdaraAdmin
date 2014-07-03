
<%@ page import="ajaguaradministration.OS" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'OS.label', default: 'OS')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'OS.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'OS.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="supported" title="${message(code: 'OS.supported.label', default: 'Supported')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${OSInstanceList}" status="i" var="OSInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${OSInstance.id}">${fieldValue(bean: OSInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: OSInstance, field: "name")}</td>
                        
                            <td><g:formatBoolean boolean="${OSInstance.supported}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${OSInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
