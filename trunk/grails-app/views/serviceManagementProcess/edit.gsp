

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Inventory: Edit ServiceManagementProcess</title>
    </head>
    <body>

        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${serviceManagementProcess}">
            <div class="errors">
                <g:renderErrors bean="${serviceManagementProcess}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${serviceManagementProcess?.id}" />
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                    <span class="button"><g:actionSubmit class="list" value="List" /></span>                    
                </div>
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceManagementProcess,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:serviceManagementProcess,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceManagementProcess,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:serviceManagementProcess,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="category">Category:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceManagementProcess,field:'category','errors')}">
                                    <g:select id="category" name="category" from="${serviceManagementProcess.constraints.category.inList}" value="${serviceManagementProcess.category}" ></g:select>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="targetResource">Target Service:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceManagementProcess,field:'targetResource','errors')}">
                                    <select name="targetResource.id" id="targetResource.id" >
                                        <option value="null"></option>
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
                                <td valign="top" class="value ${hasErrors(bean:serviceManagementProcess,field:'automationLevel','errors')}">
                                    <g:select id="automationLevel" name="automationLevel" from="${serviceManagementProcess.constraints.automationLevel.inList}" value="${serviceManagementProcess.automationLevel}" ></g:select>
                                </td>
                            </tr>
                              <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="syscontrol">System Control:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceManagementProcess,field:'syscontrol','errors')}">
                                    <g:select id="syscontrol" name="syscontrol" from="${serviceManagementProcess.constraints.syscontrol.inList}" value="${serviceManagementProcess.syscontrol}" ></g:select>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="artifacts">Artifacts:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceManagementProcess,field:'artifacts','errors')}">
                                    
<ul>
<g:each var="a" in="${serviceManagementProcess?.artifacts?}">
    <li><g:link controller="releaseArtifact" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="releaseArtifact" params="['serviceManagementProcess.id':serviceManagementProcess?.id]" action="create">Add ReleaseArtifact</g:link>

                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="notificationRecipients">Notification Recipients:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceManagementProcess,field:'notificationRecipients','errors')}">
                                    
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
                                    <label for="implementor">Implementor:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceManagementProcess,field:'implementor','errors')}">
                                    <g:select optionKey="id" from="${User.list()}" name="implementor.id" value="${serviceManagementProcess?.implementor?.id}" ></g:select>
                                </td>
                            </tr> 

                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="recipient">Recipient:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceManagementProcess,field:'recipient','errors')}">
                                    <g:select optionKey="id" from="${User.list()}" name="recipient.id" value="${serviceManagementProcess?.recipient?.id}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr> 
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="procedure">Procedure:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceManagementProcess,field:'procedure','errors')}">
                                    <g:textArea type="text" name="procedure" value="${fieldValue(bean:serviceManagementProcess,field:'procedure')}" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </g:form>
        </div>
     <div class="sidebar">
            <g:render template="sidebar"/>
        </div>
    </body>
</html>
