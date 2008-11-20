

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Inventory: Show Service</title>
    </head>
    <body>    
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${service?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
            <div class="dialog">
                <table>
                    <tbody>            
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:service, field:'name')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Type:</td>
                            
                            <td valign="top" class="value"><g:link controller="resourceType" action="show" id="${service?.type?.id}">${service?.type?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:service, field:'description')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Status:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:service, field:'status')}</td>
                            
                        </tr>                                  
                    
                        <tr class="prop">
                            <td valign="top" class="name">Function:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:service, field:'function')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Owner Responsible:</td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${service?.ownerResponsible?.id}">${service?.ownerResponsible?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Acquired:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:service, field:'dateAcquired')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Next Maintenance Window:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:service, field:'nextMaintenanceWindow')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Ticket Numbers:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:service, field:'ticketNumbers')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Reprovisioning Duration:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:service, field:'reprovisioningDuration')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Outage Cost:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:service, field:'outageCost')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Customer:</td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${service?.customer?.id}">${service?.customer?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Service URL:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:service, field:'serviceURL')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Is Fragile:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:service, field:'isFragile')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Is Mission Critical:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:service, field:'isMissionCritical')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Is Monitored:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:service, field:'isMonitored')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Is Rebuildable:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:service, field:'isRebuildable')}</td>
                            
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
