

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>People: Individuals Search results</title>
    </head>
    <body>        
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:if test="${userList}">
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <td>&nbsp;</td>

                   	        <g:sortableColumn property="login" title="Login" />
                        
                   	        <g:sortableColumn property="firstName" title="First Name" />
                        
                   	        <g:sortableColumn property="lastName" title="Last Name" />

                               <g:sortableColumn property="userGroup" title="Team" />
                               <g:sortableColumn property="email" title="Email" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${userList}" status="i" var="user">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}"
                                onmouseover="$('controls.${user.id}').show();"
                                onmouseout="$('controls.${user.id}').hide();">
                            <td width="16px">
                               <div id="controls.${user.id}" style="display:none">
                                <g:link action="edit" params="[id:user.id]">
                                    <img src="${createLinkTo(dir:'images/skin',file:'database_edit.png')}" alt="edit" />
                                </g:link>
                               </div>
                            </td>

                            <td>${fieldValue(bean:user, field:'login')}</td>

                            <td>${fieldValue(bean:user, field:'firstName')}</td>
                        
                            <td>${fieldValue(bean:user, field:'lastName')}</td>
                                                
                            <td>
                               <g:if test="${user?.userGroup}">                                
                                <g:link controller="usergroup" action="show" params="[id:user.userGroup.id]">
                                    ${fieldValue(bean:user, field:'userGroup')}
                                </g:link>
                               </g:if>
                            </td>
                            <td>
                                <a href="mailto:${fieldValue(bean:user, field:'email')}">${fieldValue(bean:user, field:'email')}</a>
                            </td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${User.count()}" />
            </div>
            </g:if>
            <g:else>
      <div class="dialog">
                <h3>There are no individuals that matched the search criteria.</h3>
                <h5>Press the &quot;All Individual&quot; link to the right to any available ones.</h5>
           </div>
            </g:else>
        </div>
        <div class="sidebar">
            <g:render template="sidebar"/>
        </div>
    </body>
</html>
