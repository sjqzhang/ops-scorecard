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
    <g:if test="${processReceiptList}">
    <div class="dialog">
        <table>
            <thead>
                <tr>

                    <th>&nbsp;</th>

                    <g:sortableColumn property="title" title="Title"/>

                    <g:sortableColumn property="processReceipt.login" title="Coordinator"/>

                    <g:sortableColumn property="targetedService.name" title="Targeted Service"/>


                    <g:sortableColumn property="outcome" title="¶ Outcome"/>

                </tr>
            </thead>
            <tbody>
                <g:each in="${processReceiptList}" status="i" var="processReceipt">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}"
                            onmouseover="$('controls.${processReceipt.id}').show();"
                            onmouseout="$('controls.${processReceipt.id}').hide();">
                        <td width="16px">
                            <div id="controls.${processReceipt.id}" style="display:none">
                                <g:link action="edit" params="[id:processReceipt.id]">
                                    <img src="${createLinkTo(dir: 'images/skin', file: 'database_edit.png')}" alt="edit"/>
                                </g:link>
                            </div>
                        </td>
                        <td>
                            <g:link action="show" id="${processReceipt.id}">
                                ${fieldValue(bean: processReceipt, field: 'title')}
                            </g:link>
                        </td>

                        <td>
                            <g:link controller="user" action="edit" params="[id:processReceipt?.coordinator?.id]">
                                ${fieldValue(bean: processReceipt, field: 'coordinator')}
                            </g:link>
                        </td>

                        <td>
                            <g:link controller="service" action="edit" params="[id:processReceipt?.targetedService?.id]">
                            ${fieldValue(bean: processReceipt, field: 'targetedService')}
                        </g:link>
                        </td>                      

                        <td>${fieldValue(bean: processReceipt, field: 'outcome')}</td>

                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>
    <div class="paginateButtons">
        <g:paginate total="${ProcessReceipt.count()}"/>
    </div>
       </g:if>
      <g:else>
      <div class="dialog">
                <h3>There are no change receipts defined yet.</h3>
                <h5>Press the &quot;Create Receipt&quot; button to the right to create a new one.</h5>
      </div>
      </g:else>
</div>
<div class="sidebar">
    <g:render template="sidebar"/>
</div>
</body>
</html>
