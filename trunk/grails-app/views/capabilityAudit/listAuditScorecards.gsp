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


    <g:if test="${capabilityScoreCardList}">
        <% def cumulative = 0 %>
        <div class="list">
            <table>
                <thead>
                    <tr>
                        <th width="50">Timeframe</th>
                        <th>Audits</th>
                        <th>Grade</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <!-- timeframee -->
                        <td>
                            Start: ${scorecardParams?.startDate}<br/>
                            End: ${scorecardParams?.endDate}
                        </td>
                        <!-- the audits -->
                        <td valign="top">

                            <table>
                                <thead>
                                    <tr>

                                        <th>&nbsp;</th>
                                        <th width="65">Control</th>
                                        <th width="65">Process</th>
                                        <th width="65">Repeatability</th>
                                        <th width="65">Cumulative</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <g:each in="${capabilityScoreCardList}" status="i" var="capabilityScoreCard">
                                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                            <!-- audit -->
                                            <td>
                                                <g:if test="${capabilityScoreCard?.audit.id}">
                                                    <g:link action="show" id="${capabilityScoreCard.audit.id}">
                                                        ${capabilityScoreCard.audit.title}
                                                    </g:link>
                                                </g:if>
                                                <g:else>
                                                    <i>Service was never specified.</i>
                                                </g:else>
                                            </td>
                                          

                                            <!-- control -->
                                            <td width="10">
                                                <span class="lettergrade">${capabilityScoreCard?.scores?.control}</span>

                                            </td>
                                            <!-- process -->
                                            <td width="10">
                                                <span class="lettergrade">${capabilityScoreCard?.scores?.process}</span>

                                            </td>
                                            <!-- repeatability -->
                                            <td width="10">
                                                <g:set var="score" value="${capabilityScoreCard?.scores?.repeatability}"/>
                                                <span class="lettergrade">${score}</span>
                                            </td>
                                            <!-- cumulative -->
                                            <td width="10">
                                                <g:set var="score" value="${capabilityScoreCard?.scores?.cumulative}"/>
                                                <span class="lettergrade">${score}</span>
                                                <% cumulative += score %>
                                            </td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>

                        </td>
                        <!-- the rolled up score -->
                        <td valign="top">
                            <span class="lettergrade">${cumulative}</span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="paginateButtons">
            <g:paginate total="${CapabilityScoreCard.count()}"/>
        </div>
    </g:if>
    <g:else>
        <h3>No audits haven been created yet.</h3>
        <h5>Press the &quot;Create an Audit&quot; button to the right to create a new one.</h5>
    </g:else>

</div>
<div class="sidebar">
    <g:render template="sidebarScorecard"/>
</div>
</body>
</html>
