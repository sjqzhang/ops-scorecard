<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Track: Show ProcessReceipt</title>
</head>
<body>

<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="buttons">
        <g:form>
            <input type="hidden" name="id" value="${processReceipt?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
            <span class="button"><g:actionSubmit class="list" value="List"/></span>

        </g:form>
    </div>
    <div class="dialog">
        <table>
            <tbody>

                <tr class="prop">
                    <td valign="top" class="name">Title:</td>

                    <td valign="top" class="value">${fieldValue(bean: processReceipt, field: 'title')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Coordinator:</td>

                    <td valign="top" class="value"><g:link controller="user" action="show" id="${processReceipt?.coordinator?.id}">${processReceipt?.coordinator?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Process:</td>

                    <td valign="top" class="value"><g:link controller="serviceManagementProcess" action="show"
                            id="${processReceipt?.process?.id}"
                            title="${processReceipt?.process?.description}">${processReceipt?.process?.encodeAsHTML()} [${processReceipt?.process?.category}]</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Service:</td>

                    <td valign="top" class="value"><g:link controller="service" action="show"
                            id="${processReceipt?.process?.service?.id}">${processReceipt?.process?.service?.name} [${processReceipt?.process?.service?.type?.name}]</g:link></td>

                </tr>


                <tr class="prop">
                    <td valign="top" class="name">Motivating Reason:</td>

                    <td valign="top" class="value">${fieldValue(bean: processReceipt, field: 'motivatingReason')}</td>

                </tr>


                <tr class="prop">
                    <td valign="top" class="name">Change Reviewers:</td>

                    <td valign="top" style="text-align:left;" class="value">
                        <g:if test="${processReceipt.changeReviewers}">
                            <ul>
                                <g:each var="c" in="${processReceipt.changeReviewers}">
                                    <li><g:link controller="user" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                            </ul>
                        </g:if>
                        <g:else>
                            <i>Not authorized</i>
                        </g:else>
                    </td>

                </tr>



                <tr class="prop">
                    <td valign="top" class="name">Security Reviewers:</td>

                    <td valign="top" style="text-align:left;" class="value">
                        <g:if test="${processReceipt.securityReviewers}">
                            <ul>
                                <g:each var="s" in="${processReceipt.securityReviewers}">
                                    <li><g:link controller="user" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                                </g:each>
                            </ul>
                        </g:if>
                        <g:else>
                            <i>Not authorized</i>
                        </g:else>
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Stakeholders:</td>

                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="s" in="${processReceipt.stakeholders}">
                                <li><g:link controller="user" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Non Action Consequence:</td>

                    <td valign="top" class="value">${fieldValue(bean: processReceipt, field: 'nonActionConsequence')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Change Request Url:</td>

                    <td valign="top" class="value">${fieldValue(bean: processReceipt, field: 'changeRequestUrl')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Priority:</td>

                    <td valign="top" class="value">${fieldValue(bean: processReceipt, field: 'priority')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Change Status:</td>

                    <td valign="top" class="value">${fieldValue(bean: processReceipt, field: 'status')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Outcome:</td>

                    <td valign="top" class="value">${fieldValue(bean: processReceipt, field: 'outcome')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Impact Level:</td>

                    <td valign="top" class="value">${fieldValue(bean: processReceipt, field: 'impactLevel')}</td>

                </tr>

                       <tr class="prop">
                    <td valign="top" class="name">Impacted Assets:</td>

                    <td valign="top" style="text-align:left;" class="value">
                        <g:if test="${processReceipt.impactedAssets}">
                            <ul>
                                <g:each var="s" in="${processReceipt.impactedAssets}">
                                    <li>${s?.encodeAsHTML()}</li>
                                </g:each>
                            </ul>
                        </g:if>
                        <g:else>
                            <i>None</i>
                        </g:else>
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Planned Start:</td>

                    <td valign="top" class="value">${fieldValue(bean: processReceipt, field: 'plannedStart')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Planned End:</td>

                    <td valign="top" class="value">${fieldValue(bean: processReceipt, field: 'plannedEnd')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Planned Expected Benefit:</td>

                    <td valign="top" class="value">${fieldValue(bean: processReceipt, field: 'plannedExpectedBenefit')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Actual Start:</td>

                    <td valign="top" class="value">${fieldValue(bean: processReceipt, field: 'actualStart')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Actual End:</td>

                    <td valign="top" class="value">${fieldValue(bean: processReceipt, field: 'actualEnd')}</td>

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
