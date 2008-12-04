<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Track: Create ProcessReceipt</title>
</head>
<body>

<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${processReceipt}">
        <div class="errors">
            <g:renderErrors bean="${processReceipt}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form action="save" method="post">
        <div class="buttons">
            <span class="button"><input class="save" type="submit" value="Create"/></span>
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
                        <td valign="top" class="value ${hasErrors(bean: processReceipt, field: 'title', 'errors')}">
                            <input type="text" id="title" name="title" value="${fieldValue(bean: processReceipt, field: 'title')}"/>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="date">Date:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: processReceipt, field: 'date', 'errors')}">
                            <g:datePicker name="date" value="${processReceipt?.date}"></g:datePicker>
                        </td>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="targetedService">Targeted Service:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: processReceipt, field: 'targetedService', 'errors')}">
                            <select name="targetedService.id" id="targetedService.id">
                                <g:each in="${Service.list()}" var="s">
                                    <option value="${s.id}">${s?.name} [${s?.type?.name}]</option>
                                </g:each>
                            </select>
                        </td>
                    </tr>
            
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="coordinator">Coordinator:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: processReceipt, field: 'coordinator', 'errors')}">
                            <g:select optionKey="id" from="${User.list()}" name="coordinator.id" value="${processReceipt?.coordinator?.id}"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="motivatingReason">Motivating Reason:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: processReceipt, field: 'motivatingReason', 'errors')}">
                            <input type="text" id="motivatingReason" name="motivatingReason" value="${fieldValue(bean: processReceipt, field: 'motivatingReason')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="priority">Priority:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: processReceipt, field: 'priority', 'errors')}">
                            <g:select id="priority" name="priority" from="${processReceipt.constraints.priority.inList}" value="${processReceipt.priority}"></g:select>
                        </td>
                    </tr>


                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="isAuthorized">Is Authorized:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: processReceipt, field: 'isAuthorized', 'errors')}">
                            <g:checkBox name="isAuthorized" value="${processReceipt?.isAuthorized}"></g:checkBox>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="hasSecuritySignOff">Has Security Sign Off:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: processReceipt, field: 'hasSecuritySignOff', 'errors')}">
                            <g:checkBox name="hasSecuritySignOff" value="${processReceipt?.hasSecuritySignOff}"></g:checkBox>
                        </td>
                    </tr>


                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="nonActionConsequence">Non Action Consequence:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: processReceipt, field: 'nonActionConsequence', 'errors')}">
                            <input type="text" id="nonActionConsequence" name="nonActionConsequence" value="${fieldValue(bean: processReceipt, field: 'nonActionConsequence')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="changeRequestUrl">Change Request Url:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: processReceipt, field: 'changeRequestUrl', 'errors')}">
                            <input type="text" id="changeRequestUrl" name="changeRequestUrl" value="${fieldValue(bean: processReceipt, field: 'changeRequestUrl')}"/>
                        </td>
                    </tr>


                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="worstCaseOutcome">Worst Case Outcome:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: processReceipt, field: 'worstCaseOutcome', 'errors')}">
                            <input type="text" id="worstCaseOutcome" name="worstCaseOutcome" value="${fieldValue(bean: processReceipt, field: 'worstCaseOutcome')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="status">Change Status:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: processReceipt, field: 'status', 'errors')}">
                            <g:select id="status" name="status" from="${processReceipt.constraints.status.inList}" value="${processReceipt.status}"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="outcome">Change Outcome:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: processReceipt, field: 'outcome', 'errors')}">
                            <g:select id="outcome" name="outcome" from="${processReceipt.constraints.outcome.inList}" value="${processReceipt.outcome}"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="impactLevel">Change Impact Level:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: processReceipt, field: 'impactLevel', 'errors')}">
                            <g:select id="impactLevel" name="impactLevel" from="${processReceipt.constraints.impactLevel.inList}" value="${processReceipt.impactLevel}"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="plannedStart">Planned Start:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: processReceipt, field: 'plannedStart', 'errors')}">
                            <g:datePicker name="plannedStart" value="${processReceipt?.plannedStart}"></g:datePicker>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="plannedEnd">Planned End:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: processReceipt, field: 'plannedEnd', 'errors')}">
                            <g:datePicker name="plannedEnd" value="${processReceipt?.plannedEnd}"></g:datePicker>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="plannedExpectedBenefit">Planned Expected Benefit:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: processReceipt, field: 'plannedExpectedBenefit', 'errors')}">
                            <g:datePicker name="plannedExpectedBenefit" value="${processReceipt?.plannedExpectedBenefit}" noSelection="['':'']"></g:datePicker>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="actualStart">Actual Start:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: processReceipt, field: 'actualStart', 'errors')}">
                            <g:datePicker name="actualStart" value="${processReceipt?.actualStart}" noSelection="['':'']"></g:datePicker>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="actualEnd">Actual End:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: processReceipt, field: 'actualEnd', 'errors')}">
                            <g:datePicker name="actualEnd" value="${processReceipt?.actualEnd}" noSelection="['':'']"></g:datePicker>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="worstCaseOutageDuration">Worst Case Outage Duration:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: processReceipt, field: 'worstCaseOutageDuration', 'errors')}">
                            <input type="text" id="worstCaseOutageDuration" name="worstCaseOutageDuration" value="${fieldValue(bean: processReceipt, field: 'worstCaseOutageDuration')}"/>
                        </td>
                    </tr>
                </tbody>
            </table>

        </div>
    </g:form>
</div>
</body>
</html>