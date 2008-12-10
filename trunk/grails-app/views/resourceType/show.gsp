<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Inventory: Show ResourceType</title>
</head>
<body>

<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="buttons">
        <g:form>
            <input type="hidden" name="id" value="${resourceType?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
            <span class="button"><g:actionSubmit class="list" value="List"/></span>
        </g:form>
    </div>
    <div class="view">
        <table>
            <tbody>

                <tr class="prop">
                    <td valign="top" class="name">Name:</td>

                    <td valign="top" class="value">${fieldValue(bean: resourceType, field: 'name')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Description:</td>

                    <td valign="top" class="value">${fieldValue(bean: resourceType, field: 'description')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Meta Type:</td>

                    <td valign="top" class="value">${fieldValue(bean: resourceType, field: 'metatype')}</td>

                </tr>
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

            </tbody>
        </table>

        <h3 class="section">Instances
            <span class="menuButton"><g:link class="create" action="create" controller="${controller}"
                    params="[resourceType:resourceType.id]">New ${resourceType?.metatype}</g:link></span>
        </h3>
        <table>
            <thead>
                <th>Name</th>
                <th>Description</th>
            </thead>
            <tbody>
                <g:each var="i" in="${resourceType.instances}">
                    <tr>
                        <td>
                            <g:link controller="resource" action="show" id="${i.id}">${i?.name?.encodeAsHTML()}</g:link>
                        </td>
                        <td>
                            ${i?.description?.encodeAsHTML()}
                        </td>

                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>

</div>
<div class="sidebar">
    <g:render template="sidebar"/>
</div>
</body>
</html>
