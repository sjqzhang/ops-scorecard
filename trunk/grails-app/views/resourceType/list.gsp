

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>ResourceType List</title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <th></th>
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="description" title="Description" />

                            <th>Instances</th>

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
                                    <img src="${createLinkTo(dir:'images/skin',file:'database_edit.png')}" alt="edit" />
                                </g:link>
                               </div>
                            </td>

                        
                            <td>${fieldValue(bean:resourceType, field:'name')}</td>
                        
                            <td>${fieldValue(bean:resourceType, field:'description')}</td>
                            <td>
                                
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ResourceType.count()}" />
            </div>
        </div>
      <div class="sidebar">
            <g:render template="sidebar"/>
     </div>
    </body>
</html>
