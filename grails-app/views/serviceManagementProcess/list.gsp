

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Inventory: ServiceManagementProcess List</title>
    </head>
    <body>

        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:if test="${serviceManagementProcessList}">
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <th>&nbsp;</th>
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <g:sortableColumn property="category" title="Category" />
                        
                               <g:sortableColumn property="implementor" title="Implementor" />
                   	    
                   	        <th>Target Service</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${serviceManagementProcessList}" status="i" var="serviceManagementProcess">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}"
                                onmouseover="$('controls.${serviceManagementProcess.id}').show();"
                                onmouseout="$('controls.${serviceManagementProcess.id}').hide();">
                            <td width="16px">
                               <div id="controls.${serviceManagementProcess.id}" style="display:none">
                                <g:link action="edit" params="[id:serviceManagementProcess.id]">
                                    <img src="${createLinkTo(dir:'images/skin',file:'database_edit.png')}" alt="edit" />
                                </g:link>
                               </div>
                            </td>


                            <td>
                                <g:link action="show" id="${serviceManagementProcess.id}">
                                    ${fieldValue(bean:serviceManagementProcess, field:'name')}
                                </g:link>
                            </td>
                        
                            <td>${fieldValue(bean:serviceManagementProcess, field:'description')}</td>
                        
                            <td>${fieldValue(bean:serviceManagementProcess, field:'category')}</td>
                        
                            <td>${fieldValue(bean:serviceManagementProcess, field:'implementor')}</td>
                        
                            <td>
                                <g:if test="${serviceManagementProcess?.targetResource}">
                                    ${serviceManagementProcess?.targetResource?.name}
                                </g:if>
                            </td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ServiceManagementProcess.count()}" />
            </div>
            </g:if>
            <g:else>
                <h3>There are no processes defined yet.</h3>
                <h5>Press the &quot;Add Process&quot; button to the right to create a new one.</h5>
            </g:else>
        </div>
     <div class="sidebar">
            <g:render template="sidebar"/>
        </div>
    </body>
</html>
