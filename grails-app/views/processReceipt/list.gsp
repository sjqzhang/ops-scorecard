<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="receipt"/>
    <title>Receipts: List</title>
</head>
<body>
<g:if test="${processReceiptList}">
    <div class="body">
        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>

        <div class="dialog">
            <table>
                <thead>
                    <tr>

                        <th>&nbsp;</th>

                        <g:sortableColumn property="title" title="Title"/>

                        <th>When</th>

                        <g:sortableColumn property="process.name" title="Process"/>

                        <th>Service</th>

                        <g:sortableColumn property="outcome" title="Outcome"/>

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
                                        <img src="${createLinkTo(dir: 'images/skin', file: 'pencil.png')}" alt="edit"/>
                                    </g:link>
                                </div>
                            </td>
                            <td>
                                <g:link action="show" id="${processReceipt.id}">
                                    ${fieldValue(bean: processReceipt, field: 'title')}
                                </g:link>
                            </td>

                            <td>

                                <g:relativeDate elapsed="${processReceipt?.date}" agoClass="ago " untilClass="until "/>

                            </td>

                            <td>
                                <g:link controller="serviceManagementProcess" action="show" params="[id:processReceipt?.process?.id]">
                                    ${fieldValue(bean: processReceipt, field: 'process')}
                                </g:link>
                            </td>

                            <td>
                                <g:link controller="service" action="show" id="${processReceipt.process?.service.id}">
                                    ${processReceipt.process?.service.name}
                                    [${processReceipt.process?.service.type.name}]
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

    </div>
</g:if>
<g:else>
    <g:if test="${Service.count()>0}">
        <div class="body">
            <h3>There are no receipts yet.</h3>
            <div class="info">Press the &quot;Create Receipt&quot; button to the right to create one.</div>
        </div>
    </g:if>
    <g:else>
        <div class="body">
            <h3>There are no services defined yet.</h3>
            <div class="info">Press the &quot;Create Service&quot; button to the right to create a new one.</div>

        </div>
        <div class="sidebar">
            <span class="menuButton"><g:link class="create" controller="service" action="create">Create Service</g:link></span>
        </div>
    </g:else>
</g:else>
</body>
</html>
