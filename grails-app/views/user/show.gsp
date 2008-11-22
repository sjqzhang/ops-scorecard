

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>People: Show Individual</title>
    </head>
    <body>
       
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${user?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                    <span class="button"><g:actionSubmit class="list" value="List" /></span>
                </g:form>
            </div>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">Login:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:user, field:'login')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">First Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:user, field:'firstName')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:user, field:'lastName')}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="email">Email:</td>

                            <td valign="top" class="value">
                                <a href="mailto:${fieldValue(bean:user, field:'email')}">${fieldValue(bean:user, field:'email')}</a>
                            </td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="email">Teams:</td>

                            <td valign="top" class="value">
                                <g:each in="${user.userGroups}">
                                    <g:link action="show" controller="usergroup" id="${it.id}">${it.name}</g:link>
                                </g:each>

                            </td>

                        </tr>
                                           
                    </tbody>
                </table>
            </div>

        </div>
      <div class="sidebar">
            <g:render template="sidebar"/>
        </div>
    </body>
</html>
