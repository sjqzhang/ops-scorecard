

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Inventory: List Physical Assets</title>
    </head>
    <body>    
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:if test="${physicalAssetList}">
            <div class="list">
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
                    <g:each in="${physicalAssetList}" status="i" var="resource">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}"
                                onmouseover="$('controls.${resource.id}').show();"
                                onmouseout="$('controls.${resource.id}').hide();">
                            <td width="16px">
                               <div id="controls.${resource.id}" style="display:none">
                                <g:link action="edit" params="[id:resource.id]">
                                    <img src="${createLinkTo(dir:'images/skin',file:'database_edit.png')}" alt="edit" />
                                </g:link>
                               </div>
                            </td>
                        
                        
                            <td>
                                <g:link action="show" params="[id:resource.id]">
                                ${fieldValue(bean:resource, field:'name')}
                            </g:link>
                            </td>
                        
                            <td>${fieldValue(bean:resource, field:'type')}</td>
                        
                            <td>${fieldValue(bean:resource, field:'description')}</td>
                        
                            <td>${fieldValue(bean:resource, field:'status')}</td>
                        

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${PhysicalAsset.count()}" />
            </div>        
      </g:if>
      <g:else>
                <h3>There are no assets defined yet.</h3>
                <h5>Press the &quot;Add Asset&quot; button to the right to create a new one.</h5>
      </g:else>
        </div>
        <div class="sidebar">
            <g:render template="sidebar"/>
     </div>
    </body>
</html>
