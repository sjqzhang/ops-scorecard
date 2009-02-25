<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="activity"/>
    <title>Activity Summary</title>

</head>
<body>
<div class="body view activitysummary">
    <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
    </g:if>
    <div class="section">
        Activity since: <g:relativeDate atDate="${startDate}"/>
        <span style="float:right;">
            <g:if test="${params.week}">
                <g:link class="action" action="summary" controller="activity">Day</g:link>
                <g:link class="action selected" action="summary" controller="activity" params="[week:1]">Week</g:link>
            </g:if>
            <g:else>
                <g:link class="action selected" action="summary" controller="activity">Day</g:link>
                <g:link class="action" action="summary" controller="activity" params="[week:1]">Week</g:link>
            </g:else>
        </span>
    </div>
    <table>
        <g:if test="${services}">
            <tr>
                <th>Service</th>
                <th>SM Activities</th>
                <th>High Impact Changes</th>
                <th>SM Success Rate</th>
            </tr>
            <g:each in="${services}" var="service">
                <tr>
                    <td class="summaryprimary">
                        <g:link action="forService" controller="activity" id="${service.id}" title="See Activity for this service">
                            ${service}
                        </g:link>
                    </td>
                    <td>
                        ${summaryMap[service.id]?.smActivities}
                    </td>
                    <td>
                        ${summaryMap[service.id]?.highImpact}
                    </td>
                    <td>
                        <g:render template="/serviceScorecard/metricValue" model="${[type:'/%',value:summaryMap[service.id]?.smSuccessRate?summaryMap[service.id]?.smSuccessRate:0]}"/>
                    </td>
                </tr>
            </g:each>
        </g:if>
    </table>
</div>
</body>
</html>
