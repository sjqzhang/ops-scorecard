<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
        <meta name="guideitem" content="process"/>
    <title>Inventory: Edit ServiceManagementProcess</title>
</head>
<body>

<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${serviceManagementProcess}">
        <div class="errors">
            <g:renderErrors bean="${serviceManagementProcess}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form method="post">
        <input type="hidden" name="id" value="${serviceManagementProcess?.id}"/>
        <div class="buttons">
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
        </div>
    </g:form>
    <g:form method="post">
        <input type="hidden" name="id" value="${serviceManagementProcess?.id}"/>
        <div class="dialog">
            <div class="formtitle">Edit Process</div>
            <table>
                <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="name">Name:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: serviceManagementProcess, field: 'name', 'errors')}">
                            <input type="text" id="name" name="name" value="${fieldValue(bean: serviceManagementProcess, field: 'name')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="description">Description:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: serviceManagementProcess, field: 'description', 'errors')}">
                            <input type="text" id="description" name="description" value="${fieldValue(bean: serviceManagementProcess, field: 'description')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="category">Category:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: serviceManagementProcess, field: 'category', 'errors')}">
                            <g:select id="category" name="category" from="${serviceManagementProcess.constraints.category.inList}" value="${serviceManagementProcess.category}"></g:select>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="service">Service:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: serviceManagementProcess, field: 'service', 'errors')}">
                            <select name="service.id" id="service.id">
                                <g:each in="${Service.list()}" var="taretgetResource">
                                    <option value="${taretgetResource.id}">${taretgetResource?.name} [${taretgetResource?.type?.name}]</option>
                                </g:each>
                            </select>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="automationLevel">Automation Level:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: serviceManagementProcess, field: 'automationLevel', 'errors')}">
                            <g:select id="automationLevel" name="automationLevel" from="${serviceManagementProcess.constraints.automationLevel.inList}" value="${serviceManagementProcess.automationLevel}"></g:select>
                        </td>
                    </tr>
                    <g:if test="${'semi'.equals(serviceManagementProcess?.automationLevel) || 'full'.equals(serviceManagementProcess?.automationLevel)}">

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="automationTool">Automation Tool:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: serviceManagementProcess, field: 'automationTool', 'errors')}">
                                <input type="text" id="automationTool" name="automationTool" value="${fieldValue(bean: serviceManagementProcess, field: 'automationTool')}"/>
                            </td>
                        </tr>
                    </g:if>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="syscontrol">System Control:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: serviceManagementProcess, field: 'syscontrol', 'errors')}">
                            <g:select id="syscontrol" name="syscontrol" from="${serviceManagementProcess.constraints.syscontrol.inList}" value="${serviceManagementProcess.syscontrol}"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="artifactType">Artifact Type:</label>
                        </td>

                        <td valign="top" class="value ${hasErrors(bean: serviceManagementProcess, field: 'artifactType', 'errors')}">
                            <g:set var="artifactTypes" value="${ResourceType.findAllByMetatype('artifact')}"/>
                            <g:if test="${artifactTypes}">
                                <g:select optionKey="id" from="${artifactTypes}" name="artifactType.id" value="${serviceManagementProcess?.artifactType?.id}"></g:select>
                            </g:if>
                            <g:else>
                                <g:link action="create" params="[metatype:'artifact']" controller="resourceType">Define a type</g:link>
                            </g:else>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="notificationRecipients">Notification Recipients:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: serviceManagementProcess, field: 'notificationRecipients', 'errors')}">

                            <ul>
                                <g:each var="n" in="${serviceManagementProcess?.notificationRecipients?}">
                                    <li><g:link controller="user" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
                                </g:each>
                            </ul>
                            <g:link controller="user" params="['serviceManagementProcess.id':serviceManagementProcess?.id]" action="create">Add User</g:link>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="implementor">Implementor team:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: serviceManagementProcess, field: 'implementor', 'errors')}">
                            <g:select optionKey="id" from="${Usergroup.list()}" name="implementor.id" value="${serviceManagementProcess?.implementor?.id}"></g:select>
                        </td>
                    </tr>


                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="recipient">Recipient team:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: serviceManagementProcess, field: 'recipient', 'errors')}">
                            <g:select optionKey="id" from="${Usergroup.list()}" name="recipient.id" value="${serviceManagementProcess?.recipient?.id}" noSelection="['null':'']"></g:select>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="procedure">Procedure:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: serviceManagementProcess, field: 'procedure', 'errors')}">
                            <g:textArea type="text" name="procedure" value="${fieldValue(bean:serviceManagementProcess,field:'procedure')}"/>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="buttons">
                <span class="button"><g:actionSubmit  value="Update"/></span>
                <span class="button"><g:actionSubmit action="list" value="Cancel"/></span>
            </div>
        </div>

    </g:form>
</div>

</body>
</html>
