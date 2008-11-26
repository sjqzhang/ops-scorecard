<%--<g:set var="serviceScoreMap" value="${scoreMap[serviceId]}"/>--%>

<g:set var="service" value="${serviceScoreMap['service']}"/>

<!-- Service summary info -->
<g:render template="/service/summary" model="[service:service]"/>

<br/>

<!-- Capability audit -->
<g:if test="${serviceScoreMap['audit']}">
    <g:render template="capabilityAudit/summary" model="[capabilityScoreCardMap:serviceScoreMap['audit']]"/>

    <br/>
</g:if>

<!-- Management process -->
<g:if test="${serviceScoreMap['process']}">
    <g:render template="serviceManagementProcess/scorecard" model="[processScorecardMap:serviceScoreMap['process']]"/>
    <br/>
</g:if>

<!-- Change activity -->
<g:if test="${serviceScoreMap['activity']}">
    <g:render template="changeReceipt/scorecard" model="[changeReceiptScorecardList:serviceScoreMap['activity']]"/>
    <br/>
</g:if>

<p>&nbsp;</p>
<p>&nbsp;</p>
