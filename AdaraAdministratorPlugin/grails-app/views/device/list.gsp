
<%@ page import="ajaguaradministration.Device" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'device.label', default: 'Device')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'device.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="model" title="${message(code: 'device.model.label', default: 'Model')}" />
                        
                            <th><g:message code="device.os.label" default="Os" /></th>
                        
                            <g:sortableColumn property="widthScreen" title="${message(code: 'device.widthScreen.label', default: 'Width Screen')}" />
                        
                            <g:sortableColumn property="heightScreen" title="${message(code: 'device.heightScreen.label', default: 'Height Screen')}" />
                        
                            <g:sortableColumn property="camera" title="${message(code: 'device.camera.label', default: 'Camera')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${deviceInstanceList}" status="i" var="deviceInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${deviceInstance.id}">${fieldValue(bean: deviceInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: deviceInstance, field: "model")}</td>
                        
                            <td>${fieldValue(bean: deviceInstance, field: "os")}</td>
                        
                            <td>${fieldValue(bean: deviceInstance, field: "widthScreen")}</td>
                        
                            <td>${fieldValue(bean: deviceInstance, field: "heightScreen")}</td>
                        
                            <td><g:formatBoolean boolean="${deviceInstance.camera}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${deviceInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
