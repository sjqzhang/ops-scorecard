

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Inventory: Show ResourceType</title>
    </head>
    <body>
        
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${resourceType?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                    <span class="button"><g:actionSubmit class="list" value="List" /></span>                    
                </g:form>
            </div>
            <div class="dialog">
                <table>
                    <tbody>

                   
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:resourceType, field:'name')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Description:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:resourceType, field:'description')}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Meta Type:</td>

                            <td valign="top" class="value">${fieldValue(bean:resourceType, field:'metatype')}</td>

                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Instances:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <g:if test="${resourceType.instances.size() <1}">
                                    <%
                                       def controller
                                       switch (resourceType.metatype) {
                                           case 'artifact': controller = 'releaseArtifact'
                                           break
                                           case 'asset'   : controller = 'physicalAsset'
                                           break
                                           case 'service' : controller = 'service'
                                           break
                                           case 'process' : controller = 'serviceManagementProcess'
                                       }
                                    %>

                                    <g:link class="controllink" action="create"
                                            controller="${controller}"
                                        params="[resourceType:resourceType.id]"
                                    >Create a ${resourceType?.metatype}</g:link>
                                </g:if>
                                <g:else>
                                <ul>
                                <g:each var="i" in="${resourceType.instances}">
                                    <li><g:link controller="resource" action="show" id="${i.id}">${i?.name?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                                </g:else>

                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>

        </div>
      <div class="sidebar">
            <g:render template="sidebar"/>
     </div>
    </body>
</html>
