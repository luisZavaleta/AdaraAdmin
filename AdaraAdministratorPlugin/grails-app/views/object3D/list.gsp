
<%@ page import="ajaguaradministration.Object3D" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'object3D.label', default: 'Object3D')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'object3D.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="obj" title="${message(code: 'object3D.obj.label', default: 'Obj')}" />
                        
                            <g:sortableColumn property="mtl" title="${message(code: 'object3D.mtl.label', default: 'Mtl')}" />
                        
                            <g:sortableColumn property="img" title="${message(code: 'object3D.img.label', default: 'Img')}" />
                        
                            <g:sortableColumn property="imageExtension" title="${message(code: 'object3D.imageExtension.label', default: 'Image Extension')}" />
                        
                            <g:sortableColumn property="baseURL" title="${message(code: 'object3D.baseURL.label', default: 'Base URL')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${object3DInstanceList}" status="i" var="object3DInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${object3DInstance.id}">${fieldValue(bean: object3DInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: object3DInstance, field: "obj")}</td>
                        
                            <td>${fieldValue(bean: object3DInstance, field: "mtl")}</td>
                        
                            <td>${fieldValue(bean: object3DInstance, field: "img")}</td>
                        
                            <td>${fieldValue(bean: object3DInstance, field: "imageExtension")}</td>
                        
                            <td>${fieldValue(bean: object3DInstance, field: "baseURL")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${object3DInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
