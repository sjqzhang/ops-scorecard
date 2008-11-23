<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Score: Capability Audits</title>

</head>
<body>

<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>


    <g:if test="${capabilityScoreCardList}">
        <div style="margin-bottom:5px;">
            <span style="font-weight:bold; font-size:9px;">Timeframe:</span>
            <span style="font-size:8px;">From: ${scorecardParams?.startDate};
            Until: ${scorecardParams?.endDate}
            </span>
        </div>
        <div class="list">
            <g:render template="capabilityAudit/scorecard" model="[capabilityScoreCardList:capabilityScoreCardList]"/>
        </div>
        <div class="paginateButtons">
            <g:paginate total="${CapabilityScoreCard.count()}"/>
        </div>
    </g:if>
    <g:else>
        <h3>No audits haven been created yet.</h3>
        <h5>Press the &quot;Create an Audit&quot; button to the right to create a new one.</h5>
    </g:else>

</div>
<div class="sidebar">
    <g:render template="sidebar"/>
</div>
</body>
</html>
