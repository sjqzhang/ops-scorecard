

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Track: Show ChangeReceipt</title>
    </head>
    <body>

        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
               <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${changeReceipt?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:changeReceipt, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Title:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:changeReceipt, field:'title')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Coordinator:</td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${changeReceipt?.coordinator?.id}">${changeReceipt?.coordinator?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Targeted Service:</td>
                            
                            <td valign="top" class="value"><g:link controller="service" action="show" id="${changeReceipt?.targetedService?.id}">${changeReceipt?.targetedService?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Owner:</td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${changeReceipt?.owner?.id}">${changeReceipt?.owner?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Is Authorized:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:changeReceipt, field:'isAuthorized')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Has Security Sign Off:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:changeReceipt, field:'hasSecuritySignOff')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Motivating Reason:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:changeReceipt, field:'motivatingReason')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Non Action Consequence:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:changeReceipt, field:'nonActionConsequence')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Change Request Url:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:changeReceipt, field:'changeRequestUrl')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Priority:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:changeReceipt, field:'priority')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Change Status:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:changeReceipt, field:'changeStatus')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Change Outcome:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:changeReceipt, field:'changeOutcome')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Change Impact Level:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:changeReceipt, field:'changeImpactLevel')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Planned Start:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:changeReceipt, field:'plannedStart')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Planned End:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:changeReceipt, field:'plannedEnd')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Planned Expected Benefit:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:changeReceipt, field:'plannedExpectedBenefit')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Actual Start:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:changeReceipt, field:'actualStart')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Actual End:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:changeReceipt, field:'actualEnd')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Implementation Process:</td>
                            
                            <td valign="top" class="value"><g:link controller="serviceManagementProcess" action="show" id="${changeReceipt?.implementationProcess?.id}">${changeReceipt?.implementationProcess?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Verification Process:</td>
                            
                            <td valign="top" class="value"><g:link controller="serviceManagementProcess" action="show" id="${changeReceipt?.verificationProcess?.id}">${changeReceipt?.verificationProcess?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Backout Process:</td>
                            
                            <td valign="top" class="value"><g:link controller="serviceManagementProcess" action="show" id="${changeReceipt?.backoutProcess?.id}">${changeReceipt?.backoutProcess?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Worst Case Outage Duration:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:changeReceipt, field:'worstCaseOutageDuration')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Change Reviewers:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="c" in="${changeReceipt.changeReviewers}">
                                    <li><g:link controller="user" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Escalation Process:</td>
                            
                            <td valign="top" class="value"><g:link controller="serviceManagementProcess" action="show" id="${changeReceipt?.escalationProcess?.id}">${changeReceipt?.escalationProcess?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Impacted Assets:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="i" in="${changeReceipt.impactedAssets}">
                                    <li><g:link controller="resource" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Security Reviewers:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="s" in="${changeReceipt.securityReviewers}">
                                    <li><g:link controller="user" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Stakeholders:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="s" in="${changeReceipt.stakeholders}">
                                    <li><g:link controller="user" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Worst Case Outcome:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:changeReceipt, field:'worstCaseOutcome')}</td>
                            
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
