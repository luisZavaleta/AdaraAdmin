

<%@ page import="ajaguaradministration.Section" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'section.label', default: 'Section')}" />
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
            <g:hasErrors bean="${sectionInstance}">
            <div class="errors">
                <g:renderErrors bean="${sectionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="parentSection"><g:message code="section.parentSection.label" default="Parent Section" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sectionInstance, field: 'parentSection', 'errors')}">
                                    <g:select noSelection="${['null':'Selecciona uno...']}" name="parentSection.id" from="${ajaguaradministration.Section.list()}" optionKey="id" value="${sectionInstance?.parentSection?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nombre"><g:message code="section.nombre.label" default="Nombre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sectionInstance, field: 'nombre', 'errors')}">
                                    <g:textField name="nombre" value="${sectionInstance?.nombre}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="company"><g:message code="section.company.label" default="Company" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sectionInstance, field: 'company', 'errors')}">
                                    <g:select noSelection="${['null':'Selecciona uno...']}" name="company.id" from="${ajaguaradministration.Company.list()}" optionKey="id" value="${sectionInstance?.company?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="role"><g:message code="section.role.label" default="Role" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sectionInstance, field: 'role', 'errors')}">
                                    <g:select noSelection="${['null':'Selecciona uno...']}" name="role.id" from="${ajaguaradministration.Role.list()}" optionKey="id" value="${sectionInstance?.role?.id}"  />
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
