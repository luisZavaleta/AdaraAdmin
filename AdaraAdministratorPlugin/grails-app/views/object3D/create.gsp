

<%@ page import="ajaguaradministration.Object3D" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'object3D.label', default: 'Object3D')}" />
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
            <g:hasErrors bean="${object3DInstance}">
            <div class="errors">
                <g:renderErrors bean="${object3DInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save"  enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="obj"><g:message code="object3D.obj.label" default="Obj" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: object3DInstance, field: 'obj', 'errors')}">
                                    <input type="file" id="obj" name="obj" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mtl"><g:message code="object3D.mtl.label" default="Mtl" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: object3DInstance, field: 'mtl', 'errors')}">
                                    <input type="file" id="mtl" name="mtl" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="img"><g:message code="object3D.img.label" default="Img" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: object3DInstance, field: 'img', 'errors')}">
                                    <input type="file" id="img" name="img" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="imageExtension"><g:message code="object3D.imageExtension.label" default="Image Extension" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: object3DInstance, field: 'imageExtension', 'errors')}">
                                    <g:textField name="imageExtension" value="${object3DInstance?.imageExtension}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="baseURL"><g:message code="object3D.baseURL.label" default="Base URL" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: object3DInstance, field: 'baseURL', 'errors')}">
                                    <g:textField name="baseURL" value="${object3DInstance?.baseURL}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="baseFileName"><g:message code="object3D.baseFileName.label" default="Base File Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: object3DInstance, field: 'baseFileName', 'errors')}">
                                    <g:textField name="baseFileName" value="${object3DInstance?.baseFileName}" />
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
