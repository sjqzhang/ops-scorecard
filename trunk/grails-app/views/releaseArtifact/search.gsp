

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Inventory: ReleaseArtifact Search</title>
    </head>
    <body>

        <div class="body">            
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:if test="${releaseArtifactList}">
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <th>&nbsp;</th>
                        

                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <g:sortableColumn property="type" title="Resource Type" />
                        
                               <g:sortableColumn property="status" title="Status" />
                               <g:sortableColumn property="repositoryURL" title="URL" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${releaseArtifactList}" status="i" var="releaseArtifact">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}"
                                onmouseover="$('controls.${releaseArtifact.id}').show();"
                                onmouseout="$('controls.${releaseArtifact.id}').hide();">
                            <td width="16px">
                               <div id="controls.${releaseArtifact.id}" style="display:none">
                                <g:link action="edit" params="[id:releaseArtifact.id]">
                                    <img src="${createLinkTo(dir:'images/skin',file:'database_edit.png')}" alt="edit" />
                                </g:link>
                               </div>
                            </td>

                        
                            <td>${fieldValue(bean:releaseArtifact, field:'name')}</td>
                        
                            <td>${fieldValue(bean:releaseArtifact, field:'description')}</td>
                        
                            <td>
                                <g:link action="show" params="[id:releaseArtifact.type.id]">
                                    ${fieldValue(bean:releaseArtifact, field:'type')}
                                </g:link>
                            </td>
                        
                            <td>${fieldValue(bean:releaseArtifact, field:'status')}</td>
                            <td>
                                <a href="${fieldValue(bean:releaseArtifact, field:'repositoryURL')}">
                                    &rarr;
                                </a>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ReleaseArtifact.count()}" />
            </div>
            </g:if>
            <g:else>
      <div class="dialog">
                <h3>No artifacts matched the search criteria.</h3>
                <h5>Press the &quot;All&quot; link to the right to list existing artifacts.</h5>
          </div>
            </g:else>
            </div>
    <div class="sidebar">
            <g:render template="sidebar"/>
     </div>
    </body>
</html>
