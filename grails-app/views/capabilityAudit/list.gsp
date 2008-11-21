

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Audit: CapabilityAudit List</title>
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
                        
                   	        <g:sortableColumn property="title" title="Title" />
                        
                   	        <th>Auditor</th>
                   	    
                   	        <g:sortableColumn property="auditDate" title="Audit Date" />
                        
                   	        <th>Targeted Service</th>
                   	    

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${capabilityAuditList}" status="i" var="capabilityAudit">
                        <tr  class="${(i % 2) == 0 ? 'odd' : 'even'}"
                                onmouseover="$('controls.${capabilityAudit.id}').show();"
                                onmouseout="$('controls.${capabilityAudit.id}').hide();">
                            <td width="16px">
                               <div id="controls.${capabilityAudit.id}" style="display:none">
                                <g:link action="edit" params="[id:capabilityAudit.id]">
                                    <img src="${createLinkTo(dir:'images/skin',file:'database_edit.png')}" alt="edit" />
                                </g:link>
                               </div>
                            </td>
                            <td>${fieldValue(bean:capabilityAudit, field:'title')}</td>
                        
                            <td>${fieldValue(bean:capabilityAudit, field:'auditor')}</td>
                        
                            <td>${fieldValue(bean:capabilityAudit, field:'auditDate')}</td>
                        
                            <td>
                                <g:if test="${capabilityAudit.targetedService?.name}">
                                    <g:link controller="service" action="show" id="${capabilityAudit.targetedService.id}">
                                        ${capabilityAudit.targetedService.name}
                                        </g:link>
                                [${capabilityAudit.targetedService?.type?.name}]
                                </g:if>
                            </td>
                        
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${CapabilityAudit.count()}" />
            </div>
      </g:if>
      <g:else>
                <h3>There are no capability audits defined yet.</h3>
                <h5>Press the &quot;Create Capability Audit&quot; button to the right to create a new one.</h5>
      </g:else>
        </div>
     <div class="sidebar">
            <g:render template="sidebar"/>
        </div>
    </body>
</html>
