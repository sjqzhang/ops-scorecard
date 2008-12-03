<html>
<head>
    <title>Ops Scorecard Report</title>
    <style type="text/css">
    body {
    background: #fff;
    color: #333;
    font: 11px verdana, arial, helvetica, sans-serif;
    }
    .body {
    float: left;
    margin: 0 15px 10px 15px;
    }
    span.score {
    font-weight: bold;
    font-size: 12px;
    }

    span.resourceName {
    font-size: 14pt;
    }
    span.resourceDescription {
    font-size: 11pt;
    }
    /* DIALOG */

    .dialog table {
    padding: 5px 0;
    }

    /* TABLES */

    table {
    border: 1px solid #ccc;
    width: 100%
    }
    tr {
    border: 0;
    }
    td, th {
    font: 11px verdana, arial, helvetica, sans-serif;
    line-height: 12px;
    padding: 5px 6px;
    text-align: left;
    vertical-align: top;
    }
    th {
    background: #fff url(${appUrl}/images/skin/shadow.jpg);
    color: #666;
    font-size: 11px;
    font-weight: bold;
    line-height: 17px;
    padding: 2px 6px;
    }
    th a:link, th a:visited, th a:hover {
    color: #333;
    display: block;
    font-size: 10px;
    text-decoration: none;
    width: 100%;
    }

    div.footerVersion{
    color: #aaa;
    margin: 5px 20px;
    font-size:8pt;
    clear:both;
}
div.footerVersion span.num{
    font-weight:bold;
}        
    </style>
</head>
<body>

<div class="body" style="width:600px;">
    <p>
        Your <a href="${appUrl}">Ops Scorecard</a> system has automatically provided you with this
    update to keep you informed about recent activity.        
    </p>

    <span class="resourceName">${service.name}</span>
    <span class="resourceDescription">${service?.description}</span>
    <table>
        <tbody>
            <tr>
                <th>URL</th>
                <td>
                    ${service?.serviceURL}
                </td>
                <th>Status</th>
                <td>${service.status}</td>
            </tr>
            <tr>
                <th>Customer</th>
                <td>
                    ${service?.customer}
                </td>
                <th>Owner</th>
                <td>
                    ${service?.ownerResponsible}
                </td>
            </tr>
            <tr>
                <th>Next Maint.</th><td>${service?.nextMaintenanceWindow}</td>
                <th>Flags</th>
                <td>
                    <% if (service.isFragile) { %>
                    <i>fragile</i>
                    <% } %>
                </td>
            </tr>
        </tbody>
    </table>
    <p>&nbsp;</p>
    <p>&nbsp;</p>

    <% if (serviceScoreMap.containsKey('audit')) { %>
    <span style="font-size:12pt;font-weight:bold;">Capability</span>
    <%
            def auditMap = serviceScoreMap.get('audit')
            def auditScorecards = auditMap.get(service.id)
            def auditCumulative = 0

            auditScorecards.each {auditScorecard ->
                auditCumulative += auditScorecard.scores.cumulative

            }
            def auditCumulativeAvg = auditCumulative / auditScorecards.size()

            def lastAudit = auditScorecards.get(auditScorecards.size() - 1)
    %>
    <p>Audit average: ${auditCumulativeAvg.intValue()}%</p>
    <p>Last Audit: ${lastAudit.audit.title} ${lastAudit.audit.auditDate}</p>

    <table>
        <thead>
            <tr>
                <th width="65">Control</th>
                <th width="65">Process</th>
                <th width="65">Repeatability</th>
                <th width="65">Average</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <!-- control -->
                <td width="10">
                    <span class="score">${lastAudit?.scores?.control}</span>
                </td>
                <!-- process -->
                <td width="10">
                    <span class="score">${lastAudit?.scores?.process}</span>
                </td>
                <!-- repeatability -->
                <td width="10">
                    <span class="score">${lastAudit?.scores?.repeatability}</span>
                </td>
                <!-- cumulative -->
                <td width="10">
                    <span class="score">${lastAudit?.scores?.cumulative}</span>
                </td>
            </tr>
        </tbody>
    </table>
    <p>&nbsp;</p>
    <p>&nbsp;</p>

    <% } %>



    <% if (serviceScoreMap.containsKey('process')) { %>
    <span style="font-size:12pt;font-weight:bold;">Management Process</span>
    <%
            def processMap = serviceScoreMap.get('process')
            def processScorecards = processMap.get(service.id)
            def processCumulative = 0

            processScorecards.each {processScorecard ->
                processCumulative += processScorecard.scores.cumulative

            }
            def processCumulativeAvg = processCumulative / processScorecards.size()
    %>
    <p>Process Quality: ${processCumulativeAvg}%</p>
    <h4>By process category</h4>

    <table>
        <tbody>
            <% processScorecards.each {processScorecard -> %>

            <tr>
                <!-- scores -->
            <th width="65">
                    ${processScorecard.process.category}:
            </th>
                <td style="padding:0;">
                    <span class="score">${processScorecard.scores.cumulative}</span>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <p>&nbsp;</p>
    <p>&nbsp;</p>

    <% } %>





    <% if (serviceScoreMap.containsKey('activity')) { %>
    <span style="font-size:12pt;font-weight:bold;">Change Activity</span>
    <%
            def activityScorecards = serviceScoreMap.get('activity')
            def activityCumulative = 0

            activityScorecards.each {activityScorecard ->
                activityCumulative += activityScorecard.scores.cumulative

            }
            def activityCumulativeAvg = activityCumulative / activityScorecards.size()
    %>
    <p>Change Quality: ${activityCumulativeAvg}%</p>

    <table>
        <thead>
            <tr>
                <th>Title</th>
                <th>Date</th>
                <th>Outcome</th>
                <th>Average</th>
            </tr>
        </thead>
        <tbody>
            <% activityScorecards.each {changeScoreCard -> %>
            <tr>
                <!-- receipt -->
                <td>
                    ${changeScoreCard.receipt.title}
                </td>
                <!-- date -->
                <td>
                    ${changeScoreCard.receipt.auditDate}
                </td>
                <!--outcome-->
                <td>
                    ${changeScoreCard.receipt.changeOutcome}
                </td>
                <!-- avg -->
                <td width="10">
                    <span class="score">${changeScoreCard?.scores?.cumulative}</span>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <p>&nbsp;</p>
    <p>&nbsp;</p>

    <% } %>
</div>

<div class="footerVersion">
      Scorecard
      <span class="num">0.9</span>

  </div>
  <div  class="footer" >
  &copy; 2009 <a href="http://opsscorecard.org">OpsScorecard.org</a>
  </div>


</body>

</html>