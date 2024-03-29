<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="resourcetype"/>
    <title>ResourceType List</title>
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
    <div class="dialog">
        <table>
            <thead>
                <tr>

                    <th></th>

                    <g:sortableColumn property="name" title="Name" action="list"/>
                    <g:sortableColumn property="description" title="Description" action="list"/>
                    <g:sortableColumn property="metatype" title="Meta Type" action="list"/>

                </tr>
            </thead>
            <tbody>
                <g:each in="${resourceTypeList}" status="i" var="resourceType">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}"
                            onmouseover="$('controls.${resourceType.id}').show();"
                            onmouseout="$('controls.${resourceType.id}').hide();">

                        <td width="16px">
                            <div id="controls.${resourceType.id}" style="display:none">
                                <g:link action="edit" params="[id:resourceType.id]">
                                    <img src="${createLinkTo(dir: 'images/skin', file: 'pencil.png')}" alt="edit"/>
                                </g:link>
                            </div>
                        </td>


                        <td>
                            <g:link action="show" id="${fieldValue(bean: resourceType, field: 'id')}">
                                ${fieldValue(bean: resourceType, field: 'name')}
                                </g:link>
                        </td>

                        <td>${fieldValue(bean: resourceType, field: 'description')}</td>
                        <td>${fieldValue(bean: resourceType, field: 'metatype')}</td>

                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>
    <div class="paginateButtons">
        <g:paginate total="${ResourceType.count()}"/>
    </div>
</div>
</body>
</html>
