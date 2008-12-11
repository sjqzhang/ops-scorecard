<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="audit"/>
    <title>Audit: CapabilityAudit Search Results</title>
</head>
<body>
<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:if test="${capabilityAuditList}">

        <div class="list">
            <table>
                <thead>
                    <tr>

                        <th>&nbsp;</th>

                        <g:sortableColumn property="title" title="Title"/>

                        <th>Auditor</th>

                        <g:sortableColumn property="auditDate" title="Audit Date"/>

                        <th>Targeted Service</th>

                    </tr>
                </thead>
                <tbody>
                    <g:each in="${capabilityAuditList}" status="i" var="capabilityAudit">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}"
                                onmouseover="$('controls.${capabilityAudit.id}').show();"
                                onmouseout="$('controls.${capabilityAudit.id}').hide();">
                            <td width="16px">
                                <div id="controls.${capabilityAudit.id}" style="display:none">
                                    <g:link action="edit" params="[id:capabilityAudit.id]">
                                        <img src="${createLinkTo(dir: 'images/skin', file: 'pencil.png')}" alt="edit"/>
                                    </g:link>
                                </div>
                            </td>
                            <td>
                                <g:link action="show" id="${fieldValue(bean:capabilityAudit, field:'id')}">
                                    ${fieldValue(bean: capabilityAudit, field: 'title')}
                                </g:link>
                            </td>

                            <td>${fieldValue(bean: capabilityAudit, field: 'auditor')}</td>

                            <td>${fieldValue(bean: capabilityAudit, field: 'auditDate')}</td>

                            <td>
                                <g:if test="${capabilityAudit.service?.name}">
                                    <g:link controller="service" action="show" id="${capabilityAudit.service.id}">
                                        ${capabilityAudit.service.name}
                                    </g:link>
                                </g:if>
                            </td>

                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
        <div class="paginateButtons">
            <g:paginate total="${CapabilityAudit.count()}"/>
        </div>
    </g:if>
    <g:else>
        <h3>No capability audits matched the search criteria.</h3>
        <div class="info">Press the &quot;All Types&quot; link to the right to list any.</div>
    </g:else>
</div>
<div class="sidebar">
    <g:render template="sidebar"/>
</div>
</body>
</html>
