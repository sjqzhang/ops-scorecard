

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show ServiceScorecard</title>
        <g:javascript>
                var Timeplot_urlPrefix="${createLinkTo(dir:'js',file:'/timeplot/api/1.0/')}";
            </g:javascript>
            <g:javascript src="ajax/api-2.0/simile-ajax-api.js"/>
            <g:javascript src="timeline/api-2.0/timeline-api.js"/>
            <g:javascript src="timeplot/api/1.0/timeplot-api.js"/>
        <script type="text/javascript">
        var alltimeplots=new Hash();
        var allgraphs =new Hash();
        var alldata =new Hash();

        function onLoad() {
            allgraphs.keys().each(function(gname){
                var info=allgraphs.get(gname);
                var datatype=info.get("type");
                var goalsmet=info.get("goalsmet");
                var eventSource = new Timeplot.DefaultEventSource();
                var valueGeometry;
                if(datatype=='%'){
                    valueGeometry=new Timeplot.DefaultValueGeometry({
                            gridColor: "#000000",
                            axisLabelsPlacement: "left",
                            min: 0,
                            max: 100
                          });
                }else{
                    valueGeometry=new Timeplot.DefaultValueGeometry({ gridColor: "#000000",
                            axisLabelsPlacement: "left" });
                }
                var timeGeometry= new Timeplot.DefaultTimeGeometry({
                    gridColor: "#000000",
                    axisLabelsPlacement: "top"
                });
                var plotInfo = [
                    Timeplot.createPlotInfo({
                        id: "goal",
                        dataSource: new Timeplot.ColumnSource(eventSource, 2),
                        valueGeometry:valueGeometry,
                        timeGeometry:timeGeometry,
                          lineColor: "#0000ff",
                          fillColor: "#dddddd",
                          showValues: false
                    }),
                    Timeplot.createPlotInfo({
                        id: "value",
                        dataSource: new Timeplot.ColumnSource(eventSource, 1),
                        valueGeometry:valueGeometry,
                        timeGeometry:timeGeometry,
                          lineColor: goalsmet?"#00aa00":"#ff0000",
                          showValues: false
                    }),

                ];
                var timeplot = Timeplot.create($("tp_"+gname), plotInfo);
                var data = alldata.get(gname);
                if(data!=null){
                }else{
                    alert("null data");
                }
                var datastr='';
                datastr = data.join("\r\n");
                eventSource.loadText(datastr,",","${createLink(controller:'serviceScorecard',action:'show',id:serviceScorecardInstance.id)}");
                alltimeplots.set(gname,timeplot);
            });
        }

        var resizeTimerID = null;
        function onResize() {
            if (resizeTimerID == null) {
                resizeTimerID = window.setTimeout(function() {
                    resizeTimerID = null;
                    alltimeplots.values().each(function(i){
                        i.repaint();
                    });
                }, 100);
            }
        }

    </script>
    </head>
    <body>

<script type="text/javascript">
        Event.observe(window,'load', function(e){ onLoad(); });
        Event.observe(window,'resize', function(e){ onResize(); });
