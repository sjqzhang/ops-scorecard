<h2>Capability</h2>
<table style="border:0;">
    <tbody>
        <g:each in="${capabilityScoreCardMap.keySet()}" var="serviceId">
            <g:set var="scorecards" value="${capabilityScoreCardMap[serviceId]}"/>
            <g:set var="service" value="${Service.get(serviceId)}"/>
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

                    <g:if test="${scorecards.size()>0}">
                        <!-- the chart -->
                        <g:render template="capabilityAudit/chart" model="[id:serviceId, scorecards:scorecards]"/>
                                                
                        <g:render template="/common/barchart" model="[label:'Audit average',position:cumAvg]"/>


                        </table>
                        <table>
                            <thead>
                                <tr>
                                    <th>Audit</th>
                                    <th width="65">Control</th>
                                    <th width="65">Process</th>
                                    <th width="65">Average</th>
                                </tr>
                            </thead>
                            <g:each in="${scorecards}" var="scorecard" status="j">

                                <tbody>
                                    <tr>
                                       <g:render template="capabilityAudit/scorecard" model="[scorecard:scorecard]"/>
                                    </tr>
                                </tbody>

                            </g:each>
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