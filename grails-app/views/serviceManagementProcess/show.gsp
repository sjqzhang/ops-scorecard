<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
        <meta name="guideitem" content="process"/>
    <title>Inventory: Process: ${serviceManagementProcess?.name}</title>

    <g:javascript>
        var Timeplot_urlPrefix="${createLinkTo(dir:'js',file:'/timeplot/api/1.0/')}";
    </g:javascript>
    <g:javascript src="ajax/api-2.0/simile-ajax-api.js"/>
    <g:javascript src="timeline/api-2.0/timeline-api.js"/>
    <g:javascript src="timeplot/api/1.0/timeplot-api.js"/>
    <script type="text/javascript">
        var timeplot;

        function onLoad() {
            var eventSource = new Timeplot.DefaultEventSource();
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
            var plotInfo = [
                Timeplot.createPlotInfo({
                    id: "plot_control",
                    dataSource: new Timeplot.ColumnSource(eventSource, 1),
                    valueGeometry:valueGeometry,
                    timeGeometry:timeGeometry,
                      lineColor: "#ff0000",
                      showValues: true
                }),

                Timeplot.createPlotInfo({
                    id: "plot_process",
                    dataSource: new Timeplot.ColumnSource(eventSource, 2),
                    valueGeometry:valueGeometry,
                    timeGeometry:timeGeometry,
                      lineColor: "#00ff00",
                      showValues: true
                }),

                Timeplot.createPlotInfo({
                    id: "plot_cum",
                    dataSource: new Timeplot.ColumnSource(eventSource, 3),
                    valueGeometry:valueGeometry,
                    timeGeometry:timeGeometry,
                      lineColor: "#0000ff",
                      showValues: true
                })
            ];

            timeplot = Timeplot.create(document.getElementById("my-timeplot"), plotInfo);
            timeplot.loadText("${createLink(controller:'serviceManagementProcess',action:'txtAudit',id:serviceManagementProcess.id)}", ",", eventSource);
        }

        var resizeTimerID = null;
        function onResize() {
            if (resizeTimerID == null) {
                resizeTimerID = window.setTimeout(function() {
                    resizeTimerID = null;
                    timeplot.repaint();
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

<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="buttons">
        <g:form>
            <input type="hidden" name="id" value="${serviceManagementProcess?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
            <span class="button"><g:actionSubmit class="list" value="List"/></span>

        </g:form>
    </div>
    <div class="view">
        <div class="header process">
            <span class="name"><g:link controller="serviceManagementProcess" action="show" id="${serviceManagementProcess?.id}">${serviceManagementProcess?.name}</g:link></span>
            <span class="desc">${serviceManagementProcess?.description}</span>
        </div>
        <table>
            <tbody>

                <tr class="prop">
                    <td valign="top" class="name ${!serviceManagementProcess?.category?'empty':''}">Category:</td>

                    <td valign="top" class="value">${fieldValue(bean: serviceManagementProcess, field: 'category')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!serviceManagementProcess?.service?'empty':''}">Service:</td>
                    <td valign="top" class="value">
                        <g:link controller="service" action="show" id="${serviceManagementProcess?.service?.id}">
                            <g:if test="serviceManagementProcess?.service?.name">
                                ${serviceManagementProcess?.service?.name}
                                [${serviceManagementProcess?.service?.type.name}]
                            </g:if>
                            <g:else>
                                ${serviceManagementProcess?.service?.encodeAsHTML()}
                            </g:else>
                        </g:link>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!serviceManagementProcess?.automationLevel?'empty':''}">Automation Level:</td>

                    <td valign="top" class="value">${fieldValue(bean: serviceManagementProcess, field: 'automationLevel')}</td>

                </tr>

                <g:if test="${'semi'.equals(serviceManagementProcess?.automationLevel) || 'full'.equals(serviceManagementProcess?.automationLevel)}">
                    <tr class="prop">
                        <td valign="top" class="name ${!serviceManagementProcess?.automationTool?'empty':''}">Automation Tool:</td>

                        <td valign="top" class="value">${fieldValue(bean: serviceManagementProcess, field: 'automationTool')}</td>

                    </tr>
                </g:if>
                <tr class="prop">
                    <td valign="top" class="name ${!serviceManagementProcess?.syscontrol?'empty':''}">System Control:</td>

                    <td valign="top" class="value">${fieldValue(bean: serviceManagementProcess, field: 'syscontrol')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!serviceManagementProcess?.artifactType?'empty':''}">Artifact Type:</td>

                    <td valign="top" style="text-align:left;" class="value">
                        <g:if test="${serviceManagementProcess?.artifactType?.id}">
                            <g:link controller="resourceType" action="show" id="${serviceManagementProcess?.artifactType?.id}">
                                ${serviceManagementProcess?.artifactType?.name}
                            </g:link>
                        </g:if>
                        <g:else>
                            <span class="info note">No Artifact Types</span>
                            <span class="menuButton">
                            <g:link controller="resourceType" class="create" action="create" params="[metatype:'artifact']">
                                Define a type
                            </g:link>
                            </span>
                        </g:else>
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!serviceManagementProcess?.notificationRecipients?'empty':''}">Notification Recipients:</td>

                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="n" in="${serviceManagementProcess.notificationRecipients}">
                                <li><g:link controller="user" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!serviceManagementProcess?.implementor?'empty':''}">Implementor team:</td>

                    <td valign="top" class="value"><g:link controller="usergroup" action="show" id="${serviceManagementProcess?.implementor?.id}">${serviceManagementProcess?.implementor?.encodeAsHTML()}</g:link></td>

                </tr>


                <tr class="prop">
                    <td valign="top" class="name ${!serviceManagementProcess?.recipient?'empty':''}">Recipient team:</td>

                    <td valign="top" class="value"><g:link controller="usergroup" action="show" id="${serviceManagementProcess?.recipient?.id}">${serviceManagementProcess?.recipient?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!serviceManagementProcess?.procedure?'empty':''}">Procedure:</td>

                    <td valign="top" class="value">${fieldValue(bean: serviceManagementProcess, field: 'procedure')}</td>

                </tr>



            </tbody>
        </table>
        <h3 class="section">Receipts
        <span class="menuButton"><g:link class="create" action="create" controller="processReceipt"
                    params="['process.id':serviceManagementProcess.id]">New receipt</g:link></span>
        </h3>

        <g:set var="receipts" value="${ProcessReceipt.findAllByProcess(serviceManagementProcess)}"/>
        <g:if test="receipts">
        <table>
            <tr>
                <th>Title</th>
                <th>By</th>
                <th>When</th>
                <th>Outcome</th>
            </tr>
            <g:each in="${ProcessReceipt.findAllByProcess(serviceManagementProcess)}" var="receipt">
                <tr>
                    <td>
                        <g:link controller="processReceipt" action="show" id="${receipt.id}">${receipt.title}</g:link>
                    </td>
                    <td>${receipt.coordinator}</td>
                    <td>
                        <g:relativeDate elapsed="${receipt?.date}" agoClass="ago " untilClass="until "/>

                    </td>
                    <td>${receipt?.outcome}</td>
                </tr>
            </g:each>
        </table>
        </g:if>
        <g:else>
        <div class="section">
            <div class="info note">
                No Receipts
            </div>
        </div>
        </g:else>
        <div id="my-timeplot" style="height: 150px;"></div>
    </div>

</div>

</body>
</html>
