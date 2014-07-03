

<%@ page import="ajaguaradministration.Device" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'device.label', default: 'Device')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${deviceInstance}">
            <div class="errors">
                <g:renderErrors bean="${deviceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="model"><g:message code="device.model.label" default="Model" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deviceInstance, field: 'model', 'errors')}">
                                    <g:textField name="model" value="${deviceInstance?.model}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="os"><g:message code="device.os.label" default="Os" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deviceInstance, field: 'os', 'errors')}">
                                    <g:select name="os.id" from="${ajaguaradministration.OS.list()}" optionKey="id" value="${deviceInstance?.os?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="widthScreen"><g:message code="device.widthScreen.label" default="Width Screen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deviceInstance, field: 'widthScreen', 'errors')}">
                                    <g:textField name="widthScreen" value="${fieldValue(bean: deviceInstance, field: 'widthScreen')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="heightScreen"><g:message code="device.heightScreen.label" default="Height Screen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deviceInstance, field: 'heightScreen', 'errors')}">
                                    <g:textField name="heightScreen" value="${fieldValue(bean: deviceInstance, field: 'heightScreen')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="camera"><g:message code="device.camera.label" default="Camera" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deviceInstance, field: 'camera', 'errors')}">
                                    <g:checkBox name="camera" value="${deviceInstance?.camera}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="minRequiremensServer"><g:message code="device.minRequiremensServer.label" default="Min Requiremens Server" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deviceInstance, field: 'minRequiremensServer', 'errors')}">
                                    <g:checkBox name="minRequiremensServer" value="${deviceInstance?.minRequiremensServer}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tested"><g:message code="device.tested.label" default="Tested" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: deviceInstance, field: 'tested', 'errors')}">
                                    <g:checkBox name="tested" value="${deviceInstance?.tested}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
