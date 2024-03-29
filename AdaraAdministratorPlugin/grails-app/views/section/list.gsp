
<%@ page import="ajaguaradministration.Section" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'section.label', default: 'Section')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'section.id.label', default: 'Id')}" />
                        
                            <th><g:message code="section.parentSection.label" default="Parent Section" /></th>
                        
                            <g:sortableColumn property="nombre" title="${message(code: 'section.nombre.label', default: 'Nombre')}" />
                        
                            <th><g:message code="section.company.label" default="Company" /></th>
                        
                            <th><g:message code="section.role.label" default="Role" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sectionInstanceList}" status="i" var="sectionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${sectionInstance.id}">${fieldValue(bean: sectionInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: sectionInstance, field: "parentSection")}</td>
                        
                            <td>${fieldValue(bean: sectionInstance, field: "nombre")}</td>
                        
                            <td>${fieldValue(bean: sectionInstance, field: "company")}</td>
                        
                            <td>${fieldValue(bean: sectionInstance, field: "role")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${sectionInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
