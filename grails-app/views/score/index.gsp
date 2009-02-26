<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="scorecard"/>
    <title>Scorecards</title>

    <g:javascript>
        var Timeplot_urlPrefix="${createLinkTo(dir:'js',file:'/timeplot/api/1.0/')}";
    </g:javascript>
    <g:javascript src="ajax/api-2.0/simile-ajax-api.js"/>
    <g:javascript src="timeline/api-2.0/timeline-api.js"/>
    <g:javascript src="timeplot/api/1.0/timeplot-api.js"/>
    <script type="text/javascript">
        SimileAjax.History.enabled = false;
    </script>
</head>
<body>
<g:set var="services" value="${Service.list()}"/>
<g:if test="${services}">
        <g:if test="${scoreMap}">

            <div class="body scorecard view" style="width:600px;">
                    <div class="dialog" style="display:none;" id="scoreform">
                        <g:render template="form" model="[services:services,scoreServicesParams:scoreServicesParams,canceljs:'$(\'scoreform\').hide();$(\'sformbutton\').show();']"/>
                    </div>
                    <div>
                        <span class="action link" id="sformbutton" onclick="$('scoreform').show();this.hide();">
                            Edit Scorecard Parameters &hellip;
                        </span>
                    </div>
                    <g:each in="${scoreMap.keySet()}" var="serviceId">
                        <!-- Looking up scorecard data for service.id=${serviceId} -->
                        <g:set var="serviceScoreMap" value="${scoreMap[serviceId]}"/>

                        <!-- render the scorecard for the service -->
                        <g:render template="serviceScorecard" model="[serviceScoreMap:serviceScoreMap,scoreServicesParams:scoreServicesParams]"/>

                    </g:each>

                    <!-- Inventory activity -->
                    <g:if test="${scoreServicesParams?.cards.contains('inventory')}">
                      <g:render template="inventory/scorecard" model="[service:service,inventoryScorecardList:serviceScoreMap['inventory']]"/>
                    </g:if>

            </div>
        </g:if>
        <g:else>
            <div class="info" style="width:600px;">
                <h3>No scorecard configured</h3>
                <div class="info">Specify the form parameters and then press the &quot;Generate&quot; button.</div>
            </div>
            <div class="body dialog">
                <g:render template="form" model="[services:services]"/>
            </div>
        </g:else>

</g:if>
<g:else>
        <h3>Cannot create scorecards</h3>
        <div class="info">No Services exist yet. Go to the Inventory manager and
        <g:link controller="service" action="create">create a Service</g:link>.</div>
</g:else>
</body>
</html>
