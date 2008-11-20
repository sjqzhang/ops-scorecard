

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Inventory: Create ReleaseArtifact</title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${releaseArtifact}">
            <div class="errors">
                <g:renderErrors bean="${releaseArtifact}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                 <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:releaseArtifact,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:releaseArtifact,field:'name')}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:releaseArtifact,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:releaseArtifact,field:'description')}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="function">Function:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:releaseArtifact,field:'function','errors')}">
                                    <input type="text" id="function" name="function" value="${fieldValue(bean:releaseArtifact,field:'function')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ticketNumbers">Ticket Numbers:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:releaseArtifact,field:'ticketNumbers','errors')}">
                                    <input type="text" id="ticketNumbers" name="ticketNumbers" value="${fieldValue(bean:releaseArtifact,field:'ticketNumbers')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="reprovisioningDuration">Reprovisioning Duration:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:releaseArtifact,field:'reprovisioningDuration','errors')}">
                                    <input type="text" id="reprovisioningDuration" name="reprovisioningDuration" value="${fieldValue(bean:releaseArtifact,field:'reprovisioningDuration')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ownerResponsible">Owner Responsible:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:releaseArtifact,field:'ownerResponsible','errors')}">
                                    <g:select optionKey="id" from="${User.list()}" name="ownerResponsible.id" value="${releaseArtifact?.ownerResponsible?.id}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status">Status:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:releaseArtifact,field:'status','errors')}">
                                    <g:select id="status" name="status" from="${releaseArtifact.constraints.status.inList}" value="${releaseArtifact.status}" ></g:select>
                                </td>
                            </tr> 
                        

                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="repositoryURL">Repository URL:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:releaseArtifact,field:'repositoryURL','errors')}">
                                    <input type="text" id="repositoryURL" name="repositoryURL" value="${fieldValue(bean:releaseArtifact,field:'repositoryURL')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateAcquired">Date Acquired:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:releaseArtifact,field:'dateAcquired','errors')}">
                                    <g:datePicker name="dateAcquired" value="${releaseArtifact?.dateAcquired}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="isFragile">Is Fragile:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:releaseArtifact,field:'isFragile','errors')}">
                                    <g:checkBox name="isFragile" value="${releaseArtifact?.isFragile}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="isMissionCritical">Is Mission Critical:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:releaseArtifact,field:'isMissionCritical','errors')}">
                                    <g:checkBox name="isMissionCritical" value="${releaseArtifact?.isMissionCritical}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="isMonitored">Is Monitored:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:releaseArtifact,field:'isMonitored','errors')}">
                                    <g:checkBox name="isMonitored" value="${releaseArtifact?.isMonitored}" ></g:checkBox>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="isRebuildable">Is Rebuildable:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:releaseArtifact,field:'isRebuildable','errors')}">
                                    <g:checkBox name="isRebuildable" value="${releaseArtifact?.isRebuildable}" ></g:checkBox>
                                </td>
                            </tr> 
                        

                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nextMaintenanceWindow">Next Maintenance Window:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:releaseArtifact,field:'nextMaintenanceWindow','errors')}">
                                    <g:datePicker name="nextMaintenanceWindow" value="${releaseArtifact?.nextMaintenanceWindow}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type">Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:releaseArtifact,field:'type','errors')}">
                                    <g:select optionKey="id" from="${ResourceType.list()}" name="type.id" value="${releaseArtifact?.type?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>

            </g:form>
        </div>
    </body>
</html>
