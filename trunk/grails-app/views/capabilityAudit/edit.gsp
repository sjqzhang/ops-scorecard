<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Audit: Edit CapabilityAudit</title>
</head>
<body>

<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${capabilityAudit}">
        <div class="errors">
            <g:renderErrors bean="${capabilityAudit}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form method="post">
        <input type="hidden" name="id" value="${capabilityAudit?.id}"/>
        <div class="buttons">
            <span class="button"><g:actionSubmit class="save" value="Update"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
            <span class="button"><g:actionSubmit class="list" value="List"/></span>
        </div>
        <div class="dialog">
            <h3>General</h3>
            <table>
                <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title">Title:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'title', 'errors')}">
                            <input type="text" id="title" name="title" value="${fieldValue(bean: capabilityAudit, field: 'title')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="auditor">Auditor:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'auditor', 'errors')}">
                            <g:select optionKey="id" from="${User.list()}" name="auditor.id" value="${capabilityAudit?.auditor?.id}"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="auditDate">Audit Date:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'auditDate', 'errors')}">
                            <g:datePicker name="auditDate" value="${capabilityAudit?.auditDate}"></g:datePicker>
                        </td>
                    </tr>
                </tbody>

            </table>
            <h3>Control</h3>
            <table>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="changeCoordinator">Change Coordinator:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'changeCoordinator', 'errors')}">
                        <g:select optionKey="id" from="${User.list()}" name="changeCoordinator.id" value="${capabilityAudit?.changeCoordinator?.id}" noSelection="['null':'']"></g:select>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="changeOwner">Change Owner:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'changeOwner', 'errors')}">
                        <g:select optionKey="id" from="${User.list()}" name="changeOwner.id" value="${capabilityAudit?.changeOwner?.id}" noSelection="['null':'']"></g:select>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="canAssessChangeImpactLevel">Can Assess Change Impact Level:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'canAssessChangeImpactLevel', 'errors')}">
                        <g:checkBox name="canAssessChangeImpactLevel" value="${capabilityAudit?.canAssessChangeImpactLevel}"></g:checkBox>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="canAssessChangeOutcome">Can Assess Change Outcome:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'canAssessChangeOutcome', 'errors')}">
                        <g:checkBox name="canAssessChangeOutcome" value="${capabilityAudit?.canAssessChangeOutcome}"></g:checkBox>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="canAssessPriority">Can Assess Priority:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'canAssessPriority', 'errors')}">
                        <g:checkBox name="canAssessPriority" value="${capabilityAudit?.canAssessPriority}"></g:checkBox>
                    </td>
                </tr>



                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="hasChangeManagementNotes">Has Change Management Notes:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'hasChangeManagementNotes', 'errors')}">
                        <g:checkBox name="hasChangeManagementNotes" value="${capabilityAudit?.hasChangeManagementNotes}"></g:checkBox>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="hasMotivatingReason">Has Motivating Reason:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'hasMotivatingReason', 'errors')}">
                        <g:checkBox name="hasMotivatingReason" value="${capabilityAudit?.hasMotivatingReason}"></g:checkBox>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="hasNonActionConsequence">Has Non Action Consequence:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'hasNonActionConsequence', 'errors')}">
                        <g:checkBox name="hasNonActionConsequence" value="${capabilityAudit?.hasNonActionConsequence}"></g:checkBox>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="hasPlannedEnd">Has Planned End:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'hasPlannedEnd', 'errors')}">
                        <g:checkBox name="hasPlannedEnd" value="${capabilityAudit?.hasPlannedEnd}"></g:checkBox>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="hasPlannedExpectedBenefit">Has Planned Expected Benefit:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'hasPlannedExpectedBenefit', 'errors')}">
                        <g:checkBox name="hasPlannedExpectedBenefit" value="${capabilityAudit?.hasPlannedExpectedBenefit}"></g:checkBox>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="hasPlannedStart">Has Planned Start:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'hasPlannedStart', 'errors')}">
                        <g:checkBox name="hasPlannedStart" value="${capabilityAudit?.hasPlannedStart}"></g:checkBox>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="hasSuccessCriteria">Has Success Criteria:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'hasSuccessCriteria', 'errors')}">
                        <g:checkBox name="hasSuccessCriteria" value="${capabilityAudit?.hasSuccessCriteria}"></g:checkBox>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="hasWorstCaseOutageDuration">Has Worst Case Outage Duration:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'hasWorstCaseOutageDuration', 'errors')}">
                        <g:checkBox name="hasWorstCaseOutageDuration" value="${capabilityAudit?.hasWorstCaseOutageDuration}"></g:checkBox>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="hasWorstCaseOutcome">Has Worst Case Outcome:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'hasWorstCaseOutcome', 'errors')}">
                        <g:checkBox name="hasWorstCaseOutcome" value="${capabilityAudit?.hasWorstCaseOutcome}"></g:checkBox>
                    </td>
                </tr>

            </table>
            <h3>Process</h3>

            <table>


                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="targetedService">Target Service:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'targetedService', 'errors')}">
                        <g:select optionKey="id" from="${Service.list()}" name="targetedService.id" value="${capabilityAudit?.targetedService?.id}" noSelection="['null':'']"></g:select>
                    </td>
                </tr>
                
                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="ticketService">Ticket Service:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'ticketService', 'errors')}">
                        <input type="text" id="ticketService" name="ticketService" value="${fieldValue(bean: capabilityAudit, field: 'ticketService')}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="verifyingBusinessProcesses">Verifying Business Processes:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'verifyingBusinessProcesses', 'errors')}">
                        <g:select optionKey="id" from="${ServiceManagementProcess.findAllByCategory('verification')}" name="verifyingBusinessProcesses.id" value="${capabilityAudit?.verifyingBusinessProcesses?.id}" noSelection="['null':'']"></g:select>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="implementationProcess">Implementation Process:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'implementationProcess', 'errors')}">
                        <g:select optionKey="id" from="${ServiceManagementProcess.findAllByCategory('implementation')}" name="implementationProcess.id" value="${capabilityAudit?.implementationProcess?.id}" noSelection="['null':'']"></g:select>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="escalationProcess">Escalation Process:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'escalationProcess', 'errors')}">
                        <g:select optionKey="id" from="${ServiceManagementProcess.findAllByCategory('escalation')}" name="escalationProcess.id" value="${capabilityAudit?.escalationProcess?.id}" noSelection="['null':'']"></g:select>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="backoutProcess">Backout Process:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'backoutProcess', 'errors')}">
                        <g:select optionKey="id" from="${ServiceManagementProcess.findAllByCategory('backout')}" name="backoutProcess.id" value="${capabilityAudit?.backoutProcess?.id}" noSelection="['null':'']"></g:select>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="historicalSuccessRating">Historical Success Rating:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'historicalSuccessRating', 'errors')}">
                        <g:select id="historicalSuccessRating" name="historicalSuccessRating" from="${capabilityAudit.constraints.historicalSuccessRating.inList}" value="${capabilityAudit.historicalSuccessRating}"></g:select>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="changeDetectionProcess">Detective Control Process:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'changeDetectionProcess', 'errors')}">
                        <g:select optionKey="id" from="${ServiceManagementProcess.findAllByCategory('detective')}" name="changeDetectionProcess.id" value="${capabilityAudit?.changeDetectionProcess?.id}" noSelection="['null':'']"></g:select>
                    </td>
                </tr>

            </table>
            <h3>Repeatability</h3>

            <table>
                <tbody>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="buildProcess">Build Process:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'buildProcess', 'errors')}">
                            <g:select optionKey="id" from="${ServiceManagementProcess.findAllByCategory('build')}" name="buildProcess.id" value="${capabilityAudit?.buildProcess?.id}" noSelection="['null':'']"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="releaseEngineers">Release Engineers:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'releaseEngineers', 'errors')}">
                            <g:select optionKey="id" from="${Usergroup.list()}" name="releaseEngineers.id" value="${capabilityAudit?.releaseEngineers?.id}" noSelection="['null':'']"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="releaseArtifact">Release Artifact:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'releaseArtifact', 'errors')}">
                            <g:select optionKey="id" from="${ReleaseArtifact.list()}" name="releaseArtifact.id" value="${capabilityAudit?.releaseArtifact?.id}" noSelection="['null':'']"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="softwareAcceptanceProcess">Software Acceptance Process:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'softwareAcceptanceProcess', 'errors')}">
                            <g:select optionKey="id" from="${ServiceManagementProcess.findAllByCategory('acceptance')}" name="softwareAcceptanceProcess.id" value="${capabilityAudit?.softwareAcceptanceProcess?.id}" noSelection="['null':'']"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="isBuildEasierThanRepair">Is Build Easier Than Repair:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'isBuildEasierThanRepair', 'errors')}">
                            <g:checkBox name="isBuildEasierThanRepair" value="${capabilityAudit?.isBuildEasierThanRepair}"></g:checkBox>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="hasBeenPatched">Has Been Patched:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'hasBeenPatched', 'errors')}">
                            <g:checkBox name="hasBeenPatched" value="${capabilityAudit?.hasBeenPatched}"></g:checkBox>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="numberTimesImplementationProcessRun">Number Times Implementation Process Run:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'numberTimesImplementationProcessRun', 'errors')}">
                            <input type="text" id="numberTimesImplementationProcessRun" name="numberTimesImplementationProcessRun" value="${fieldValue(bean: capabilityAudit, field: 'numberTimesImplementationProcessRun')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="processDeviationPercentage">Process Deviation Percentage:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'processDeviationPercentage', 'errors')}">
                            <input type="text" id="processDeviationPercentage" name="processDeviationPercentage" value="${fieldValue(bean: capabilityAudit, field: 'processDeviationPercentage')}"/>
                        </td>
                    </tr>

                </tbody>
            </table>
        </div>

    </g:form>
</div>
<div class="sidebar">
    <g:render template="sidebar"/>
</div>
</body>
</html>
