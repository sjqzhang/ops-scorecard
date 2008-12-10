

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Inventory: Show PhysicalAsset</title>
    </head>
    <body>

        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${physicalAsset?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                    <span class="button"><g:actionSubmit class="list" value="List" /></span>                    
                </g:form>
            </div>
            <div class="view">
                 <div class="header service">
                     <span class="name"><g:link controller="physicalAsset" action="show" id="${physicalAsset?.id}">${physicalAsset?.name}</g:link></span>
                     <span class="type">[<g:link controller="physicalAsset" action="show" id="${physicalAsset?.type?.id}">${physicalAsset?.type?.encodeAsHTML()}</g:link>]</span>                     
                     <span class="desc">${physicalAsset?.description}</span>
                 </div>
                <table>
                    <tbody>
                        
                        <tr class="prop">
                            <td valign="top" class="name">Function:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:physicalAsset, field:'function')}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Status:</td>

                            <td valign="top" class="value">${fieldValue(bean:physicalAsset, field:'status')}</td>
                        </tr>



                        <tr class="prop">
                            <td valign="top" class="name">Make:</td>

                            <td valign="top" class="value">${fieldValue(bean:physicalAsset, field:'make')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Model:</td>

                            <td valign="top" class="value">${fieldValue(bean:physicalAsset, field:'model')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Operating System:</td>

                            <td valign="top" class="value">${fieldValue(bean:physicalAsset, field:'operatingSystem')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Physical Location:</td>

                            <td valign="top" class="value">${fieldValue(bean:physicalAsset, field:'physicalLocation')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Platform:</td>

                            <td valign="top" class="value">${fieldValue(bean:physicalAsset, field:'platform')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Source Supplier:</td>

                            <td valign="top" class="value">${fieldValue(bean:physicalAsset, field:'sourceSupplier')}</td>

                        </tr>

                        
                        <tr class="prop">
                            <td valign="top" class="name">Owner Responsible:</td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${physicalAsset?.ownerResponsible?.id}">${physicalAsset?.ownerResponsible?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    

                        <tr class="prop">
                            <td valign="top" class="name">Date Acquired:</td>

                            <td valign="top" class="value">${fieldValue(bean:physicalAsset, field:'dateAcquired')}</td>

                        </tr>


                        <tr class="prop">
                            <td valign="top" class="name">Next Maintenance Window:</td>

                            <td valign="top" class="value">${fieldValue(bean:physicalAsset, field:'nextMaintenanceWindow')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Ticket Numbers:</td>

                            <td valign="top" class="value">${fieldValue(bean:physicalAsset, field:'ticketNumbers')}</td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Reprovisioning Duration:</td>

                            <td valign="top" class="value">${fieldValue(bean:physicalAsset, field:'reprovisioningDuration')}</td>

                        </tr>                   


                        <tr class="prop">
                            <td valign="top" class="name ${!(physicalAsset?.isFragile || physicalAsset?.isMissionCritical || physicalAsset?.isMonitored || physicalAsset?.isRebuildable)?'empty':''}">Flags:</td>
                            <td class="value">
                                <g:if test="${physicalAsset.isFragile}">
                                    <img src="${createLinkTo(dir:'images/skin',file:'tick.png')}" width="16px" height="16px"/>
                                    <b>Fragile</b>
                                </g:if>
                                <g:if test="${physicalAsset.isMissionCritical}">
                                    <img src="${createLinkTo(dir:'images/skin',file:'tick.png')}" width="16px" height="16px"/>
                                    <b>Mission Critical</b>
                                </g:if>
                                <g:if test="${physicalAsset.isMonitored}">
                                    <img src="${createLinkTo(dir:'images/skin',file:'tick.png')}" width="16px" height="16px"/>
                                    <b>Monitored</b>
                                </g:if>
                                <g:if test="${physicalAsset.isRebuildable}">
                                    <img src="${createLinkTo(dir:'images/skin',file:'tick.png')}" width="16px" height="16px"/>
                                    <b>Rebuildable</b>
                                </g:if>
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
