<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Score: Change Receipts</title>

</head>
<body>

<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>


    <g:if test="${processReceiptScorecardList}">
        <div style="margin-bottom:5px;">
            <span style="font-weight:bold; font-size:9px;">Timeframe:</span>
            <span style="font-size:8px;">From: ${scorecardParams?.startDate};
            Until: ${scorecardParams?.endDate}
            </span>
        </div>
        <div class="list">
            <g:render template="processReceipt/scorecard" model="[processReceiptScorecardList:processReceiptScorecardList]"/>
        </div>
        <div class="paginateButtons">
            <g:paginate total="${processReceiptScorecardList.count()}"/>
        </div>
    </g:if>
    <g:else>
        <h3>No audits haven been created yet.</h3>
        <div class="info">Press the &quot;Create an Receipt&quot; button to the right to create a new one.</div>
    </g:else>

</div>
</body>
</html>
