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
    <div class="view">
        <div class="header process">
            <span class="name"><g:link controller="processReceipt" action="show" id="${processReceipt?.id}">${processReceipt?.title}</g:link></span>
        </div>
        <table>
            <tbody>

                <tr class="prop">
                    <td valign="top" class="name ${!processReceipt?.coordinator?'empty':''}">Coordinator:</td>

                    <td valign="top" class="value"><g:link controller="user" action="show" id="${processReceipt?.coordinator?.id}">${processReceipt?.coordinator?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!processReceipt?.process?'empty':''}">Process:</td>

                    <td valign="top" class="value"><g:link controller="serviceManagementProcess" action="show"
                            id="${processReceipt?.process?.id}"
                            title="${processReceipt?.process?.description}">${processReceipt?.process?.encodeAsHTML()} [${processReceipt?.process?.category}]</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!processReceipt?.process?.service?'empty':''}">Service:</td>

                    <td valign="top" class="value"><g:link controller="service" action="show"
                            id="${processReceipt?.process?.service?.id}">${processReceipt?.process?.service?.name} [${processReceipt?.process?.service?.type?.name}]</g:link></td>

                </tr>


                <tr class="prop">
                    <td valign="top" class="name ${!processReceipt?.motivatingReason?'empty':''}">Motivating Reason:</td>

                    <td valign="top" class="value">${fieldValue(bean: processReceipt, field: 'motivatingReason')}</td>

                </tr>


                <tr class="prop">
                    <td valign="top" class="name ${!processReceipt?.changeReviewers?'empty':''}">Change Reviewers:</td>

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
                    <td valign="top" class="name ${!processReceipt?.securityReviewers?'empty':''}">Security Reviewers:</td>

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
                    <td valign="top" class="name ${!processReceipt?.stakeholders?'empty':''}">Stakeholders:</td>

                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="s" in="${processReceipt.stakeholders}">
                                <li><g:link controller="user" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!processReceipt?.nonActionConsequence?'empty':''}">Non-action Consequence:</td>

                    <td valign="top" class="value">${fieldValue(bean: processReceipt, field: 'nonActionConsequence')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!processReceipt?.changeRequestUrl?'empty':''}">Change Request Url:</td>

                    <td valign="top" class="value">${fieldValue(bean: processReceipt, field: 'changeRequestUrl')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!processReceipt?.priority?'empty':''}">Priority:</td>

                    <td valign="top" class="value">${fieldValue(bean: processReceipt, field: 'priority')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!processReceipt?.status?'empty':''}">Status:</td>

                    <td valign="top" class="value">${fieldValue(bean: processReceipt, field: 'status')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!processReceipt?.outcome?'empty':''}">Outcome:</td>

                    <td valign="top" class="value">${fieldValue(bean: processReceipt, field: 'outcome')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!processReceipt?.impactLevel?'empty':''}">Impact Level:</td>

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

                    <td valign="top" class="value">
                        <g:relativeDate elapsed="${processReceipt?.plannedStart}" agoClass="ago planned" untilClass="until planned"/>                        
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Planned End:</td>

                    <td valign="top" class="value">
                        <g:relativeDate elapsed="${processReceipt?.plannedEnd}" agoClass="ago ended" untilClass="until ended"/>                        
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Planned Expected Benefit:</td>

                    <td valign="top" class="value">
                        <g:relativeDate elapsed="${processReceipt?.plannedExpectedBenefit}" agoClass="ago benefit" untilClass="until benefit"/>                                                
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Actual Start:</td>

                    <td valign="top" class="value">
                        <g:relativeDate elapsed="${processReceipt?.actualStart}" agoClass="ago started" untilClass="until started"/>                                                
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Actual End:</td>

                    <td valign="top" class="value">
                        <g:relativeDate elapsed="${processReceipt?.actualEnd}" agoClass="ago ended" untilClass="until ended"/>
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
