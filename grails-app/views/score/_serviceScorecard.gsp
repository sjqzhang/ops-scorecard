

<g:set var="service" value="${serviceScoreMap['service']}"/>

<!-- Service summary info -->
<g:render template="/service/summary" model="[service:service]"/>


<!-- Capability audit: ${service.name}[${service.type.name}] -->

<g:if test="${serviceScoreMap['audit']}">
    <g:render template="capabilityAudit/summary" model="[service:service, auditScoreCardMap:serviceScoreMap['audit'],scoreServicesParams:scoreServicesParams]"/>

</g:if>

<!-- Management process -->
<g:if test="${serviceScoreMap['process']}">
    <g:render template="serviceManagementProcess/scorecard" model="[service:service, processScorecardMap:serviceScoreMap['process']]"/>
</g:if>

<!-- People coverage -->
<g:if test="${scoreServicesParams?.cards.contains('people')}">
    <g:render template="people/scorecard" model="[service:service]"/>
</g:if>

<!-- Change activity -->
<g:if test="${serviceScoreMap['activity']}">
    <g:render template="processReceipt/scorecard" model="[service:service,processReceiptScorecardList:serviceScoreMap['activity']]"/>
    <br/>
</g:if>
