<table style="border-collapse:collapse;">
    <thead>
        <tr>
            <th width="100">Service</th>
            <th>Management Process Scorecard</th>
            <th>Overall</th>
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

                </td>

                <!-- Management Process Scorecard-->
                <td>
                    <% def cumulative = 0 %>

                    <g:if test="${scorecards.size()>0}">

                        <g:each in="${scorecards}" var="processScorecard" status="j">
                            <table>
                                <% cumulative += processScorecard.scores.cumulative %>
                                <tr>
                                    <!-- category -->
                                    <td width="75" style="text-align:right;">
                                        <g:link controller="serviceManagementProcess" action="show" id="${processScorecard.process.id}">
                                            ${processScorecard?.process?.category}
                                        </g:link>
                                    </td>
                                    <!-- scores -->
                                    <td>
                                        <g:render template="serviceManagementProcess/scores" model="[scores:processScorecard.scores]"/>
                                    </td>
                                </tr>
                            </table>
                        </g:each>
                    </g:if>
                    <g:else>
                        <span style="font-style:italic;color:darkgray">This service has no management processes defined.</span>
                    </g:else>
                </td>

                <!-- Overall -->
                <td width="10">

                    <g:if test="${cumulative >= scorecards.size()}">
                        <g:prettyScore format="numeric" score="${cumulative}"/>
                    </g:if>
                    <g:else>
                        <g:prettyScore format="numeric" score="${cumulative / scorecards.size()}"/>
                    </g:else>
                </td>

            </tr>
        </g:each>
    </tbody>
</table>