<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="team"/>
    <title>People: Teams</title>
</head>
<body>
<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:if test="${usergroupList}">
        <div class="dialog">
            <table>
                <thead>
                    <tr>

                        <td>&nbsp;</td>
                        <g:sortableColumn property="name" title="Name"/>
                        <g:sortableColumn property="description" title="Description"/>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${usergroupList}" status="i" var="usergroup">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}"
                                onmouseover="$('controls.${usergroup.id}').show();"
                                onmouseout="$('controls.${usergroup.id}').hide();">
                            <td width="16px">
                                <div id="controls.${usergroup.id}" style="display:none">
                                    <g:link action="edit" params="[id:usergroup.id]">
                                        <img src="${createLinkTo(dir: 'images/skin', file: 'pencil.png')}" alt="edit"/>
                                    </g:link>
                                </div>
                            </td>
                            <td>
                                <g:link action="show" id="${fieldValue(bean: usergroup, field: 'id')}">${fieldValue(bean: usergroup, field: 'name')}</g:link>
                            </td>
                            <td>${fieldValue(bean: usergroup, field: 'description')}</td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
        <div class="paginateButtons">
            <g:paginate total="${Usergroup.count()}"/>
        </div>
    </g:if>
    <g:else>

        <h3>There are no teams defined yet.</h3>
        <div class="info">Press the &quot;Add Team&quot; button to the right to create a new one.</div>

    </g:else>
</div>
</body>
</html>
