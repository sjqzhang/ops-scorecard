<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Audit: Scorecard List</title>

</head>
<body>

<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>

    <g:if test="${processScorecardMap}">
        <div class="list">
            <g:render template="serviceManagementProcess/scorecard" model="[processScorecardMap:processScorecardMap]"/>
        </div>
    </g:if>
</div>
<div class="sidebar">
    <g:render template="sidebar"/>
</div>
</body>
</html>
