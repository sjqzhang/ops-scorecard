

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

<!-- People coverage -->
<g:if test="${scoreServicesParams?.cards.contains('people')}">
    <g:render template="people/scorecard" model="[service:service]"/>
    <br/>
</g:if>

<!-- Change activity -->
<g:if test="${serviceScoreMap['activity']}">
    <g:render template="processReceipt/scorecard" model="[processReceiptScorecardList:serviceScoreMap['activity']]"/>
    <br/>
</g:if>

<!-- Inventory activity -->
<g:if test="${serviceScoreMap['inventory']}">
    <g:render template="inventory/scorecard" model="[inventoryScorecardList:serviceScoreMap['inventory']]"/>
    <br/>
</g:if>


<p>&nbsp;</p>
<p>&nbsp;</p>
