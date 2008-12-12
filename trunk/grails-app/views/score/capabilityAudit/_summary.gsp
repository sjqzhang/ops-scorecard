<h2>Capability Audits</h2>


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
        <h3>Average scores over the last ${scorecards.size()} audits</h3>
        <div class="section">
        <g:render template="capabilityAudit/chart" model="[id:service.id,scorecards:scorecards]"/>
        </div>

        <!-- the metrics -->
        <h3>Score averages over the last ${scorecards.size()} audits</h3>
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
        <div style="margin:10px;">
            <g:set var="scorecard" value="${scorecards.get(scorecards.size()-1)}"/>
            Last Audit:
            <g:link action="show" controller="capabilityAudit" id="${scorecard.audit.id}"
                    title="${scorecard.audit.title}">${scorecard.audit.title}</g:link>
            by <g:link action="show" controller="user" id="${scorecard.audit?.id}">${scorecard.audit?.auditor}</g:link>
            at <span title="${scorecard.audit.auditDate.toString().encodeAsHTML()}"><g:relativeDate atDate="${scorecard.audit.auditDate}"/></span>

            <span class="controllink" id="auditscores_show_${service.id}"
                    onclick="$('auditscores_${service.id}').show(); $('auditscores_show_${service.id}').hide();">Show all</span>
        </div>

        <div id="auditscores_${service.id}" style="display:none;">
            <span class="controllink"
                    onclick="$('auditscores_${service.id}').hide();$('auditscores_show_${service.id}').show();">Hide</span>
            <table>
            <g:each in="${scorecards}" var="sc">
                <tr>
                    <td>
                        <g:link action="show" controller="capabilityAudit" id="${sc.audit.id}">
                        ${sc.audit.title}
                            </g:link>
                    </td>
                    <td>
                        ${sc.audit.auditor}
                    </td>
                    <td>
                        <g:relativeDate atDate="${sc.audit.auditDate}"/>
                    </td>
                    <td>
                        <g:prettyScore format="numeric" score="${sc.scores.cumulative}"/>                        
                    </td>
                </tr>
            </g:each>
            </table>
        </div>


    </g:if>
    <g:else>
        <div class="empty sectiondesc">This service has not been audited.</div>
    </g:else>
</g:each>

