<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="individual"/>
    <title>People: Show Individual</title>
</head>
<body>

<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="buttons">
        <g:form>
            <input type="hidden" name="id" value="${user?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
            <span class="button"><g:actionSubmit class="list" value="List"/></span>
        </g:form>
    </div>
    <div class="view">
        <table>
            <tbody>

                <tr class="prop">
                    <td valign="top" class="name">Login:</td>

                    <td valign="top" class="value">${fieldValue(bean: user, field: 'login')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">First Name:</td>

                    <td valign="top" class="value">${fieldValue(bean: user, field: 'firstName')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Last Name:</td>

                    <td valign="top" class="value">${fieldValue(bean: user, field: 'lastName')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Email:</td>

                    <td valign="top" class="email">
                        <a href="mailto:${fieldValue(bean: user, field: 'email')}">${fieldValue(bean: user, field: 'email')}</a>
                    </td>

                </tr>
               
            </tbody>
        </table>


        <h3 class="section">Teams
            <span class="menuButton"><g:link class="create" action="create" controller="usergroup">Join</g:link></span>
        </h3>
        <table>
            <thead>
                <th>Name</th>
                <th>Description</th>

            </thead>
            <tbody>
                <g:each in="${user?.userGroups}" var="group">
                    <tr>
                        <td>
                            <g:link action="show" controller="usergroup" id="${group.id}">${group?.name}</g:link>

                        </td>
                        <td>
                            ${group?.description}
                        </td>
                    </tr>
                </g:each>
            </tbody>
        </table>

    </div>

</div>
</body>
</html>
