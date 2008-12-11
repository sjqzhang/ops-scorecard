

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
    <meta name="guideitem" content="service"/>
        <title>Inventory: Edit Service</title>
    </head>
    <body>    
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${service}">
            <div class="errors">
                <g:renderErrors bean="${service}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${service.id}" />
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
            <g:form method="post" >
                <input type="hidden" name="id" value="${service.id}" />
                <div class="dialog">
                    <div class="formtitle">Edit Service</div>
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:service,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:service,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type">Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:service,field:'type','errors')}">
                                    <g:select optionKey="id" from="${ResourceType.findAllByMetatype('service')}" name="type.id" value="${service?.type?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:service,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:service,field:'description')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status">Status:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:service,field:'status','errors')}">
                                    <g:select id="status" name="status" from="${service.constraints.status.inList}" value="${service.status}" ></g:select>
                                </td>
                            </tr>                        
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="function">Function:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:service,field:'function','errors')}">
                                    <input type="text" id="function" name="function" value="${fieldValue(bean:service,field:'function')}"/>
                                </td>
                            </tr> 


                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="customer">Customer:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:service,field:'customer','errors')}">
                                    <g:select optionKey="id" from="${User.list()}" name="customer.id" value="${service?.customer?.id}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr>
                                                

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="serviceURL">Service URL:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:service,field:'serviceURL','errors')}">
                                    <input type="text" id="serviceURL" name="serviceURL" value="${fieldValue(bean:service,field:'serviceURL')}"/>
                                </td>
                            </tr>


                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ownerResponsible">Owner Responsible:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:service,field:'ownerResponsible','errors')}">
                                    <g:select optionKey="id" from="${User.list()}" name="ownerResponsible.id" value="${service?.ownerResponsible?.id}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateAcquired">Date Acquired:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:service,field:'dateAcquired','errors')}">
                                    <g:datePicker name="dateAcquired" value="${service?.dateAcquired}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nextMaintenanceWindow">Next Maintenance Window:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:service,field:'nextMaintenanceWindow','errors')}">
                                    <g:datePicker name="nextMaintenanceWindow" value="${service?.nextMaintenanceWindow}" noSelection="['':'']"></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ticketNumbers">Ticket Numbers:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:service,field:'ticketNumbers','errors')}">
                                    <input type="text" id="ticketNumbers" name="ticketNumbers" value="${fieldValue(bean:service,field:'ticketNumbers')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reprovisioningDuration">Reprovisioning Duration:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:service,field:'reprovisioningDuration','errors')}">
                                    <input type="text" id="reprovisioningDuration" name="reprovisioningDuration" value="${fieldValue(bean:service,field:'reprovisioningDuration')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="outageCost">Hourly Outage Cost:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:service,field:'outageCost','errors')}">
                                    <input type="text" id="outageCost" name="outageCost" value="${fieldValue(bean:service,field:'outageCost')}"/>
                                </td>
                            </tr> 

                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="isFragile">Is Fragile:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:service,field:'isFragile','errors')}">
                                    <g:checkBox name="isFragile" value="${service?.isFragile}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="isMissionCritical">Is Mission Critical:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:service,field:'isMissionCritical','errors')}">
                                    <g:checkBox name="isMissionCritical" value="${service?.isMissionCritical}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="isMonitored">Is Monitored:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:service,field:'isMonitored','errors')}">
                                    <g:checkBox name="isMonitored" value="${service?.isMonitored}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="isRebuildable">Is Rebuildable:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:service,field:'isRebuildable','errors')}">
                                    <g:checkBox name="isRebuildable" value="${service?.isRebuildable}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                    <div class="buttons">
                        <span class="button"><g:actionSubmit  value="Update" /></span>
                        <span class="button"><g:actionSubmit action="list" value="Cancel" /></span>
                    </div>
                </div>

            </g:form>
        </div>
        <div class="sidebar">
            <g:render template="sidebar"/>
     </div>
    </body>
</html>
