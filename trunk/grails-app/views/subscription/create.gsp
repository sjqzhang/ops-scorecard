<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="index"/>
    <title>Create Subscription</title>
</head>
<body>

<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${subscription}">
        <div class="errors">
            <g:renderErrors bean="${subscription}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form action="save" method="post">
        <g:hiddenField name="user" value="${session.user}"/>
        <div class="buttons">
            <span class="button"><input class="save" type="submit" value="Save"/></span>
        </div>
        <div class="dialog">
            <table>
                <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="service">Service:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: subscription, field: 'service', 'errors')}">
                            <g:select optionKey="id" from="${Service.list()}" name="service.id" value="${subscription?.service?.id}"></g:select>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

    </g:form>
</div>
</body>
</html>
