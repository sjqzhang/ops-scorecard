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
        </g:form>
    </div>
    <div class="dialog">

    <g:if test="${scores}">
      <g:render template="scores"/>
    </g:if>
        
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
                    <td valign="top" class="name">Targeted Service:</td>

                    <td valign="top" class="value"><g:link controller="service" action="show" id="${capabilityAudit?.targetedService?.id}">${capabilityAudit?.targetedService?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Historical Success Rating:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'historicalSuccessRating')}</td>

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
                    <td valign="top" class="name">Handoff Process:</td>

                    <td valign="top" class="value"><g:link controller="serviceManagementProcess" action="show" id="${capabilityAudit?.handoffProcess?.id}">${capabilityAudit?.handoffProcess?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Software Acceptance Process:</td>

                    <td valign="top" class="value"><g:link controller="serviceManagementProcess" action="show" id="${capabilityAudit?.softwareAcceptanceProcess?.id}">${capabilityAudit?.softwareAcceptanceProcess?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Ticket Service:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'ticketService')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Verifying Business Processes:</td>

                    <td valign="top" class="value"><g:link controller="serviceManagementProcess" action="show" id="${capabilityAudit?.verifyingBusinessProcesses?.id}">${capabilityAudit?.verifyingBusinessProcesses?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Implementation Process:</td>

                    <td valign="top" class="value"><g:link controller="serviceManagementProcess" action="show" id="${capabilityAudit?.implementationProcess?.id}">${capabilityAudit?.implementationProcess?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Escalation Process:</td>

                    <td valign="top" class="value"><g:link controller="serviceManagementProcess" action="show" id="${capabilityAudit?.escalationProcess?.id}">${capabilityAudit?.escalationProcess?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Backout Process:</td>

                    <td valign="top" class="value"><g:link controller="serviceManagementProcess" action="show" id="${capabilityAudit?.backoutProcess?.id}">${capabilityAudit?.backoutProcess?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Build Process:</td>

                    <td valign="top" class="value"><g:link controller="serviceManagementProcess" action="show" id="${capabilityAudit?.buildProcess?.id}">${capabilityAudit?.buildProcess?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Change Detection Process:</td>

                    <td valign="top" class="value"><g:link controller="serviceManagementProcess" action="show" id="${capabilityAudit?.changeDetectionProcess?.id}">${capabilityAudit?.changeDetectionProcess?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Release Engineers:</td>

                    <td valign="top" class="value"><g:link controller="usergroup" action="show" id="${capabilityAudit?.releaseEngineers?.id}">${capabilityAudit?.releaseEngineers?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Release Artifact:</td>

                    <td valign="top" class="value"><g:link controller="releaseArtifact" action="show" id="${capabilityAudit?.releaseArtifact?.id}">${capabilityAudit?.releaseArtifact?.encodeAsHTML()}</g:link></td>

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
                    <td valign="top" class="name">Impacted Resources:</td>

                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="i" in="${capabilityAudit.impactedResources}">
                                <li><g:link controller="resource" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Is Build Easier Than Repair:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'isBuildEasierThanRepair')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Number Times Implementation Process Run:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'numberTimesImplementationProcessRun')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Process Deviation Percentage:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'processDeviationPercentage')}</td>

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
