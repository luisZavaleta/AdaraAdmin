
<%@ page import="ajaguaradministration.Menu" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'menu.label', default: 'Menu')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'menu.id.label', default: 'Id')}" />
                        
                            <th><g:message code="menu.parentMenu.label" default="Parent Menu" /></th>
                        
                            <g:sortableColumn property="orden" title="${message(code: 'menu.orden.label', default: 'Orden')}" />
                        
                            <g:sortableColumn property="texto" title="${message(code: 'menu.texto.label', default: 'Texto')}" />
                        
                            <th><g:message code="menu.company.label" default="Company" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${menuInstanceList}" status="i" var="menuInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${menuInstance.id}">${fieldValue(bean: menuInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: menuInstance, field: "parentMenu.id")}</td>
                        
                            <td>${fieldValue(bean: menuInstance, field: "orden")}</td>
                        
                            <td>${fieldValue(bean: menuInstance, field: "texto")}</td>
                        
                            <td>${fieldValue(bean: menuInstance, field: "company.name")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${menuInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
