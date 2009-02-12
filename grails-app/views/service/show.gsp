<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="service"/>
    <title>Inventory: Service: ${service?.name}</title>
</head>
<body >
<script type="text/javascript">
        Event.observe(window,'load', function(e){ onLoad(); });
        Event.observe(window,'resize', function(e){ onResize(); });
</script>
<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="buttons">
        <g:form>
            <input type="hidden" name="id" value="${service?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
            <span class="button"><g:actionSubmit class="list" value="List"/></span>
        </g:form>
    </div>
    <div class="view service">
        <div class="header service">
            <g:render template="service_header" model="[service:service]"/>
        </div>
        <div class="section">
            <g:if test="${service.goals}">
                <img src="${createLinkTo(dir:'images/skin',file:'tick.png')}" width="16px" height="16px"/>
                Service Goals Are Set
                <g:link class="edit link action" action="editGoals" id="${service.id}" title="Edit Service Goals">Edit</g:link>
            </g:if>
            <g:else>
                No Service Goals Set
                <g:link class="create link action" action="editGoals" id="${service.id}" title="Add Service Goals">Add Goals</g:link>
            </g:else>
        </div>
        <table>
            <tbody>
                <tr class="prop">
                    <td valign="top" class="name ${!service?.status ? 'empty' : ''}">Status:</td>

                    <td valign="top" class="value">${fieldValue(bean: service, field: 'status')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!service?.function ? 'empty' : ''}">Function:</td>

                    <td valign="top" class="value">${fieldValue(bean: service, field: 'function')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!service?.customer ? 'empty' : ''}">Customer:</td>

                    <td valign="top" class="value"><g:link controller="user" action="show" id="${service?.customer?.id}">${service?.customer?.encodeAsHTML()}</g:link></td>

                </tr>


                <tr class="prop">
                    <td valign="top" class="name ${!service?.serviceURL ? 'empty' : ''}">Service URL:</td>

                    <td valign="top" class="value">
                        <g:if test="${service?.serviceURL}">
                            <g:link href="${service.serviceURL}">${service.serviceURL}</g:link>
                        </g:if>
                    </td>

                </tr>


                <tr class="prop">
                    <td valign="top" class="name ${!service?.ownerResponsible ? 'empty' : ''}">Owner Responsible:</td>

                    <td valign="top" class="value"><g:link controller="user" action="show" id="${service?.ownerResponsible?.id}">${service?.ownerResponsible?.encodeAsHTML()}</g:link></td>

                </tr>


                <tr class="prop">
                    <td valign="top" class="name ${!service?.nextMaintenanceWindow ? 'empty' : ''}">Next Maintenance Window:</td>

                    <td valign="top" class="value">
                        <g:relativeDate atDate="${service?.nextMaintenanceWindow}" />
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!service?.reprovisioningDuration ? 'empty' : ''}">Reprovisioning Duration:</td>

                    <td valign="top" class="value">${fieldValue(bean: service, field: 'reprovisioningDuration')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!service?.outageCost ? 'empty' : ''}">Hourly Outage Cost:</td>

                    <td valign="top" class="value">
                        <g:if test="${service?.outageCost}">
                            <g:formatNumber number="${new Integer(service?.outageCost)}" formatName="\$###,##0"/>
                        </g:if>
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!service?.dateAcquired ? 'empty' : ''}">Date Acquired:</td>

                    <td valign="top" class="value">
                        <g:relativeDate atDate="${service?.dateAcquired}"/>
                    </td>

                </tr>


                <tr class="prop">
                    <td valign="top" class="name ${!(service?.isFragile || service?.isMissionCritical || service?.isMonitored || service?.isRebuildable) ? 'empty' : ''}">Flags:</td>
                    <td class="value">
                        <g:render template="service_flags" model="[service:service]"/>
                    </td>
                </tr>

            </tbody>
        </table>
        <h3 class="section">Processes

            <span class="menuButton"><g:link class="create" action="create" controller="serviceManagementProcess"
                    params="['service.id':service.id]">New process</g:link></span>

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
        
        <h3 class="section">
            Availability Receipts
            <span class="menuButton"><g:link class="create" action="list" controller="availabilityReceipt"
                    params="['service.id':service.id,'createshow':true]">Create</g:link></span>
        </h3>

        <g:if test="${params?.showAllAvailReceipts && params?.showAllAvailReceipts=='1'}">
            <g:set var="availreceipts" value="${AvailabilityReceipt.findAllByService(service,[sort:'endDate',order:'desc'])}"/>
        </g:if>
        <g:else>
            <g:set var="availreceipts" value="${AvailabilityReceipt.findAllByService(service,[max:5,sort:'endDate',order:'desc'])}"/>
        </g:else>
        <g:if test="${availreceipts}">

                <g:render template="/availabilityReceipt/list" model="[availabilityReceiptList:availreceipts]"/>

            <div style="text-align:right;" class="section">
                <g:if test="${params?.showAllAvailReceipts && params?.showAllAvailReceipts=='1'}">
                    <g:link action="show" controller="service" id="${service.id}">See fewer receipts&hellip;</g:link>
                </g:if>
                <g:else>
                    <g:link action="show" controller="service" id="${service.id}" params="${[showAllAvailReceipts:'1']}">See all Availability receipts&hellip;</g:link>
                </g:else>
            </div>
        </g:if>
        <g:else>
            <div class="section">
                <div class="info note">
                    No Availability Receipts
                </div>
            </div>
        </g:else>



        <h3 class="section">Audits
            <span class="menuButton"><g:link class="create" action="create" controller="capabilityAudit"
                    params="['service.id':service.id]">New audit</g:link></span>
        </h3>
        <g:set var="audits" value="${CapabilityAudit.findAllByService(service)}"/>
        <g:if test="${audits}">
            <table>
                <thead>
                    <tr>
                    <th>Title</th>
                    <th>Date</th>
                    <th>Auditor</th>
                    <th>Score Average</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${audits}" var="audit">
                        <g:set var="scores" value="${audit.calculateScores()}"/>
                        <tr>
                            <td>
                                <g:link action="show" controller="capabilityAudit"
                                        id="${audit.id}">${audit.title}</g:link>
                            </td>
                            <td><g:relativeDate atDate="${audit.auditDate}"/></td>
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
</body>
</html>
