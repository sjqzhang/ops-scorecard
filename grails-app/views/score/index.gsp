<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Score</title>
</head>
<body>
<div class="body">

    <g:render template="capabilityAudit/scorecard"/>

    <br/>
        
    <g:render template="serviceManagementProcess/scorecard" model="[processScorecardMap:processScorecardMap]"/>
</div>
<div class="sidebar">
    <g:render template="sidebar"/>
</div>
</body>
</html>
