

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Track: Edit ChangeReceipt</title>
    </head>
    <body>

        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${changeReceipt}">
            <div class="errors">
                <g:renderErrors bean="${changeReceipt}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${changeReceipt?.id}" />
                   <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                       <span class="button"><g:actionSubmit class="list" value="List" /></span>                       
                </div>
                <div class="dialog">
                           <h3>General</h3>
            <table>
                <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="title">Title:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'title', 'errors')}">
                            <input type="text" id="title" name="title" value="${fieldValue(bean: changeReceipt, field: 'title')}"/>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="auditDate">Date:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'auditDate', 'errors')}">
                            <g:datePicker name="auditDate" value="${changeReceipt?.auditDate}"></g:datePicker>
                        </td>
                    </tr>
                </tbody>
            </table>
            <h3>Control</h3>
            <table>
                <tbody>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="coordinator">Coordinator:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'coordinator', 'errors')}">
                            <g:select optionKey="id" from="${User.list()}" name="coordinator.id" value="${changeReceipt?.coordinator?.id}"></g:select>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="owner">Owner:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'owner', 'errors')}">
                            <g:select optionKey="id" from="${User.list()}" name="owner.id" value="${changeReceipt?.owner?.id}" noSelection="['null':'']"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="motivatingReason">Motivating Reason:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'motivatingReason', 'errors')}">
                            <input type="text" id="motivatingReason" name="motivatingReason" value="${fieldValue(bean: changeReceipt, field: 'motivatingReason')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="priority">Priority:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'priority', 'errors')}">
                            <g:select id="priority" name="priority" from="${changeReceipt.constraints.priority.inList}" value="${changeReceipt.priority}"></g:select>
                        </td>
                    </tr>


                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="isAuthorized">Is Authorized:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'isAuthorized', 'errors')}">
                            <g:checkBox name="isAuthorized" value="${changeReceipt?.isAuthorized}"></g:checkBox>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="hasSecuritySignOff">Has Security Sign Off:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'hasSecuritySignOff', 'errors')}">
                            <g:checkBox name="hasSecuritySignOff" value="${changeReceipt?.hasSecuritySignOff}"></g:checkBox>
                        </td>
                    </tr>


                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="nonActionConsequence">Non Action Consequence:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'nonActionConsequence', 'errors')}">
                            <input type="text" id="nonActionConsequence" name="nonActionConsequence" value="${fieldValue(bean: changeReceipt, field: 'nonActionConsequence')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="changeRequestUrl">Change Request Url:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'changeRequestUrl', 'errors')}">
                            <input type="text" id="changeRequestUrl" name="changeRequestUrl" value="${fieldValue(bean: changeReceipt, field: 'changeRequestUrl')}"/>
                        </td>
                    </tr>


                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="worstCaseOutcome">Worst Case Outcome:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'worstCaseOutcome', 'errors')}">
                            <input type="text" id="worstCaseOutcome" name="worstCaseOutcome" value="${fieldValue(bean: changeReceipt, field: 'worstCaseOutcome')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="changeStatus">Change Status:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'changeStatus', 'errors')}">
                            <g:select id="changeStatus" name="changeStatus" from="${changeReceipt.constraints.changeStatus.inList}" value="${changeReceipt.changeStatus}"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="changeOutcome">Change Outcome:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'changeOutcome', 'errors')}">
                            <g:select id="changeOutcome" name="changeOutcome" from="${changeReceipt.constraints.changeOutcome.inList}" value="${changeReceipt.changeOutcome}"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="changeImpactLevel">Change Impact Level:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'changeImpactLevel', 'errors')}">
                            <g:select id="changeImpactLevel" name="changeImpactLevel" from="${changeReceipt.constraints.changeImpactLevel.inList}" value="${changeReceipt.changeImpactLevel}"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="plannedStart">Planned Start:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'plannedStart', 'errors')}">
                            <g:datePicker name="plannedStart" value="${changeReceipt?.plannedStart}"></g:datePicker>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="plannedEnd">Planned End:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'plannedEnd', 'errors')}">
                            <g:datePicker name="plannedEnd" value="${changeReceipt?.plannedEnd}"></g:datePicker>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="plannedExpectedBenefit">Planned Expected Benefit:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'plannedExpectedBenefit', 'errors')}">
                            <g:datePicker name="plannedExpectedBenefit" value="${changeReceipt?.plannedExpectedBenefit}" noSelection="['':'']"></g:datePicker>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="actualStart">Actual Start:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'actualStart', 'errors')}">
                            <g:datePicker name="actualStart" value="${changeReceipt?.actualStart}" noSelection="['':'']"></g:datePicker>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="actualEnd">Actual End:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'actualEnd', 'errors')}">
                            <g:datePicker name="actualEnd" value="${changeReceipt?.actualEnd}" noSelection="['':'']"></g:datePicker>
                        </td>
                    </tr>

                </tbody>
            </table>
            <h3>Process</h3>
            <table>
                <tbody>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="targetedService">Targeted Service:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'targetedService', 'errors')}">
                            <g:select optionKey="id" from="${Service.list()}" name="targetedService.id" value="${changeReceipt?.targetedService?.id}"></g:select>
                        </td>
                    </tr>


                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="implementationProcess">Implementation Process:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'implementationProcess', 'errors')}">
                            <g:select optionKey="id" from="${ServiceManagementProcess.list()}" name="implementationProcess.id" value="${changeReceipt?.implementationProcess?.id}" noSelection="['null':'']"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="verificationProcess">Verification Process:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'verificationProcess', 'errors')}">
                            <g:select optionKey="id" from="${ServiceManagementProcess.list()}" name="verificationProcess.id" value="${changeReceipt?.verificationProcess?.id}" noSelection="['null':'']"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="backoutProcess">Backout Process:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'backoutProcess', 'errors')}">
                            <g:select optionKey="id" from="${ServiceManagementProcess.list()}" name="backoutProcess.id" value="${changeReceipt?.backoutProcess?.id}" noSelection="['null':'']"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="worstCaseOutageDuration">Worst Case Outage Duration:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'worstCaseOutageDuration', 'errors')}">
                            <input type="text" id="worstCaseOutageDuration" name="worstCaseOutageDuration" value="${fieldValue(bean: changeReceipt, field: 'worstCaseOutageDuration')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="escalationProcess">Escalation Process:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'escalationProcess', 'errors')}">
                            <g:select optionKey="id" from="${ServiceManagementProcess.list()}" name="escalationProcess.id" value="${changeReceipt?.escalationProcess?.id}"></g:select>
                        </td>
                    </tr>

                </tbody>
            </table>
            <h3>Repeatability</h3>
            <table>
                <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="buildProcess">Build Process:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'buildProcess', 'errors')}">
                            <g:select optionKey="id" from="${ServiceManagementProcess.list()}" name="buildProcess.id" value="${changeReceipt?.buildProcess?.id}" noSelection="['null':'']"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="handoffProcess">Handoff Process:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'handoffProcess', 'errors')}">
                            <g:select optionKey="id" from="${ServiceManagementProcess.list()}" name="handoffProcess.id" value="${changeReceipt?.handoffProcess?.id}" noSelection="['null':'']"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="releaseEngineer">Release Engineer:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'releaseEngineer', 'errors')}">
                            <g:select optionKey="id" from="${Usergroup.list()}" name="releaseEngineer.id" value="${changeReceipt?.releaseEngineer?.id}" noSelection="['null':'']"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="releaseArtifact">Release Artifact:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'releaseArtifact', 'errors')}">
                            <g:select optionKey="id" from="${ReleaseArtifact.list()}" name="releaseArtifact.id" value="${changeReceipt?.releaseArtifact?.id}" noSelection="['null':'']"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="softwareAcceptanceProcess">Software Acceptance Process:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: changeReceipt, field: 'softwareAcceptanceProcess', 'errors')}">
                            <g:select optionKey="id" from="${ServiceManagementProcess.list()}" name="softwareAcceptanceProcess.id" value="${changeReceipt?.softwareAcceptanceProcess?.id}" noSelection="['null':'']"></g:select>
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
