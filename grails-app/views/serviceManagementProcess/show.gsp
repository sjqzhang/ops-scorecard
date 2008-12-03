

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
                    <span class="button"><g:actionSubmit class="list" value="List" /></span>

                </g:form>
            </div>
            <div class="dialog">
                <table>
                    <tbody>
                    
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
                            <td valign="top" class="name">Target Service:</td>
                            <td valign="top" class="value">
                                <g:link controller="resource" action="show" id="${serviceManagementProcess?.service?.id}">
                                    <g:if test="serviceManagementProcess?.service?.name">
                                        ${serviceManagementProcess?.service?.name}
                                    </g:if>
                                    <g:else>
                                        ${serviceManagementProcess?.service?.encodeAsHTML()}
                                    </g:else>
                                </g:link>
                            </td>
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name">Automation Level:</td>

                            <td valign="top" class="value">${fieldValue(bean:serviceManagementProcess, field:'automationLevel')}</td>

                        </tr>

                        <g:if test="${'semi'.equals(serviceManagementProcess?.automationLevel) || 'full'.equals(serviceManagementProcess?.automationLevel)}">
                        <tr class="prop">
                            <td valign="top" class="name">Automation Tool:</td>

                            <td valign="top" class="value">${fieldValue(bean:serviceManagementProcess, field:'automationTool')}</td>

                        </tr>
                        </g:if>
                        <tr class="prop">
                            <td valign="top" class="name">System Control:</td>

                            <td valign="top" class="value">${fieldValue(bean:serviceManagementProcess, field:'syscontrol')}</td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Artifact Type:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                              <g:link controller="resourceType" action="show" id="${serviceManagementProcess?.artifactType?.id}">
                                     ${serviceManagementProcess?.artifactType?.name}
                                </g:link>
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
                            <td valign="top" class="name">Implementor team:</td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${serviceManagementProcess?.implementor?.id}">${serviceManagementProcess?.implementor?.encodeAsHTML()}</g:link></td>
                            
                        </tr>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Recipient team:</td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${serviceManagementProcess?.recipient?.id}">${serviceManagementProcess?.recipient?.encodeAsHTML()}</g:link></td>
                            
                        </tr>

                         <tr class="prop">
                            <td valign="top" class="name">Procedure:</td>

                             <td valign="top" class="value">${fieldValue(bean:serviceManagementProcess, field:'procedure')}</td>

                        </tr>
                    
                    </tbody>
                </table>
            </div>

        </div>
     
    </body>
</html>
