<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="team"/>
    <title>People: Show Team</title>
</head>
<body>

<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="buttons">
        <g:form>
            <input type="hidden" name="id" value="${usergroup?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
            <span class="button"><g:actionSubmit class="list" value="List"/></span>

        </g:form>
    </div>
    <div class="view">
        <div class="header">
            <span class="name"><g:link controller="usergroup" action="show" id="${usergroup?.id}">${fieldValue(bean: usergroup, field: 'name')}</g:link></span>
            <span class="desc">${usergroup?.description}</span>
        </div>


        <h3 class="section">Individuals
            <span class="menuButton"><g:link class="create" action="create" controller="user">Create</g:link></span>
        </h3>
        <table>
            <thead>
                <th>Login</th>
                <th>First</th>
                <th>Last</th>
            </thead>
            <tbody>
                <g:each in="${usergroup?.users}" var="u">
                    <tr>
                        <td>
                            <g:link controller="user" action="show" id="${u.id}">${u.login}</g:link>
                        </td>
                        <td>
                            ${u.firstName}
                        </td>
                        <td>
                            ${u.lastName}
                        </td>
                    </tr>
                </g:each>
            </tbody>
        </table>

    </div>

</div>
<div class="sidebar">
    <g:render template="sidebar"/>
</div>
</body>
</html>
