<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
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
    <div class="dialog">

        
        <table>
            <tbody>

                <tr class="prop">
                    <td valign="top" class="name">Id:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'id')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Title:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'title')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Auditor:</td>

                    <td valign="top" class="value"><g:link controller="user" action="show" id="${capabilityAudit?.auditor?.id}">${capabilityAudit?.auditor?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Audit Date:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'auditDate')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name"> Service:</td>

                    <td valign="top" class="value"><g:link controller="service" action="show" id="${capabilityAudit?.service?.id}">${capabilityAudit?.service?.encodeAsHTML()}</g:link></td>

                </tr>


                <tr class="prop">
                    <td valign="top" class="name">Change Coordinator:</td>

                    <td valign="top" class="value"><g:link controller="user" action="show" id="${capabilityAudit?.changeCoordinator?.id}">${capabilityAudit?.changeCoordinator?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Change Owner:</td>

                    <td valign="top" class="value"><g:link controller="user" action="show" id="${capabilityAudit?.changeOwner?.id}">${capabilityAudit?.changeOwner?.encodeAsHTML()}</g:link></td>

                </tr>



                <tr class="prop">
                    <td valign="top" class="name">Ticket Service:</td>

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
                    <td valign="top" class="name">Change Reviewers:</td>

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
                    <td valign="top" class="name">Security Reviewers:</td>

                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="s" in="${capabilityAudit.securityReviewers}">
                                <li><g:link controller="user" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Stakeholders:</td>

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
    </div>

</div>
<div class="sidebar">
    <g:render template="sidebar"/>
</div>
</body>
</html>
