<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Audit: Scorecard List</title>

</head>
<body>

<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>

    <g:if test="${processScorecardMap}">
        <div class="list">
            <table border="1">
                <thead>
                    <tr>
                        <th width="100">Service</th>
                        <th>Management Process Scorecard</th>
                        <th>Grade</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${processScorecardMap.keySet()}" status="i" var="serviceId">
                        <g:set var="scorecards" value="${processScorecardMap[serviceId]}"/>
                        <g:set var="service" value="${Service.get(serviceId)}"/>
                        <tr>
                            <!-- Targeted Service -->
                            <td>
                                <g:link controller="service" action="show" id="${serviceId}">
                                    ${service.name}
                                </g:link>
                                <g:if test="${service?.type}">
                                    [<g:link controller="resourceType" action="show" id="${service.type.id}">${service.type.name}</g:link>]
                                </g:if>
                            </td>

                            <!-- Management Process Scorecard-->
                            <td>
                                <% def cumulative = 0 %>

                                <g:each in="${scorecards}" var="processScorecard" status="j">
                                    <table>
                                        <% cumulative += processScorecard.scores.cumulative %>
                                    <tr>
                                            <!-- category -->
                                            <td width="75" style="text-align:right;">
                                                <g:link action="show" id="${processScorecard.process.id}">
                                                    ${processScorecard?.process?.category}
                                                </g:link>
                                            </td>
                                            <!-- scores -->
                                            <td>
                                                <g:render template="scorecard" model="[scores:processScorecard.scores]"/>
                                            </td>
                                        </tr>
                                    </table>
                                </g:each>

                            </td>

                            <!-- Grade -->
                            <td width="10">
                                ${cumulative / scorecards.size()}
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
    </g:if>
</div>
<div class="sidebar">
    <g:render template="sidebar"/>
</div>
</body>
</html>