</script>
<g:set var="metricsList" value="${ServiceScorecardBase.metricsList}"/>
<g:set var="metricsTypes" value="${ServiceScorecardBase.metricsTypes}"/>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="view">
                <div class="header service">
                    <g:render template="/service/service_header" model="[service:serviceScorecardInstance.service]"/>
                </div>

                <div class="section">
                    <h2>
                        <g:formatDate date="${serviceScorecardInstance?.startDate}" format="yyyy/MM/dd"/>
                        to
                        <g:formatDate date="${serviceScorecardInstance?.endDate}" format="yyyy/MM/dd"/>
                    </h2>
                </div>
                    <table>
                        <tbody>
                            <g:render template="scoresummary" model="[score:serviceScorecardInstance,previousscores:previousscores,metric:'goalsMetPct']"/>
                            <g:render template="scoresummary" model="[score:serviceScorecardInstance,previousscores:previousscores,metric:'risk' ]"/>

                        </tbody>
                    </table>
                    

                <h3>Service Info</h3>
                <div class="section">
                    <g:render template="/service/service_info" model="[service:serviceScorecardInstance.service]"/>
                </div>


                <h3>Audit Scores</h3>
                <div class="section">
                    <g:if test="${serviceScorecardInstance.auditsExist}">
                        <g:set var="audits" value="${CapabilityAudit.findAllByAuditDateBetweenAndService(serviceScorecardInstance.startDate,serviceScorecardInstance.endDate,serviceScorecardInstance.service)}"/>
                        Audits: ${audits.size()}
                        
                        <span class="link action" onclick="$('auditsList').toggle();">(see more)</span>
                        <div style="display:none;" id="auditsList">
                            <ul>
                            <g:each var="audit" in="${audits}">
                                <li>
                                 <g:link controller="capabilityAudit" action="show" id="${audit.id}">
                                     ${audit.title}
                                 </g:link>
                                </li>
                            </g:each>
                            </ul>
                        </div>
                    </g:if>
                </div>
                    <table>
                        <tbody>
                            <tr>
                                    <g:render template="scoresummary" model="[score:serviceScorecardInstance,previousscores:previousscores,metric:'smControlsPct' ]"/>

                            </tr>
                            <tr>
                                    <g:render template="scoresummary" model="[score:serviceScorecardInstance,previousscores:previousscores,metric:'processCoveragePct' ]"/>
                            </tr>
                            <tr>
                                    <g:render template="scoresummary" model="[score:serviceScorecardInstance,previousscores:previousscores,metric:'processQualityPct' ]"/>
                            </tr>
                        </tbody>
                    </table>


                     <h3>Performance</h3>
                <div class="section">
                        Receipts: ${receipts.size()}

                        <span class="link action" onclick="$('receiptsList').toggle();">(see more)</span>
                        <div style="display:none;" id="receiptsList">
                            <ul>
                            <g:each var="receipt" in="${receipts}">
                                <li>
                                 <g:link controller="processReceipt" action="show" id="${receipt.id}">
                                     ${receipt.title}
                                 </g:link>
                                </li>
                            </g:each>
                            </ul>
                        </div>
                <h3>Service Availability</h3>
                <table>

                            <tr>
                                    <g:render template="scoresummary" model="[score:serviceScorecardInstance,previousscores:previousscores,metric:'serviceAvailabilityPct' ]"/>

                            </tr>

                            <tr>
                                    <g:render template="scoresummary" model="[score:serviceScorecardInstance,previousscores:previousscores,metric:'estimatedOutageCost' ]"/>
                                    <g:render template="scoresummary" model="[score:serviceScorecardInstance,previousscores:previousscores,metric:'serviceFailuresCount' ]"/>
                            </tr>

                            <tr>
                                    <g:render template="scoresummary" model="[score:serviceScorecardInstance,previousscores:previousscores,metric:'MTTRTime' ]"/>
                                    <g:render template="scoresummary" model="[score:serviceScorecardInstance,previousscores:previousscores,metric:'MTBFTime' ]"/>
                            </tr>
                </table>

                    <h3>Service Management Activity</h3>
                    <table>

                            <tr>
                                    <g:render template="scoresummary" model="[score:serviceScorecardInstance,previousscores:previousscores,metric:'smActivitiesCount' ]"/>
                                    <g:render template="scoresummary" model="[score:serviceScorecardInstance,previousscores:previousscores,metric:'smSuccessPct' ]"/>
                            </tr>
                            <tr>
                                    <g:render template="scoresummary" model="[score:serviceScorecardInstance,previousscores:previousscores,metric:'highImpactActivityPct' ]"/>
                                    <g:render template="scoresummary" model="[score:serviceScorecardInstance,previousscores:previousscores,metric:'smActivitiesImpactedAvailabilityCount' ]"/>
                            </tr>
                            <tr>
                                    <g:render template="scoresummary" model="[score:serviceScorecardInstance,previousscores:previousscores,metric:'adHocActivityCount' ]"/>
                                    <g:render template="scoresummary" model="[score:serviceScorecardInstance,previousscores:previousscores,metric:'smActivitiesUnplannedCount' ]"/>
                            </tr>
                            <tr>
                                    <g:render template="scoresummary" model="[score:serviceScorecardInstance,previousscores:previousscores,metric:'processDeviationsCount' ]"/>
                                    <g:render template="scoresummary" model="[score:serviceScorecardInstance,previousscores:previousscores,metric:'smActivitiesUnapprovedCount' ]"/>
                            </tr>
                    </table>
                </div>
                
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${serviceScorecardInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
