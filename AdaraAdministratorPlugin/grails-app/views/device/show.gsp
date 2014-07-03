
<%@ page import="ajaguaradministration.Device" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'device.label', default: 'Device')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="device.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: deviceInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="device.model.label" default="Model" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: deviceInstance, field: "model")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="device.os.label" default="Os" /></td>
                            
                            <td valign="top" class="value"><g:link controller="OS" action="show" id="${deviceInstance?.os?.id}">${deviceInstance?.os?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="device.widthScreen.label" default="Width Screen" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: deviceInstance, field: "widthScreen")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="device.heightScreen.label" default="Height Screen" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: deviceInstance, field: "heightScreen")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="device.camera.label" default="Camera" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${deviceInstance?.camera}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="device.minRequiremensServer.label" default="Min Requiremens Server" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${deviceInstance?.minRequiremensServer}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="device.tested.label" default="Tested" /></td>
                            
                            <td valign="top" class="value"><g:formatBoolean boolean="${deviceInstance?.tested}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${deviceInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
