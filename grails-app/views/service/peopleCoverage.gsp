<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="service"/>
    <title>Service: People Coverage</title>
</head>
<body>
<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="buttons">
        <g:form>
            <input type="hidden" name="id" value="${service?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
            <span class="button"><g:actionSubmit class="list" value="List"/></span>
        </g:form>
    </div>
    <div class="dialog">
        <g:set var="processes" value="${ServiceManagementProcess.findAllByService(service)}"/>
        <g:if test="${processes}">
            <g:render template="peopleCoverageSummary" model="[processes:processes]"/>
            <br/>
            <g:render template="peopleCoverage" model="[processes:processes]"/>
        </g:if>
    </div>
</div>
</body>
</html>