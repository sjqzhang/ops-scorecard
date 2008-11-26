<span style="font-size:12pt;font-weight:bold;">Management Process</span>

<g:each in="${processScorecardMap.keySet()}" status="i" var="serviceId">
    <g:set var="scorecards" value="${processScorecardMap[serviceId]}"/>
    <g:set var="service" value="${Service.get(serviceId)}"/>

    <%
        def cumulative = 0
        scorecards.each {
            cumulative += it.scores.cumulative
        }
        def cumAvg = cumulative / scorecards.size()
    %>
    <g:if test="${scorecards.size()>0}">

        <g:render template="/common/barchart" model="[label:'Process quality', position:cumAvg]"/>

        <h4>By process category</h4>

        <table>
            <tbody>
                <g:each in="${scorecards}" var="processScorecard" status="j">

                    <tr>                        
                        <!-- scores -->
                        <td style="padding:0;">
                        <g:if test="${processScorecard?.process?.id}">
                            <g:render template="/common/barchart" model="[label:processScorecard?.process?.category,
                            position:processScorecard.scores.cumulative,
                            url:createLink(controller:'serviceManagementProcess',action:'show',id:processScorecard.process.id),
                            title:processScorecard.process.name]"/>
                        </g:if>
                        <g:else>
                            <g:render template="/common/barchart" model="[label:processScorecard?.process?.category,
                            position:processScorecard.scores.cumulative,
                            title:'process has not been defined']"/>
                        </g:else>

                        </td>
                    </tr>

                </g:each>
            </tbody>
        </table>
    </g:if>
    <g:else>
        <span style="font-style:italic;color:darkgray">This service has no management processes defined.</span>
    </g:else>

</g:each>
