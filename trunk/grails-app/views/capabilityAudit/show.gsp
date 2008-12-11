<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="audit"/>
    <title>Audit: Show CapabilityAudit</title>
</head>
<body>

<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="buttons">
        <g:form>
            <input type="hidden" name="id" value="${capabilityAudit?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
            <span class="button"><g:actionSubmit class="list" value="List"/></span>            
        </g:form>
    </div>
    <div class="view">
        <div class="header audit">
            <span class="name">${capabilityAudit?.title}</span>
            by
            <span class="author"><g:link controller="user" action="show" id="${capabilityAudit?.auditor?.id}">${capabilityAudit?.auditor?.encodeAsHTML()}</g:link></span>
            
            <span class="date"><g:relativeDate atDate="${capabilityAudit?.auditDate}" agoClass="ago audit" untilClass="until audit"/></span>
        </div>
        <h3>Service</h3>
        <div class="header service">
            <g:render template="/service/service_header" model="[service:capabilityAudit?.service]"/>
        </div>

        <h3>Control</h3>
        
        <table>
            <tbody>

                <tr class="prop">
                    <td valign="top" class="name ${!capabilityAudit?.changeCoordinator?'empty':''}">Change Coordinator:</td>

                    <td valign="top" class="value"><g:link controller="user" action="show" id="${capabilityAudit?.changeCoordinator?.id}">${capabilityAudit?.changeCoordinator?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!capabilityAudit?.changeOwner?'empty':''}">Change Owner:</td>

                    <td valign="top" class="value"><g:link controller="user" action="show" id="${capabilityAudit?.changeOwner?.id}">${capabilityAudit?.changeOwner?.encodeAsHTML()}</g:link></td>

                </tr>



                <tr class="prop">
                    <td valign="top" class="name ${!capabilityAudit?.ticketService?'empty':''}">Ticket Service:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'ticketService')}</td>

                </tr>



                <tr class="prop">
                    <td valign="top" class="name">Can Assess Change Impact Level:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'canAssessChangeImpactLevel')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Can Assess Change Outcome:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'canAssessChangeOutcome')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Can Assess Priority:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'canAssessPriority')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!capabilityAudit?.changeReviewers?'empty':''}">Change Reviewers:</td>

                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="c" in="${capabilityAudit.changeReviewers}">
                                <li><g:link controller="user" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Has Been Patched:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'hasBeenPatched')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Has Change Management Notes:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'hasChangeManagementNotes')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Has Motivating Reason:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'hasMotivatingReason')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Has Non Action Consequence:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'hasNonActionConsequence')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Has Planned End:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'hasPlannedEnd')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Has Planned Expected Benefit:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'hasPlannedExpectedBenefit')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Has Planned Start:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'hasPlannedStart')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Has Success Criteria:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'hasSuccessCriteria')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Has Worst Case Outage Duration:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'hasWorstCaseOutageDuration')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Has Worst Case Outcome:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'hasWorstCaseOutcome')}</td>

                </tr>



                <tr class="prop">
                    <td valign="top" class="name">Is Build Easier Than Repair:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'isBuildEasierThanRepair')}</td>

                </tr>



                <tr class="prop">
                    <td valign="top" class="name ${!capabilityAudit?.securityReviewers?'empty':''}">Security Reviewers:</td>

                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="s" in="${capabilityAudit.securityReviewers}">
                                <li><g:link controller="user" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!capabilityAudit?.stakeholders?'empty':''}">Stakeholders:</td>

                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="s" in="${capabilityAudit.stakeholders}">
                                <li><g:link controller="user" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>
            </tbody>
        </table>

        <h3>Process Coverage</h3>



                        <g:each in="${capabilityAudit.scorecards}" var="scorecard">
                            <h3 class="sub">
                                    ${scorecard.process.category}: <g:link action="show" controller="serviceManagementProcess" id="${scorecard.process.id}">${scorecard.process.name}</g:link>
                                    <span style="font-style:italic;font-weight:normal">${scorecard.process.description}</span>
                            </h3>

                                <table border="0">
                                   
                                    <g:each in="${ServiceManagementProcess.metrics.sort()}" var="metric">
                                        <tr>
                                            <td style="text-align:right;width:25px;">
                                                ${metric} 
                                            </td>
                                            <td style="width:15px;">                                                
                                                ${scorecard[metric].value}
                                            </td>
                                            <td>
                                                <g:if test="${scorecard[metric].comment}">
                                                    ${scorecard[metric].comment}
                                                </g:if>
                                                <g:else>
                                                    <span style="color:#666;font-style:italic;">No comments</span>
                                                </g:else>
                                            </td>
                                        </tr>
                                    </g:each>

                                </table>
                        </g:each>

    </div>

</div>
<div class="sidebar">
    <g:render template="sidebar"/>
</div>
</body>
</html>
