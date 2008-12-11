<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="team"/>
    <title>People: Edit Team</title>
</head>
<body>

<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${usergroup}">
        <div class="errors">
            <g:renderErrors bean="${usergroup}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form method="post">
        <input type="hidden" name="id" value="${usergroup?.id}"/>

            <div class="buttons">
                <span class="button"><g:actionSubmit class="delete" value="Delete"/></span>
            </div>
    </g:form>
    <g:form method="post">
        <input type="hidden" name="id" value="${usergroup?.id}"/>
        <div class="dialog">
            <div class="formtitle">Edit User Group</div>
            <table>
                <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="name">Name:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: usergroup, field: 'name', 'errors')}">
                            <input type="text" id="name" name="name" value="${fieldValue(bean: usergroup, field: 'name')}"/>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="description">Description:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: usergroup, field: 'description', 'errors')}">
                            <input type="text" id="description" name="description" value="${fieldValue(bean: usergroup, field: 'description')}"/>
                        </td>
                    </tr>                    

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="users">Individuals:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: usergroup, field: 'users', 'errors')}">
                            <table>

                                <g:each var="u" in="${User.list()}">
                                    <tr>
                                        <td style="width:16px">
                                            <g:if test="${usergroup.users.contains(u)}">
                                                <input type="checkbox" name="cb.users" value="${u.id}" checked="${checked}" id="user_${u.id}"/>
                                            </g:if>
                                            <g:else>
                                                <input type="checkbox" name="cb.users" value="${u.id}"  id="user_${u.id}"/>
                                            </g:else>
                                        </td>
                                        <td>
                                            <label for="user_${u.id}">${u?.firstName} ${u?.lastName}</label>
                                            (<g:link action="show" controller="user" id="${u.id}">${u.login}</g:link>)
                                        </td>
                                    </tr>
                                </g:each>

                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>

            <div class="buttons">
                <span class="button"><g:actionSubmit  value="Update"/></span>
                <span class="button"><g:actionSubmit action="list" value="Cancel"/></span>
            </div>
        </div>

    </g:form>
</div>
<div class="sidebar">
    <g:render template="sidebar"/>
</div>
</body>
</html>
