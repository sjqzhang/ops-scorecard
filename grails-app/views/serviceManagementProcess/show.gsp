

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Inventory: Show ServiceManagementProcess</title>
    </head>
    <body>

        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${serviceManagementProcess?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:serviceManagementProcess, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:serviceManagementProcess, field:'name')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:serviceManagementProcess, field:'description')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Category:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:serviceManagementProcess, field:'category')}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Automation Level:</td>

                            <td valign="top" class="value">${fieldValue(bean:serviceManagementProcess, field:'automationLevel')}</td>

                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">System Control:</td>

                            <td valign="top" class="value">${fieldValue(bean:serviceManagementProcess, field:'syscontrol')}</td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Artifacts:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="a" in="${serviceManagementProcess.artifacts}">
                                    <li><g:link controller="releaseArtifact" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Notification Recipients:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="n" in="${serviceManagementProcess.notificationRecipients}">
                                    <li><g:link controller="user" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Implementor:</td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${serviceManagementProcess?.implementor?.id}">${serviceManagementProcess?.implementor?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Target Service:</td>
                            
                            <td valign="top" class="value"><g:link controller="resource" action="show" id="${serviceManagementProcess?.targetResource?.id}">${serviceManagementProcess?.targetResource?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Recipient:</td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${serviceManagementProcess?.recipient?.id}">${serviceManagementProcess?.recipient?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>

        </div>
     <div class="sidebar">
            <g:render template="sidebar"/>
        </div>
    </body>
</html>
