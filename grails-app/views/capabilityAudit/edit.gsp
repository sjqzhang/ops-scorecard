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


                <tr class="prop">
                    <td valign="top" class="name">   
                        <label for="service">Service:</label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: capabilityAudit, field: 'service', 'errors')}">
                        <g:select optionKey="id" from="${Service.list()}" name="service.id" value="${capabilityAudit?.service?.id}"></g:select>
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

            <h3>Process Coverage</h3>


            <table>
                <g:each in="${ServiceManagementProcess.constraints.category.inList.sort()}" var="category">
                    <g:set var="process" value="${ServiceManagementProcess.findByServiceAndCategory(capabilityAudit.service,category)}"/>
                    <tr>
                        <td valign="top" class="name">
                            ${category}<br/>
                        </td>
                        <g:if test="${process}">

                            <td valign="top">
                                <table>
                                    <tr>
                                        <td colspan="3">
                                            Implemented as: <g:link action="show" controller="serviceManagementProcess" id="${process.id}">${process.name}</g:link>
                                        </td>
                                    </tr>
                                    <g:set var="pfx" value="scorecards_${process.id}"/>
                                    <g:hiddenField name="${pfx}.process.id" value="${process.id}"/>
                                    <g:each in="${ServiceManagementProcess.metrics.sort()}" var="metric">
                                        <g:set var="metricbean" value="${'scorecards_'+process.id+'.'+metric}"/>
                                        <tr>
                                            <td>
                                                ${metric}
                                            </td>
                                            <td>
                                                <g:select name="${pfx}.${metric}.value" value="${pfx +"."+metric+'.value'}" from="${ServiceManagementProcessScore.values}"></g:select>
                                            </td>
                                            <td>
                                                <% def prop = pfx + "."+metric+".comment"%>
                                                <input name="${pfx}.${metric}.comment" type="text"
                                                    value="${fieldValue(bean:pfx.metricbean, field: 'comment')}" size="40"/>
                                            </td>
                                        </tr>
                                    </g:each>

                                </table>
                            </td>
                        </g:if>
                        <g:else>
                            <td>
                                
                                <g:link controller="serviceManagementProcess" action="create"
                                        params="['service.id':capabilityAudit.service.id,'category':category]">Define a process</g:link>

                            </td>
                        </g:else>

                    </tr>
                </g:each>
            </table>
        </div>

    </g:form>
</div>
<div class="sidebar">
    <g:render template="sidebar"/>
</div>
</body>
</html>
