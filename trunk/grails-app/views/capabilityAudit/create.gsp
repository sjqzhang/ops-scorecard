<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="audit"/>
    <title>Audit: Create CapabilityAudit</title>
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
    <g:form action="save" method="post">
        <div class="dialog">
            <div class="formtitle">
                Create Audit
            </div>
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


                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="service">Service:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'service', 'errors')}">
                            <g:select id="serviceSelect" optionKey="id" from="${Service.list()}" name="service.id" value="${capabilityAudit?.service?.id}"></g:select>
                            <span id="addSvcBut" class="controllink"
                                    onclick="$('addServiceDialog').show();$('addSvcBut').hide();">Add Service</span>


                            <div id="addServiceDialog" style="display:none;">
                                <span style="font-weight:bold;">Define a new service</span>
                                <div style="background-color:#f5f5f5;">
                                    <g:formRemote name="addServiceSelection" action="addServiceSelection"
                                            url="${[controller:'service',action:'addServiceSelection']}"
                                            update="serviceSelect">
                                        <g:hiddenField name="status" value="Installed"/>
                                        <table>
                                            <tbody>

                                                <tr class="prop">
                                                    <td valign="top" class="name">
                                                        <label for="name">Name:</label>
                                                    </td>
                                                    <td valign="top">
                                                        <input type="text" id="name" name="name"/>
                                                    </td>
                                                </tr>
                                                <tr class="prop">
                                                    <td valign="top" class="name">
                                                        <label for="type">Type:</label>
                                                    </td>
                                                    <td valign="top">
                                                        <g:select id="typeselect" optionKey="id" from="${ResourceType.findAllByMetatype('service')}" name="type.id" value="${service?.type?.id}"></g:select>

                                                    </td>
                                                </tr>
                                                <tr class="prop">
                                                    <td valign="top" class="name">
                                                        <label for="description">Description:</label>
                                                    </td>
                                                    <td valign="top">
                                                        <input type="text" id="description" name="description"/>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <span class="button"><input class="save" type="submit" value="Add Service"/></span>
                                        <span class="controllink"
                                                onclick="$('addServiceDialog').hide();$('addSvcBut').show();">Cancel</span>
                                    </g:formRemote>
                                </div>
                            </div>

                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="meanTimeToRepair">Mean time to repair:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'meanTimeToRepair', 'errors')}">
                            <g:select id="meanTimeToRepair" name="meanTimeToRepair" from="${capabilityAudit.constraints.meanTimeToRepair.inList}" value="${capabilityAudit.meanTimeToRepair}"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="mtbf">Mean time between Failure:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'mtbf', 'errors')}">
                            <g:select id="mtbf" name="mtbf" from="${capabilityAudit.constraints.meanTimeToRepair.inList}" value="${capabilityAudit.meanTimeToRepair}"></g:select>
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
                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="ticketService">Ticket Service:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'ticketService', 'errors')}">
                        <input type="text" id="ticketService" name="ticketService" value="${fieldValue(bean: capabilityAudit, field: 'ticketService')}"/>
                    </td>
                </tr>
            </table>

        <div class="buttons">
            <span class="button"><input  type="submit" value="Create"/></span>
            <span class="button"><g:actionSubmit action="list" value="Cancel"/></span>
        </div>

        </div>

    </g:form>
</div>

</body>
</html>
