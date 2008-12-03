

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Inventory: Service List</title>
    </head>
    <body>    
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:if test="${serviceList}">
            <div class="dialog">
                <table>
                    <thead>
                        <tr>
                        
                            <th>&nbsp;</th>
                   	        <g:sortableColumn property="name" title="Name" />
                        
                            <g:sortableColumn property="type" title="Type" />

                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <g:sortableColumn property="status" title="Status" />
                        
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${serviceList}" status="i" var="service">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}"
                                onmouseover="$('controls.${service.id}').show();"
                                onmouseout="$('controls.${service.id}').hide();">
                            <td width="16px">
                               <div id="controls.${service.id}" style="display:none">
                                <g:link action="edit" params="[id:service.id]">
                                    <img src="${createLinkTo(dir:'images/skin',file:'database_edit.png')}" alt="edit" />
                                </g:link>
                               </div>
                            </td>
                        
                        
                            <td>
                                <g:link action="show" params="[id:service.id]">                                
                                ${fieldValue(bean:service, field:'name')}
                            </g:link>
                            </td>
                        
                            <td>${fieldValue(bean:service, field:'type')}</td>
                        
                            <td>${fieldValue(bean:service, field:'description')}</td>
                        
                            <td>${fieldValue(bean:service, field:'status')}</td>
                        

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Service.count()}" />
            </div>        
      </g:if>
      <g:else>
      <div class="dialog">
                <h3>There are no services defined yet.</h3>
                <h5>Press the &quot;Add Service&quot; button to the right to create a new one.</h5>
      </div>
      </g:else>
        </div>
        <div class="sidebar">
            <g:render template="sidebar"/>
     </div>
    </body>
</html>
