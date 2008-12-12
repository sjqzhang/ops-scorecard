<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="artifact"/>
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
    <div class="view">
         <div class="header service">
                     <span class="name"><g:link controller="releaseArtifact" action="show" id="${releaseArtifact?.id}">${releaseArtifact?.name}</g:link></span>
                     <span class="type">[<g:link controller="releaseArtifact" action="show" id="${releaseArtifact?.type?.id}">${releaseArtifact?.type?.encodeAsHTML()}</g:link>]</span>                     
                     <span class="desc">${releaseArtifact?.description}</span>
                 </div>
        <table>
            <tbody>

                <tr class="prop">
                    <td valign="top" class="name ${!releaseArtifact?.function?'empty':''}">Function:</td>

                    <td valign="top" class="value">${fieldValue(bean: releaseArtifact, field: 'function')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!releaseArtifact?.status?'empty':''}">Status:</td>

                    <td valign="top" class="value">${fieldValue(bean: releaseArtifact, field: 'status')}</td>

                </tr>



                <tr class="prop">
                    <td valign="top" class="name ${!releaseArtifact?.repositoryURL?'empty':''}">Repository URL:</td>

                    <td valign="top" class="value">${fieldValue(bean: releaseArtifact, field: 'repositoryURL')}</td>

                </tr>



                <tr class="prop">
                    <td valign="top" class="name ${!releaseArtifact?.ownerResponsible?'empty':''}">Owner Responsible:</td>

                    <td valign="top" class="value"><g:link controller="user" action="show" id="${releaseArtifact?.ownerResponsible?.id}">${releaseArtifact?.ownerResponsible?.encodeAsHTML()}</g:link></td>

                </tr>


                <tr class="prop">
                    <td valign="top" class="name">Date Acquired:</td>

                    <td valign="top" class="value">
                    <g:relativeDate elapsed="${releaseArtifact?.dateAcquired}"  agoClass="ago acquired" untilClass="date aquired"/>
                    </td>

                </tr>


                <tr class="prop">
                    <td valign="top" class="name">Next Maintenance Window:</td>

                    <td valign="top" class="value">
                        <g:relativeDate elapsed="${releaseArtifact?.nextMaintenanceWindow}"  agoClass="until maintenance" untilClass="next maintenance"/>                        
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!releaseArtifact?.reprovisioningDuration?'empty':''}">Reprovisioning Duration:</td>
                    
                    <td valign="top" class="value">${fieldValue(bean: releaseArtifact, field: 'reprovisioningDuration')}</td>

                </tr>



                <tr class="prop">
                    <td valign="top" class="name ${!(releaseArtifact?.isFragile || releaseArtifact?.isMissionCritical || releaseArtifact?.isMonitored || releaseArtifact?.isRebuildable)?'empty':''}">Flags:</td>
                    <td class="value">
                        <g:if test="${releaseArtifact.isFragile}">
                            <img src="${createLinkTo(dir:'images/skin',file:'tick.png')}" width="16px" height="16px"/>
                            <b>Fragile</b>
                        </g:if>
                        <g:if test="${releaseArtifact.isMissionCritical}">
                            <img src="${createLinkTo(dir:'images/skin',file:'tick.png')}" width="16px" height="16px"/>
                            <b>Mission Critical</b>
                        </g:if>
                        <g:if test="${releaseArtifact.isMonitored}">
                            <img src="${createLinkTo(dir:'images/skin',file:'tick.png')}" width="16px" height="16px"/>
                            <b>Monitored</b>
                        </g:if>
                        <g:if test="${releaseArtifact.isRebuildable}">
                            <img src="${createLinkTo(dir:'images/skin',file:'tick.png')}" width="16px" height="16px"/>
                            <b>Rebuildable</b>
                        </g:if>
                    </td>
                </tr>

            </tbody>
        </table>
    </div>

</div>
</body>
</html>
