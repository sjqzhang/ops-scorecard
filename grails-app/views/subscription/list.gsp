

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="index" />
        <title>Subscription List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Subscription</g:link></span>
        </div>
        <div class="body">
            <h1>Subscription List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                 <ul id="subscriptions">
                      <g:render template="subscription" var="subscription"
                          collection="${subscriptionInstanceList}" />
                 </ul>
                 <p>
                     <g:formRemote name="save" method="post"
                             action="save" url="${[controller:'subscription', action:'save']}"
                             update="subscriptions">
                         <g:hiddenField name="user" value="${session.user}"/>                         
                         Add Service: <g:select name="service.id" from="${Service.list()}" optionKey="id" />
                         <span class="button"><input class="save" type="submit" value="Add" /></span>                         
                     </g:formRemote>
                 </p>
            </div>
        </div>
    </body>
</html>
