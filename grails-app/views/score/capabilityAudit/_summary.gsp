<span style="font-size:12pt;font-weight:bold;">Capability</span>
<table style="border:0;">
    <tbody>
        <g:each in="${capabilityScoreCardMap.keySet()}" var="serviceId">
            <g:set var="scorecards" value="${capabilityScoreCardMap[serviceId]}"/>
            <g:set var="service" value="${Service.get(serviceId)}"/>
            <g:set var="scorecard" value="${scorecards.get(scorecards.size()-1)}"/>            
            <tr>
                
                <!-- the audits -->
                <td valign="top">
                <%
                    def cumulative = 0
                    scorecards.each {
                      cumulative += it.scores.cumulative
                    }
                    def cumAvg = cumulative / scorecards.size()
                    %>

                    <g:if test="${scorecard}">
                        <!-- the chart -->
                        <g:render template="capabilityAudit/chart" model="[scorecards:scorecards]"/>
                                                
                        <g:render template="/common/barchart" model="[label:'Audit average',position:cumAvg]"/>

                        <div style="margin-top:10px;margin-bottom:5px;">
                        <g:link action="show" controller="capabilityAudit" id="${scorecard.audit.id}" title="${scorecard.audit.title}">Last Audit: </g:link>${scorecard.audit.auditDate}
                        </div>
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
                                    <g:render template="capabilityAudit/scorecard" model="[scorecard:scorecard]"/>
                                 </tr>
                            </tbody>
                        </table>
                    </g:if>
                    <g:else>
                        <span style="font-style:italic;color:darkgray">This service has not been audited.</span>
                    </g:else>
                </td>
                
            </tr>
        </g:each>
    </tbody>

</table>