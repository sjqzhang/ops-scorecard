

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <meta name="guideitem" content="process"/>
        <title>Inventory: Create ServiceManagementProcess</title>
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
            <g:form action="save" method="post" >
                <g:hiddenField name="service.id" value="${serviceManagementProcess.service.id}"/>
                <div class="dialog">

                    <div class="view">
                     <div class="header service">
                         <g:render template="/service/service_header" model="[service:serviceManagementProcess.service,showicon:true]"/>
                     </div>
                     </div>
                    
                    <div class="formtitle">
                        New Process
                    </div>

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
                                    <label for="automationLevel">Automation Level:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceManagementProcess,field:'automationLevel','errors')}">
                                    <g:select id="automationLevel" name="automationLevel" from="${serviceManagementProcess.constraints.automationLevel.inList}" value="${serviceManagementProcess.automationLevel}" ></g:select>
                                </td>
                            </tr>
                             <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="automationTool">Automation Tool:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceManagementProcess,field:'automationTool','errors')}">
                                    <input type="text" id="automationTool" name="automationTool" value="${fieldValue(bean:serviceManagementProcess,field:'automationTool')}"/>
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
                                    <label for="implementor">Implementor:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceManagementProcess,field:'implementor','errors')}">
                                    <g:select optionKey="id" from="${Usergroup.list()}" name="implementor.id" value="${serviceManagementProcess?.implementor?.id}" ></g:select>
                                </td>
                            </tr> 
         
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="recipient">Recipient:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceManagementProcess,field:'recipient','errors')}">
                                    <g:select optionKey="id" from="${Usergroup.list()}" name="recipient.id" value="${serviceManagementProcess?.recipient?.id}" noSelection="['null':'']"></g:select>
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
                    <div class="buttons">
                        <span class="button"><input  type="submit" value="Create" /></span>
                        <span class="button"><g:link action="show" controller="service"
                                id="${serviceManagementProcess?.service?.id}">Cancel</g:link></span>
                    </div>
                </div>

            </g:form>
        </div>
    </body>
</html>
