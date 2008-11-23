<% def cumulative = 0 %>
<table>
    <thead>
        <tr>
            <th>Change Receipt Scorecard</th>
            <th>Overall</th>
        </tr>
    </thead>
    <tbody>

        <tr>
            <!-- the receipts -->
            <td valign="top">

                <table>
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Date</th>
                            <th>Service</th>
                            <th>C</th>
                            <th>P</th>
                            <th>R</th>
                            <th>T</th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:each in="${changeReceiptScorecardList}" status="i" var="changeScoreCard">
                            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                <!-- receipt -->
                                <td>
                                    <g:link controller="changeReceipt" action="show" id="${changeScoreCard.receipt.id}">
                                        ${changeScoreCard.receipt.title}
                                    </g:link>

                                </td>
                                <!-- date -->
                                <td>
                                ${changeScoreCard.receipt.auditDate}
                                </td>
                                <!--service-->
                                <td>
                                    <g:if test="${changeScoreCard?.receipt?.targetedService}">
                                        <g:link controller="service" action="show" id="${changeScoreCard.receipt.targetedService.id}">
                                            ${changeScoreCard.receipt.targetedService.name}
                                        </g:link>
                                    </g:if>
                                    <g:else>
                                        <i>Service was never specified.</i>
                                    </g:else>
                                </td>

                                <!-- control -->
                                <td width="10">
                                    <g:prettyScore format="numeric" score="${changeScoreCard?.scores?.control}"/>

                                </td>
                                <!-- process -->
                                <td width="10">
                                    <g:prettyScore format="numeric" score="${changeScoreCard?.scores?.process}"/>

                                </td>
                                <!-- repeatability -->
                                <td width="10">
                                    <g:prettyScore format="numeric" score="${changeScoreCard?.scores?.repeatability}"/>
                                </td>
                                <!-- cumulative -->
                                <td width="10">
                                    <g:set var="score" value="${changeScoreCard?.scores?.cumulative}"/>
                                    <g:prettyScore format="numeric" score="${score}"/>
                                    <% cumulative += score %>
                                </td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>

            </td>
            <!-- the rolled up score -->
            <td valign="top">
                <g:prettyScore format="numeric" score="${cumulative}"/>
            </td>
        </tr>
    </tbody>
</table>
