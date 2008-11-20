

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Process: Create Scorecard</title>
    </head>
    <body>  
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${processScoreCard}">
            <div class="errors">
                <g:renderErrors bean="${processScoreCard}" as="list" />
            </div>
            </g:hasErrors>
            <g:set var="services" value="${Service.list()}"/>
            <g:if test="${services}">
            <g:form action="listScorecards" method="post" >
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="resourceType">Service Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:processScoreCard,field:'resourceType','errors')}">
                                    <g:select optionKey="id" from="${ResourceType.list()}" name="resourceType.id"  noSelection="['null':'']"></g:select>
                                </td>
                            </tr>
                                        <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="serviceName">Service Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:processScoreCard,field:'serviceName','errors')}">
                                    <g:textField name="serviceName" value=""/>
                                </td>
                            </tr>
                               <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ownerResponsible">Owner Responsible:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:processScoreCard,field:'ownerResponsible','errors')}">
                                    <g:select optionKey="id" from="${User.list()}" name="user.id"  noSelection="['null':'']"></g:select>
                                </td>
                            </tr>
                            <g:each var="category" in="${ServiceManagementProcess.constraints.category.inList}">
                                <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="${category}">${category}:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:processScoreCard,field:'service','errors')}">
                                    <g:checkBox name="category.include.${category}" value="${true}" />
                                </td>
                            </tr>
                            </g:each>
                        </tbody>
                    </table>
                </div>

            </g:form>
            </g:if>
            <g:else>
                <div class="dialog">
                    <h3>Cannot create a scorecard</h3>
                    <p>No Services exist yet. Go to the Inventory manager and
                    <g:link controller="service" action="create">Create a Service</g:link>.</p>
                </div>
            </g:else>
        </div>
    </body>
</html>
