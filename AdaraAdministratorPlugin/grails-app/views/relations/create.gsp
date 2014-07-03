

<%@ page import="ajaguaradministration.Relations" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'relations.label', default: 'Relations')}" />
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
            <g:hasErrors bean="${relationsInstance}">
            <div class="errors">
                <g:renderErrors bean="${relationsInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="latitude"><g:message code="relations.latitude.label" default="Latitude" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relationsInstance, field: 'latitude', 'errors')}">
                                    <g:textField name="latitude" value="${fieldValue(bean: relationsInstance, field: 'latitude')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="longitude"><g:message code="relations.longitude.label" default="Longitude" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relationsInstance, field: 'longitude', 'errors')}">
                                    <g:textField name="longitude" value="${fieldValue(bean: relationsInstance, field: 'longitude')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="altitude"><g:message code="relations.altitude.label" default="Altitude" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relationsInstance, field: 'altitude', 'errors')}">
                                    <g:textField name="altitude" value="${fieldValue(bean: relationsInstance, field: 'altitude')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="_3DObject"><g:message code="relations._3DObject.label" default="3 DO bject" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relationsInstance, field: '_3DObject', 'errors')}">
                                    <g:select noSelection="${['null':'Selecciona uno...']}" name="_3DObject.id" from="${ajaguaradministration.Object3D.list()}" optionKey="id" value="${relationsInstance?._3DObject?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="marker"><g:message code="relations.marker.label" default="Marker" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relationsInstance, field: 'marker', 'errors')}">
                                    <g:select noSelection="${['null':'Selecciona uno...']}" name="marker.id" from="${ajaguaradministration.Marker.list()}" optionKey="id" value="${relationsInstance?.marker?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="menu"><g:message code="relations.menu.label" default="Menu" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relationsInstance, field: 'menu', 'errors')}">
                                    <g:select noSelection="${['null':'Selecciona uno...']}" name="menu.id" from="${ajaguaradministration.Menu.list()}" optionKey="id" value="${relationsInstance?.menu?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user"><g:message code="relations.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: relationsInstance, field: 'user', 'errors')}">
                                    <g:select noSelection="${['null':'Selecciona uno...']}"  name="user.id" from="${ajaguaradministration.User.list()}" optionKey="id" value="${relationsInstance?.user?.id}"  />
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
