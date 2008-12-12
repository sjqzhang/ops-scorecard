

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <meta name="guideitem" content="service"/>
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
                   	        <g:sortableColumn property="name" title="Name" action="list"/>
                        
                            <g:sortableColumn property="type" title="Type" action="list"/>

                   	        <g:sortableColumn property="description" title="Description" action="list" />
                        
                   	        <g:sortableColumn property="status" title="Status" action="list"/>
                        
                        
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
                                    <img src="${createLinkTo(dir:'images/skin',file:'pencil.png')}" alt="edit" />
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
                <h3>There are no services defined yet.</h3>
                <div class="info">Press the &quot;Add Service&quot; button to the right to create a new one.</div>
      </g:else>
        </div>
    </body>
</html>
