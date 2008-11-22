<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>People: Edit Invididual</title>
</head>
<body>
<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${user}">
        <div class="errors">
            <g:renderErrors bean="${user}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form method="post">
        <input type="hidden" name="id" value="${user?.id}"/>
        <div class="buttons">
            <span class="button"><g:actionSubmit class="save" value="Update"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
            <span class="button"><g:actionSubmit class="list" value="List"/></span>

        </div>
        <div class="dialog">
            <table>
                <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="login">Login:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: user, field: 'login', 'errors')}">
                            <input type="text" id="login" name="login" value="${fieldValue(bean: user, field: 'login')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="firstName">First Name:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: user, field: 'firstName', 'errors')}">
                            <input type="text" id="firstName" name="firstName" value="${fieldValue(bean: user, field: 'firstName')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="lastName">Last Name:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: user, field: 'lastName', 'errors')}">
                            <input type="text" id="lastName" name="lastName" value="${fieldValue(bean: user, field: 'lastName')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="email">Email:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: user, field: 'email', 'errors')}">
                            <input type="text" id="email" name="email" value="${fieldValue(bean: user, field: 'email')}"/>
                        </td>
                    </tr>

                    <g:if test="${session.user==user.login}">
                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="login">Password:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: user, field: 'password', 'errors')}">
                                <input type="password" id="password" name="password" value="${fieldValue(bean: user, field: 'password')}"/>
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="login">Confirm password:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: user, field: 'confirm', 'errors')}">
                                <input type="password" id="confirm" name="confirm" value="${fieldValue(bean: user, field: 'confirm')}"/>
                            </td>
                        </tr>
                    </g:if>
                 
                </tbody>
            </table>
        </div>

    </g:form>
</div>
<div class="sidebar">
    <g:render template="sidebar"/>
</div>
</body>
</html>
