

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <meta name="guideitem" content="individual"/>
        <title>People: Individuals</title>
    </head>
    <body>        
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="buttons">
        <g:form>
                 <span class="button"><g:actionSubmit class="create" value="Create"/></span>
        </g:form>
            </div>
            <g:if test="${userList}">
            <div class="dialog">
                <table>
                    <thead>
                        <tr>
                            <td>&nbsp;</td>

                   	        <g:sortableColumn property="login" title="Login" />
                        
                   	        <g:sortableColumn property="firstName" title="First Name" />
                        
                   	        <g:sortableColumn property="lastName" title="Last Name" />

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
                                    <img src="${createLinkTo(dir:'images/skin',file:'pencil.png')}" alt="edit" />
                                </g:link>
                               </div>
                            </td>

                            <td>
                                <g:link action="show" id="${fieldValue(bean:user, field:'id')}">${fieldValue(bean:user, field:'login')}</g:link>
                            </td>

                            <td>${fieldValue(bean:user, field:'firstName')}</td>
                        
                            <td>${fieldValue(bean:user, field:'lastName')}</td>
                                                
                            
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
                <h3>There are no individuals defined yet.</h3>
                <div class="info">Press the &quot;Add Individual&quot; button to the right to create a new one.</div>
            </g:else>
        </div>
    </body>
</html>
