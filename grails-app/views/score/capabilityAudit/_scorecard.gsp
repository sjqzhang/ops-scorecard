<%def cumulative = 0 %>
<table>
    <thead>
        <tr>
            <th>Capability Audit Scorecard</th>
            <th>Overall</th>
        </tr>
    </thead>
    <tbody>

        <tr>
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
                                        <g:link controller="capabilityAudit" action="show" id="${capabilityScoreCard.audit.id}">
                                            ${capabilityScoreCard.audit.title}
                                        </g:link>
                                    </g:if>
                                    <g:else>
                                        <i>Service was never specified.</i>
                                    </g:else>
                                </td>
                                <!-- control -->
                                <td width="10">
                                    <g:prettyScore format="numeric" score="${capabilityScoreCard?.scores?.control}"/>

                                </td>
                                <!-- process -->
                                <td width="10">
                                    <g:prettyScore format="numeric" score="${capabilityScoreCard?.scores?.process}"/>

                                </td>
                                <!-- repeatability -->
                                <td width="10">
                                    <g:prettyScore format="numeric" score="${capabilityScoreCard?.scores?.repeatability}"/>
                                </td>
                                <!-- cumulative -->
                                <td width="10">
                                    <g:set var="score" value="${capabilityScoreCard?.scores?.cumulative}"/>
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