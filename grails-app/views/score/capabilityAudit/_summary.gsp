<span style="font-size:12pt;font-weight:bold;">Capability Audits</span>


<g:each in="${auditScoreCardMap.keySet()}" var="serviceId" status="i">
    <!-- serviceId=${serviceId} -->
    <g:set var="scorecards" value="${auditScoreCardMap[serviceId]}"/>
    <%
        def controlSum = 0
        def processSum = 0
        def cumulativeSum = 0
        def cumAvg = 0
        def ctlAvg = 0
        def proAvg = 0
    %>
    <g:if test="${scorecards}">
        <%
            scorecards.each {
                controlSum += it.scores.control
                processSum += it.scores.process
                cumulativeSum += it.scores.cumulative
            }
            cumAvg = cumulativeSum / scorecards.size()
            ctlAvg = controlSum / scorecards.size()
            proAvg = processSum / scorecards.size()
        %>

        <!-- the chart -->
        <h5>Average scores over the last ${scorecards.size()} audits</h5>
        <g:render template="capabilityAudit/chart" model="[id:service.id,scorecards:scorecards]"/>

        <!-- the metrics -->
        <h5>Score averages over the last ${scorecards.size()} audits</h5>
        <table>
            <tbody>
                <tr>
                    <td>
                        <g:render template="/common/barchart" model="[label:'Control Average', position:ctlAvg]"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <g:render template="/common/barchart" model="[label:'Process Average', position:proAvg]"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <g:render template="/common/barchart" model="[label:'Cumulative Average', position:cumAvg]"/>

                    </td>
                </tr>
            </tbody>
        </table>
        <div style="margin-top:10px;margin-bottom:5px;">
            <g:set var="scorecard" value="${scorecards.get(scorecards.size()-1)}"/>
            Last Audit:
            <g:link action="show" controller="capabilityAudit" id="${scorecard.audit.id}"
                    title="${scorecard.audit.title}">${scorecard.audit.title}</g:link>
            By: <g:link action="show" controller="user" id="${scorecard.audit?.id}">${scorecard.audit?.auditor}</g:link>
            Date: ${scorecard.audit.auditDate}
        </div>

    </g:if>
    <g:else>
        <span style="font-style:italic;color:darkgray">This service has not been audited.</span>
    </g:else>
</g:each>

