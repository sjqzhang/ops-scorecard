

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit ServiceScorecard</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ServiceScorecard List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ServiceScorecard</g:link></span>
        </div>
        <div class="body">
            <h1>Edit ServiceScorecard</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${serviceScorecardInstance}">
            <div class="errors">
                <g:renderErrors bean="${serviceScorecardInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${serviceScorecardInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="goals">Goals:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'goals','errors')}">
                                    <g:select optionKey="id" from="${ServiceScorecardGoals.list()}" name="goals.id" value="${serviceScorecardInstance?.goals?.id}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="service">Service:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'service','errors')}">
                                    <g:select optionKey="id" from="${Service.list()}" name="service.id" value="${serviceScorecardInstance?.service?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="MTBFTime">MTBFT ime:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'MTBFTime','errors')}">
                                    <input type="text" id="MTBFTime" name="MTBFTime" value="${fieldValue(bean:serviceScorecardInstance,field:'MTBFTime')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="MTTRTime">MTTRT ime:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'MTTRTime','errors')}">
                                    <input type="text" id="MTTRTime" name="MTTRTime" value="${fieldValue(bean:serviceScorecardInstance,field:'MTTRTime')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="adHocActivityCount">Ad Hoc Activity Count:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'adHocActivityCount','errors')}">
                                    <input type="text" id="adHocActivityCount" name="adHocActivityCount" value="${fieldValue(bean:serviceScorecardInstance,field:'adHocActivityCount')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="auditsExist">Audits Exist:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'auditsExist','errors')}">
                                    <g:checkBox name="auditsExist" value="${serviceScorecardInstance?.auditsExist}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${serviceScorecardInstance?.dateCreated}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endDate">End Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'endDate','errors')}">
                                    <g:datePicker name="endDate" value="${serviceScorecardInstance?.endDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="estimatedOutageCost">Estimated Outage Cost:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'estimatedOutageCost','errors')}">
                                    <input type="text" id="estimatedOutageCost" name="estimatedOutageCost" value="${fieldValue(bean:serviceScorecardInstance,field:'estimatedOutageCost')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="goalsMetPct">Goals Met Pct:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'goalsMetPct','errors')}">
                                    <input type="text" id="goalsMetPct" name="goalsMetPct" value="${fieldValue(bean:serviceScorecardInstance,field:'goalsMetPct')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="highImpactActivityPct">High Impact Activity Pct:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'highImpactActivityPct','errors')}">
                                    <input type="text" id="highImpactActivityPct" name="highImpactActivityPct" value="${fieldValue(bean:serviceScorecardInstance,field:'highImpactActivityPct')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="processCoveragePct">Process Coverage Pct:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'processCoveragePct','errors')}">
                                    <input type="text" id="processCoveragePct" name="processCoveragePct" value="${fieldValue(bean:serviceScorecardInstance,field:'processCoveragePct')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="processDeviationsCount">Process Deviations Count:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'processDeviationsCount','errors')}">
                                    <input type="text" id="processDeviationsCount" name="processDeviationsCount" value="${fieldValue(bean:serviceScorecardInstance,field:'processDeviationsCount')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="processQualityPct">Process Quality Pct:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'processQualityPct','errors')}">
                                    <input type="text" id="processQualityPct" name="processQualityPct" value="${fieldValue(bean:serviceScorecardInstance,field:'processQualityPct')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="risk">Risk:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'risk','errors')}">
                                    <input type="text" id="risk" name="risk" value="${fieldValue(bean:serviceScorecardInstance,field:'risk')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="serviceAvailabilityPct">Service Availability Pct:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'serviceAvailabilityPct','errors')}">
                                    <input type="text" id="serviceAvailabilityPct" name="serviceAvailabilityPct" value="${fieldValue(bean:serviceScorecardInstance,field:'serviceAvailabilityPct')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="serviceFailuresCount">Service Failures Count:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'serviceFailuresCount','errors')}">
                                    <input type="text" id="serviceFailuresCount" name="serviceFailuresCount" value="${fieldValue(bean:serviceScorecardInstance,field:'serviceFailuresCount')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="smActivitiesCount">Sm Activities Count:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'smActivitiesCount','errors')}">
                                    <input type="text" id="smActivitiesCount" name="smActivitiesCount" value="${fieldValue(bean:serviceScorecardInstance,field:'smActivitiesCount')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="smActivitiesImpactedAvailabilityCount">Sm Activities Impacted Availability Count:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'smActivitiesImpactedAvailabilityCount','errors')}">
                                    <input type="text" id="smActivitiesImpactedAvailabilityCount" name="smActivitiesImpactedAvailabilityCount" value="${fieldValue(bean:serviceScorecardInstance,field:'smActivitiesImpactedAvailabilityCount')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="smActivitiesUnapprovedCount">Sm Activities Unapproved Count:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'smActivitiesUnapprovedCount','errors')}">
                                    <input type="text" id="smActivitiesUnapprovedCount" name="smActivitiesUnapprovedCount" value="${fieldValue(bean:serviceScorecardInstance,field:'smActivitiesUnapprovedCount')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="smActivitiesUnplannedCount">Sm Activities Unplanned Count:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'smActivitiesUnplannedCount','errors')}">
                                    <input type="text" id="smActivitiesUnplannedCount" name="smActivitiesUnplannedCount" value="${fieldValue(bean:serviceScorecardInstance,field:'smActivitiesUnplannedCount')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="smControlsPct">Sm Controls Pct:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'smControlsPct','errors')}">
                                    <input type="text" id="smControlsPct" name="smControlsPct" value="${fieldValue(bean:serviceScorecardInstance,field:'smControlsPct')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="smSuccessPct">Sm Success Pct:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'smSuccessPct','errors')}">
                                    <input type="text" id="smSuccessPct" name="smSuccessPct" value="${fieldValue(bean:serviceScorecardInstance,field:'smSuccessPct')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startDate">Start Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:serviceScorecardInstance,field:'startDate','errors')}">
                                    <g:datePicker name="startDate" value="${serviceScorecardInstance?.startDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
