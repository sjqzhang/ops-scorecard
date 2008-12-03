<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Inventory: Edit PhysicalAsset</title>
</head>
<body>

<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${physicalAsset}">
        <div class="errors">
            <g:renderErrors bean="${physicalAsset}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form method="post">
        <input type="hidden" name="id" value="${physicalAsset.id}"/>

        <div class="buttons">
            <span class="button"><g:actionSubmit class="save" value="Update"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
            <span class="button"><g:actionSubmit class="list" value="List"/></span>
        </div>
        <div class="dialog">
            <table>
                <tbody>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="name">Name:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: physicalAsset, field: 'name', 'errors')}">
                            <input type="text" id="name" name="name" value="${fieldValue(bean: physicalAsset, field: 'name')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="description">Description:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: physicalAsset, field: 'description', 'errors')}">
                            <input type="text" id="description" name="description" value="${fieldValue(bean: physicalAsset, field: 'description')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="type">Type:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: physicalAsset, field: 'type', 'errors')}">
                            <g:select optionKey="id" from="${ResourceType.findAllByMetatype('asset')}" name="type.id" value="${physicalAsset?.type?.id}"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="function">Function:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: physicalAsset, field: 'function', 'errors')}">
                            <input type="text" id="function" name="function" value="${fieldValue(bean: physicalAsset, field: 'function')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="ticketNumbers">Ticket Numbers:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: physicalAsset, field: 'ticketNumbers', 'errors')}">
                            <input type="text" id="ticketNumbers" name="ticketNumbers" value="${fieldValue(bean: physicalAsset, field: 'ticketNumbers')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="reprovisioningDuration">Reprovisioning Duration:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: physicalAsset, field: 'reprovisioningDuration', 'errors')}">
                            <input type="text" id="reprovisioningDuration" name="reprovisioningDuration" value="${fieldValue(bean: physicalAsset, field: 'reprovisioningDuration')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="ownerResponsible">Owner Responsible:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: physicalAsset, field: 'ownerResponsible', 'errors')}">
                            <g:select optionKey="id" from="${User.list()}" name="ownerResponsible.id" value="${physicalAsset?.ownerResponsible?.id}" noSelection="['null':'']"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="status">Status:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: physicalAsset, field: 'status', 'errors')}">
                            <g:select id="status" name="status" from="${physicalAsset.constraints.status.inList}" value="${physicalAsset.status}"></g:select>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="make">Make:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: physicalAsset, field: 'make', 'errors')}">
                            <input type="text" id="make" name="make" value="${fieldValue(bean: physicalAsset, field: 'make')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="model">Model:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: physicalAsset, field: 'model', 'errors')}">
                            <input type="text" id="model" name="model" value="${fieldValue(bean: physicalAsset, field: 'model')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="operatingSystem">Operating System:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: physicalAsset, field: 'operatingSystem', 'errors')}">
                            <input type="text" id="operatingSystem" name="operatingSystem" value="${fieldValue(bean: physicalAsset, field: 'operatingSystem')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="physicalLocation">Physical Location:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: physicalAsset, field: 'physicalLocation', 'errors')}">
                            <input type="text" id="physicalLocation" name="physicalLocation" value="${fieldValue(bean: physicalAsset, field: 'physicalLocation')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="platform">Platform:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: physicalAsset, field: 'platform', 'errors')}">
                            <input type="text" id="platform" name="platform" value="${fieldValue(bean: physicalAsset, field: 'platform')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="sourceSupplier">Source Supplier:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: physicalAsset, field: 'sourceSupplier', 'errors')}">
                            <input type="text" id="sourceSupplier" name="sourceSupplier" value="${fieldValue(bean: physicalAsset, field: 'sourceSupplier')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="dateAcquired">Date Acquired:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: physicalAsset, field: 'dateAcquired', 'errors')}">
                            <g:datePicker name="dateAcquired" value="${physicalAsset?.dateAcquired}"></g:datePicker>
                        </td>
                    </tr>



                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="isFragile">Is Fragile:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: physicalAsset, field: 'isFragile', 'errors')}">
                            <g:checkBox name="isFragile" value="${physicalAsset?.isFragile}"></g:checkBox>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="isMissionCritical">Is Mission Critical:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: physicalAsset, field: 'isMissionCritical', 'errors')}">
                            <g:checkBox name="isMissionCritical" value="${physicalAsset?.isMissionCritical}"></g:checkBox>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="isMonitored">Is Monitored:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: physicalAsset, field: 'isMonitored', 'errors')}">
                            <g:checkBox name="isMonitored" value="${physicalAsset?.isMonitored}"></g:checkBox>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="isRebuildable">Is Rebuildable:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: physicalAsset, field: 'isRebuildable', 'errors')}">
                            <g:checkBox name="isRebuildable" value="${physicalAsset?.isRebuildable}"></g:checkBox>
                        </td>
                    </tr>



                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="nextMaintenanceWindow">Next Maintenance Window:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: physicalAsset, field: 'nextMaintenanceWindow', 'errors')}">
                            <g:datePicker name="nextMaintenanceWindow" value="${physicalAsset?.nextMaintenanceWindow}"></g:datePicker>
                        </td>
                    </tr>

                </tbody>
            </table>
        </div>

    </g:form>
</div>
<div class="sidebar">
    <g:render template="sidebar"/>
</div>
</body>
</html>
