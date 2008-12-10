

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Inventory: Service: ${service?.name}</title>
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
                    <span class="button"><g:actionSubmit class="list" value="List" /></span>
                </g:form>
            </div>
            <div class="view service">
                <div class="header">
                    <span class="name"><g:link controller="service" action="show" id="${service?.id}">${service?.name}</g:link></span>
                    <span class="type">[<g:link controller="resourceType" action="show" id="${service?.type?.id}">${service?.type?.encodeAsHTML()}</g:link>]</span>
                    <span class="desc">${service?.description}</span>
                </div>
                <table>
                    <tbody>            
                        <tr class="prop">
                            <td valign="top" class="name ${!service?.status?'empty':''}">Status:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:service, field:'status')}</td>
                            
                        </tr>                                  
                    
                        <tr class="prop">
                            <td valign="top" class="name ${!service?.function?'empty':''}">Function:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:service, field:'function')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name ${!service?.ownerResponsible?'empty':''}">Owner Responsible:</td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${service?.ownerResponsible?.id}">${service?.ownerResponsible?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name ${!service?.dateAcquired?'empty':''}">Date Acquired:</td>
                            
                            <td valign="top" class="value">
                                <g:relativeDate elapsed="${service?.dateAcquired}" agoClass="ago acquired" untilClass="until acquired"/>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name ${!service?.nextMaintenanceWindow?'empty':''}">Next Maintenance Window:</td>
                            
                            <td valign="top" class="value">
                                <g:relativeDate elapsed="${service?.nextMaintenanceWindow}"  agoClass="ago maintenence" untilClass="until maintenence"/>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name ${!service?.ticketNumbers?'empty':''}">Ticket Numbers:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:service, field:'ticketNumbers')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name ${!service?.reprovisioningDuration?'empty':''}">Reprovisioning Duration:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:service, field:'reprovisioningDuration')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name ${!service?.outageCost?'empty':''}">Outage Cost:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:service, field:'outageCost')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name ${!service?.customer?'empty':''}">Customer:</td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${service?.customer?.id}">${service?.customer?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name ${!service?.serviceURL?'empty':''}">Service URL:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:service, field:'serviceURL')}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name ${!(service?.isFragile || service?.isMissionCritical || service?.isMonitored || service?.isRebuildable)?'empty':''}">Flags:</td>
                            <td class="value">
                                <g:if test="${service.isFragile}">
                                    <img src="${createLinkTo(dir:'images/skin',file:'tick.png')}" width="16px" height="16px"/>
                                    <b>Fragile</b>
                                </g:if>
                                <g:if test="${service.isMissionCritical}">
                                    <img src="${createLinkTo(dir:'images/skin',file:'tick.png')}" width="16px" height="16px"/>
                                    <b>Mission Critical</b>
                                </g:if>
                                <g:if test="${service.isMonitored}">
                                    <img src="${createLinkTo(dir:'images/skin',file:'tick.png')}" width="16px" height="16px"/>
                                    <b>Monitored</b>
                                </g:if>
                                <g:if test="${service.isRebuildable}">
                                    <img src="${createLinkTo(dir:'images/skin',file:'tick.png')}" width="16px" height="16px"/>
                                    <b>Rebuildable</b>
                                </g:if>
                            </td>
                        </tr>
                    
                           
                    </tbody>
                </table>
                <h3 class="section">Processes

                <span class="menuButton"><g:link class="create" action="create" controller="serviceManagementProcess"
                        params="['targetResource.id':service.id]">New process</g:link></span>
                </h3>


                <g:set var="processes" value="${ServiceManagementProcess.findAllByService(service)}"/>
                <g:if test="${processes}">
                    <g:render template="/serviceManagementProcess/list" model="[processes:processes]"/>
                </g:if>
                <g:else>
                    <div class="section">
                        <div class="info note">
                        No Processes
                        </div>
                    </div>
                </g:else>


                <h3 class="section">Audits
                    <span class="menuButton"><g:link class="create" action="create" controller="capabilityAudit"
                        params="['targetedService.id':service.id]">New audit</g:link></span>
                </h3>
                <g:set var="audits" value="${CapabilityAudit.findAllByService(service)}"/>
                <g:if test="${audits}">
                <table>
                    <thead>
                       <th>Title</th>
                        <th>Date</th>
                        <th>Auditor</th>
                        <th>Score Average</th>
                    </thead>
                    <tbody>
                    <g:each in="${audits}" var="audit">
                        <g:set var="scores" value="${audit.calculateScores()}"/>
                       <tr>
                           <td>
                           <g:link action="show" controller="capabilityAudit"
                           id="${audit.id}">${audit.title} </g:link>
                           </td>
                           <td>${audit.auditDate}</td>
                           <td>${audit.auditor.login}</td>
                           <td><g:prettyScore score="${scores['cumulative']}" format="numeric"/></td>
                           </tr>
                    </g:each>
                    </tbody>
                </table>
                </g:if>
                <g:else>
                    <div class="section">
                        <div class="info note">
                        No Audits 
                        </div>
                    </div>
                </g:else>


            </div>

        </div>
        <div class="sidebar">
            <g:render template="sidebar"/>
        </div>
    </body>
</html>
