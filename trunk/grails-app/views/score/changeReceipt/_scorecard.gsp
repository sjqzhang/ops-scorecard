<span style="font-size:12pt;font-weight:bold;">Change Activity</span>



    <%
        def cumulative = 0
        changeReceiptScorecardList.each {
            cumulative += it.scores.cumulative
        }
        def cumAvg = cumulative / changeReceiptScorecardList.size()
    %>
<g:render template="/common/barchart" model="[label:'Activity quality',position:cumAvg]"/>


<table>
    <thead>
        <tr>
            <th>Title</th>
            <th>Date</th>
            <th>Outcome</th>
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
                <!--outcome-->                               
                <td>
                ${fieldValue(bean:changeScoreCard.receipt, field:'changeOutcome')}
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
