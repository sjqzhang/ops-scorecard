<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Receipts: Change List</title>
</head>
<body>
<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:if test="${changeReceiptList}">
    <div class="list">
        <table>
            <thead>
                <tr>

                    <th>&nbsp;</th>

                    <g:sortableColumn property="title" title="Title"/>

                    <g:sortableColumn property="changeReceipt.login" title="Coordinator"/>

                    <g:sortableColumn property="targetedService.name" title="Targeted Service"/>

                    <g:sortableColumn property="owner.login" title="Owner"/>

                    <g:sortableColumn property="changeOutcome" title="Change Outcome"/>

                </tr>
            </thead>
            <tbody>
                <g:each in="${changeReceiptList}" status="i" var="changeReceipt">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}"
                            onmouseover="$('controls.${changeReceipt.id}').show();"
                            onmouseout="$('controls.${changeReceipt.id}').hide();">
                        <td width="16px">
                            <div id="controls.${changeReceipt.id}" style="display:none">
                                <g:link action="edit" params="[id:changeReceipt.id]">
                                    <img src="${createLinkTo(dir: 'images/skin', file: 'database_edit.png')}" alt="edit"/>
                                </g:link>
                            </div>
                        </td>
                        <td>${fieldValue(bean: changeReceipt, field: 'title')}</td>

                        <td>
                            <g:link controller="user" action="edit" params="[id:changeReceipt?.coordinator?.id]">
                                ${fieldValue(bean: changeReceipt, field: 'coordinator')}
                            </g:link>
                        </td>

                        <td>
                            <g:link controller="service" action="edit" params="[id:changeReceipt?.targetedService?.id]">
                            ${fieldValue(bean: changeReceipt, field: 'targetedService')}
                        </g:link>
                        </td>

                        <td>
                            <g:link controller="user" action="edit" params="[id:changeReceipt?.owner?.id]">
                                ${fieldValue(bean: changeReceipt, field: 'owner')}
                            </g:link>
                        </td>

                        <td>${fieldValue(bean: changeReceipt, field: 'changeOutcome')}</td>

                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>
    <div class="paginateButtons">
        <g:paginate total="${ChangeReceipt.count()}"/>
    </div>
       </g:if>
      <g:else>
                <h3>There are no change receipts defined yet.</h3>
                <h5>Press the &quot;Create Receipt&quot; button to the right to create a new one.</h5>
      </g:else>
</div>
<div class="sidebar">
    <g:render template="sidebar"/>
</div>
</body>
</html>
