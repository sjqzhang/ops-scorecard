<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
        <meta name="guideitem" content="process"/>
    <title>Inventory: Process: ${serviceManagementProcess?.name}</title>
</head>
<body>

<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="buttons">
        <g:form>
            <input type="hidden" name="id" value="${serviceManagementProcess?.id}"/>
            <span class="button"><g:actionSubmit class="edit" value="Edit"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
            <span class="button"><g:actionSubmit class="list" value="List"/></span>

        </g:form>
    </div>
    <div class="view">
        <div class="header process">
            <span class="name"><g:link controller="serviceManagementProcess" action="show" id="${serviceManagementProcess?.id}">${serviceManagementProcess?.name}</g:link></span>
            <span class="desc">${serviceManagementProcess?.description}</span>
        </div>
        <table>
            <tbody>

                <tr class="prop">
                    <td valign="top" class="name ${!serviceManagementProcess?.category?'empty':''}">Category:</td>

                    <td valign="top" class="value">${fieldValue(bean: serviceManagementProcess, field: 'category')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!serviceManagementProcess?.service?'empty':''}">Service:</td>
                    <td valign="top" class="value">
                        <g:link controller="service" action="show" id="${serviceManagementProcess?.service?.id}">
                            <g:if test="serviceManagementProcess?.service?.name">
                                ${serviceManagementProcess?.service?.name}
                                [${serviceManagementProcess?.service?.type.name}]
                            </g:if>
                            <g:else>
                                ${serviceManagementProcess?.service?.encodeAsHTML()}
                            </g:else>
                        </g:link>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!serviceManagementProcess?.automationLevel?'empty':''}">Automation Level:</td>

                    <td valign="top" class="value">${fieldValue(bean: serviceManagementProcess, field: 'automationLevel')}</td>

                </tr>

                <g:if test="${'semi'.equals(serviceManagementProcess?.automationLevel) || 'full'.equals(serviceManagementProcess?.automationLevel)}">
                    <tr class="prop">
                        <td valign="top" class="name ${!serviceManagementProcess?.automationTool?'empty':''}">Automation Tool:</td>

                        <td valign="top" class="value">${fieldValue(bean: serviceManagementProcess, field: 'automationTool')}</td>

                    </tr>
                </g:if>
                <tr class="prop">
                    <td valign="top" class="name ${!serviceManagementProcess?.syscontrol?'empty':''}">System Control:</td>

                    <td valign="top" class="value">${fieldValue(bean: serviceManagementProcess, field: 'syscontrol')}</td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!serviceManagementProcess?.artifactType?'empty':''}">Artifact Type:</td>

                    <td valign="top" style="text-align:left;" class="value">
                        <g:if test="${serviceManagementProcess?.artifactType?.id}">
                            <g:link controller="resourceType" action="show" id="${serviceManagementProcess?.artifactType?.id}">
                                ${serviceManagementProcess?.artifactType?.name}
                            </g:link>
                        </g:if>
                        <g:else>
                            <span class="info note">No Artifact Types</span>
                            <span class="menuButton">
                            <g:link controller="resourceType" class="create" action="create" params="[metatype:'artifact']">
                                Define a type
                            </g:link>
                            </span>
                        </g:else>
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!serviceManagementProcess?.notificationRecipients?'empty':''}">Notification Recipients:</td>

                    <td valign="top" style="text-align:left;" class="value">
                        <ul>
                            <g:each var="n" in="${serviceManagementProcess.notificationRecipients}">
                                <li><g:link controller="user" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
                            </g:each>
                        </ul>
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!serviceManagementProcess?.implementor?'empty':''}">Implementor team:</td>

                    <td valign="top" class="value"><g:link controller="usergroup" action="show" id="${serviceManagementProcess?.implementor?.id}">${serviceManagementProcess?.implementor?.encodeAsHTML()}</g:link></td>

                </tr>


                <tr class="prop">
                    <td valign="top" class="name ${!serviceManagementProcess?.recipient?'empty':''}">Recipient team:</td>

                    <td valign="top" class="value"><g:link controller="usergroup" action="show" id="${serviceManagementProcess?.recipient?.id}">${serviceManagementProcess?.recipient?.encodeAsHTML()}</g:link></td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!serviceManagementProcess?.procedure?'empty':''}">Procedure:</td>

                    <td valign="top" class="value">${fieldValue(bean: serviceManagementProcess, field: 'procedure')}</td>

                </tr>



            </tbody>
        </table>
        <h3 class="section">Receipts</h3>

        <g:set var="receipts" value="${ProcessReceipt.findAllByProcess(serviceManagementProcess)}"/>
        <g:if test="receipts">
        <table>
            <tr>
                <th>Title</th>
                <th>By</th>
                <th>When</th>
                <th>Outcome</th>
            </tr>
            <g:each in="${ProcessReceipt.findAllByProcess(serviceManagementProcess)}" var="receipt">
                <tr>
                    <td>
                        <g:link controller="processReceipt" action="show" id="${receipt.id}">${receipt.title}</g:link>
                    </td>
                    <td>${receipt.coordinator}</td>
                    <td>
                        <g:relativeDate elapsed="${receipt?.date}" agoClass="ago " untilClass="until "/>

                    </td>
                    <td>${receipt?.outcome}</td>
                </tr>
            </g:each>
        </table>
        </g:if>
        <g:else>
        <div class="section">
            <div class="info note">
                No Receipts
            </div>
        </div>
        </g:else>
    </div>

</div>

</body>
</html>
