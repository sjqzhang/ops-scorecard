<span style="font-size:12pt;font-weight:bold;">Process Activity</span>

<g:if test="${processReceiptScorecardList && processReceiptScorecardList.size()>0 }">

    <%
        def cumulative = 0
        processReceiptScorecardList.each {
            cumulative += it.scores.cumulative
        }
        def cumAvg = cumulative / processReceiptScorecardList.size()
    %>
<g:render template="/common/barchart" model="[label:'Activity quality',position:cumAvg]"/>


<table>
    <thead>
        <tr>
            <th>Title</th>
            <th>Date</th>
            <th>Outcome</th>
            <th>Score</th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${processReceiptScorecardList}" status="i" var="changeScoreCard">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <!-- receipt -->
                <td>
                    <g:link controller="processReceipt" action="show" id="${changeScoreCard.receipt.id}">
                        ${changeScoreCard.receipt.title}
                    </g:link>

                </td>
                <!-- date -->
                <td>
                    ${changeScoreCard.receipt.date}
                </td>
                <!--outcome-->                               
                <td>
                ${fieldValue(bean:changeScoreCard.receipt, field:'outcome')}
                </td>

                <!-- Score -->
                <td width="10">
                    <g:set var="score" value="${changeScoreCard?.scores?.cumulative}"/>
                    <g:prettyScore format="numeric" score="${score}"/>
                    <% cumulative += score %>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
</g:if>
<g:else>
    <p>No change activity.</p>
</g:else>
