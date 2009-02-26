<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="audit"/>
    <title>Audit: Show CapabilityAudit</title>

   <g:javascript>
        var Timeplot_urlPrefix="${createLinkTo(dir:'js',file:'/timeplot/api/1.0/')}";
    </g:javascript>
    <g:javascript src="ajax/api-2.0/simile-ajax-api.js"/>
    <g:javascript src="timeline/api-2.0/timeline-api.js"/>
    <g:javascript src="timeplot/api/1.0/timeplot-api.js"/>
    <script type="text/javascript">
        SimileAjax.History.enabled = false;
    </script>

</head>
<body>

	<script type="text/javascript">
	        Event.observe(window,'load', function(e){ onLoad(); });
	        Event.observe(window,'resize', function(e){ onResize(); });
	</script>
	
<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="buttons">
        <g:form>
            <input type="hidden" name="id" value="${capabilityAudit?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
            <span class="button"><g:actionSubmit class="list" value="List"/></span>            
        </g:form>
    </div>
    <div class="view">
        <div class="header audit">
            <span class="name">${capabilityAudit?.title}</span>
            by
            <span class="author"><g:link controller="user" action="show" id="${capabilityAudit?.auditor?.id}">${capabilityAudit?.auditor?.encodeAsHTML()}</g:link></span>
            
            <span class="date"><g:relativeDate atDate="${capabilityAudit?.auditDate}" agoClass="ago audit" untilClass="until audit"/></span>
        </div>
        <h3>Service</h3>
        <div class="header service">
            <g:render template="/service/service_header" model="[service:capabilityAudit?.service]"/>
        </div>

        <h3>Control</h3>
        
        <table>
            <tbody>

                <tr class="prop">
                    <td valign="top" class="name ${!capabilityAudit?.changeCoordinator?'empty':''}">Change Coordinator:</td>

                    <td valign="top" class="value"><g:link controller="user" action="show" id="${capabilityAudit?.changeCoordinator?.id}">${capabilityAudit?.changeCoordinator?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!capabilityAudit?.changeOwner?'empty':''}">Change Owner:</td>

                    <td valign="top" class="value"><g:link controller="user" action="show" id="${capabilityAudit?.changeOwner?.id}">${capabilityAudit?.changeOwner?.encodeAsHTML()}</g:link></td>

                </tr>



                <tr class="prop">
                    <td valign="top" class="name ${!capabilityAudit?.ticketService?'empty':''}">Ticket Service:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'ticketService')}</td>

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
                    <td valign="top" class="name ${!capabilityAudit?.changeReviewers?'empty':''}">Change Reviewers:</td>

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
                    <td valign="top" class="name">Is Build Easier Than Repair:</td>

                    <td valign="top" class="value">${fieldValue(bean: capabilityAudit, field: 'isBuildEasierThanRepair')}</td>

                </tr>



                <tr class="prop">
                    <td valign="top" class="name ${!capabilityAudit?.securityReviewers?'empty':''}">Security Reviewers:</td>

                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="s" in="${capabilityAudit.securityReviewers}">
                                <li><g:link controller="user" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!capabilityAudit?.stakeholders?'empty':''}">Stakeholders:</td>

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

        <h3>Process Coverage</h3>



                        <g:each in="${capabilityAudit.scorecards}" var="scorecard">
                            <h3 class="sub">
                                    ${scorecard.process.category}: <i>${scorecard.process.name},</i>
                                    <span style="font-style:italic;font-weight:normal">${scorecard.process.description}</span>
                            </h3>

                                <table border="0">
                                   
                                    <g:each in="${ServiceManagementProcess.metrics.sort()}" var="metric">
                                        <tr>
                                            <td style="text-align:right;width:25px;">
                                                ${metric} 
                                            </td>
                                            <td style="width:15px;">                                                
                                                ${scorecard[metric].value}
                                            </td>
                                            <td>
                                                <g:if test="${scorecard[metric].comment}">
                                                    ${scorecard[metric].comment}
                                                </g:if>
                                                <g:else>
                                                    <span style="color:#666;font-style:italic;">No comments</span>
                                                </g:else>
                                            </td>
                                        </tr>
                                    </g:each>

                                </table>

							   <script type="text/javascript">
							        var timeplot_${scorecard.process.id};

							        function onLoad() {
							            var eventSource_${scorecard.process.id} = new Timeplot.DefaultEventSource();
							            var valueGeometry=new Timeplot.DefaultValueGeometry({
							                        gridColor: "#000000",
							                        axisLabelsPlacement: "left",
							                        min: 0,
							                        max: 100
							                      });
							                      var timeGeometry= new Timeplot.DefaultTimeGeometry({
							                        gridColor: "#000000",
							                        axisLabelsPlacement: "top"
							                      });
							            var plotInfo_${scorecard.process.id} = [
							                Timeplot.createPlotInfo({
							                    id: "plot_control",
							                    dataSource: new Timeplot.ColumnSource(eventSource_${scorecard.process.id}, 1),
							                    valueGeometry:valueGeometry,
							                    timeGeometry:timeGeometry,
							                      lineColor: "#ff0000",
							                      showValues: true
							                }),

							                Timeplot.createPlotInfo({
							                    id: "plot_process",
							                    dataSource: new Timeplot.ColumnSource(eventSource_${scorecard.process.id}, 2),
							                    valueGeometry:valueGeometry,
							                    timeGeometry:timeGeometry,
							                      lineColor: "#00ff00",
							                      showValues: true
							                }),

							                Timeplot.createPlotInfo({
							                    id: "plot_cum",
							                    dataSource: new Timeplot.ColumnSource(eventSource_${scorecard.process.id}, 3),
							                    valueGeometry:valueGeometry,
							                    timeGeometry:timeGeometry,
							                      lineColor: "#0000ff",
							                      showValues: true
							                })
							            ];

							            timeplot_${scorecard.process.id} = Timeplot.create(document.getElementById("my-timeplot_${scorecard.process.id}"), plotInfo_${scorecard.process.id});
							            timeplot_${scorecard.process.id}.loadText("${createLink(controller:'serviceManagementProcess',action:'txtAudit',id:scorecard.process.id)}", ",", eventSource_${scorecard.process.id});
							        }

							        var resizeTimerID_${scorecard.process.id} = null;
							        function onResize() {
							            if (resizeTimerID_${scorecard.process.id} == null) {
							                resizeTimerID_${scorecard.process.id} = window.setTimeout(function() {
							                    resizeTimerID_${scorecard.process.id} = null;
							                    timeplot_${scorecard.process.id}.repaint();
							                }, 100);
							            }
							        }

							    </script>
							    <h4>Historical audit scores</h4>
						        <div id="my-timeplot_${scorecard.process.id}" style="height: 150px;"></div>

                        </g:each>

    </div>

</div>
</body>
</html>
