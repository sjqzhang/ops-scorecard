<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Show ReleaseArtifact</title>
</head>
<body>

<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="buttons">
        <g:form>
            <input type="hidden" name="id" value="${releaseArtifact?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
            <span class="button"><g:actionSubmit class="list" value="List"/></span>
        </g:form>
    </div>
    <div class="dialog">
        <table>
            <tbody>

                <tr class="prop">
                    <td valign="top" class="name">Name:</td>

                    <td valign="top" class="value">${fieldValue(bean: releaseArtifact, field: 'name')}</td>

                </tr>


                <tr class="prop">
                    <td valign="top" class="name">Type:</td>

                    <td valign="top" class="value"><g:link controller="resourceType" action="show" id="${releaseArtifact?.type?.id}">${releaseArtifact?.type?.encodeAsHTML()}</g:link></td>

                </tr>


                <tr class="prop">
                    <td valign="top" class="name">Description:</td>

                    <td valign="top" class="value">${fieldValue(bean: releaseArtifact, field: 'description')}</td>

                </tr>


                <tr class="prop">
                    <td valign="top" class="name">Function:</td>

                    <td valign="top" class="value">${fieldValue(bean: releaseArtifact, field: 'function')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Status:</td>

                    <td valign="top" class="value">${fieldValue(bean: releaseArtifact, field: 'status')}</td>

                </tr>



                <tr class="prop">
                    <td valign="top" class="name">Repository URL:</td>

                    <td valign="top" class="value">${fieldValue(bean: releaseArtifact, field: 'repositoryURL')}</td>

                </tr>



                <tr class="prop">
                    <td valign="top" class="name">Owner Responsible:</td>

                    <td valign="top" class="value"><g:link controller="user" action="show" id="${releaseArtifact?.ownerResponsible?.id}">${releaseArtifact?.ownerResponsible?.encodeAsHTML()}</g:link></td>

                </tr>


                <tr class="prop">
                    <td valign="top" class="name">Date Acquired:</td>

                    <td valign="top" class="value">${fieldValue(bean: releaseArtifact, field: 'dateAcquired')}</td>

                </tr>


                <tr class="prop">
                    <td valign="top" class="name">Next Maintenance Window:</td>

                    <td valign="top" class="value">${fieldValue(bean: releaseArtifact, field: 'nextMaintenanceWindow')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Ticket Numbers:</td>

                    <td valign="top" class="value">${fieldValue(bean: releaseArtifact, field: 'ticketNumbers')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Reprovisioning Duration:</td>

                    <td valign="top" class="value">${fieldValue(bean: releaseArtifact, field: 'reprovisioningDuration')}</td>

                </tr>



                <tr class="prop">
                    <td valign="top" class="name">Is Fragile:</td>

                    <td valign="top" class="value">${fieldValue(bean: releaseArtifact, field: 'isFragile')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Is Mission Critical:</td>

                    <td valign="top" class="value">${fieldValue(bean: releaseArtifact, field: 'isMissionCritical')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Is Monitored:</td>

                    <td valign="top" class="value">${fieldValue(bean: releaseArtifact, field: 'isMonitored')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name">Is Rebuildable:</td>

                    <td valign="top" class="value">${fieldValue(bean: releaseArtifact, field: 'isRebuildable')}</td>

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
