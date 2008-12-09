<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Scorecards</title>
    <g:javascript src="dojo/dojo.js"/>
</head>
<body>
<g:set var="services" value="${Service.list()}"/>
<g:if test="${services}">
    <div class="body" style="width:600px;">
        <g:if test="${scoreMap}">
            <g:each in="${scoreMap.keySet()}" var="serviceId">
                <!-- Looking up scorecard data for service.id=${serviceId} -->
                <g:set var="serviceScoreMap" value="${scoreMap[serviceId]}"/>

                <!-- render the scorecard for the service -->
                <g:render template="serviceScorecard" model="[serviceScoreMap:serviceScoreMap]"/>

            </g:each>

            <!-- Inventory activity -->
            <g:if test="${scoreServicesParams?.cards.contains('inventory')}">
              <g:render template="inventory/scorecard" model="[service:service,inventoryScorecardList:serviceScoreMap['inventory']]"/>
            </g:if>

        </g:if>
        <g:else>
            <div class="dialog">
                <h3>No scorecard configured</h3>
                <p>Specify the form parameters and then press the &quot;Score&quot; button.</p>
            </div>
        </g:else>

    </div>
    <div class="sidebar">
        <g:render template="sidebar" model="[services:services]"/>
    </div>
</g:if>
<g:else>
    <div class="dialog">
        <h3>Cannot create scorecards</h3>
        <p>No Services exist yet. Go to the Inventory manager and
        <g:link controller="service" action="create">create a Service</g:link>.</p>
    </div>
</g:else>
</body>
</html>
