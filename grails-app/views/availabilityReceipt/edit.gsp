<%--
  Created by IntelliJ IDEA.
  User: greg
  Date: Dec 16, 2008
  Time: 3:24:27 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="availabilityreceipt"/>
    <title>Availability Receipt: View: ${availabilityreceipt?.id}</title>
</head>
<body>


    <div class="body">
        <div class="buttons">
        <g:form>
            <input type="hidden" name="id" value="${availabilityReceipt?.id}"/>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
        </g:form>
    </div>
    <div class="view">
        <g:render template="edit" model="${model}"/>
    </div>

</body>
</html>
