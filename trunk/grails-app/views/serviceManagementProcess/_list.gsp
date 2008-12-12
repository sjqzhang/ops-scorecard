<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Category</th>
            <th>Automation level</th>
            <th>Implementor Team</th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${processes}" status="i" var="serviceManagementProcess">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <td>
                    <g:link controller="serviceManagementProcess" action="show" id="${serviceManagementProcess.id}"
                            title="${serviceManagementProcess?.description}">
                        ${fieldValue(bean: serviceManagementProcess, field: 'name')}
                    </g:link>
                </td>
                <td>${fieldValue(bean: serviceManagementProcess, field: 'category')}</td>
                <td>${fieldValue(bean: serviceManagementProcess, field: 'automationLevel')}</td>
                <td>
                    <g:link controller="usergroup" action="show" id="${serviceManagementProcess?.implementor?.id}">
                        ${serviceManagementProcess?.implementor?.name}
                    </g:link>
                </td>

            </tr>
            <g:set var="receipts" value="${ProcessReceipt.findAllByProcess(serviceManagementProcess)}"/>
            <g:if test="${receipts}">
                <tr>
                    <td colspan="4">

                        <table>
                            <g:each in="${receipts}" var="receipt">
                                <tbody>
                                    <tr>
                                        <td width="100">
                                            ${receipt?.title}
                                        </td>
                                        <td width="40">
                                            by: ${receipt?.coordinator}
                                        </td>
                                        <td width="40">
                                            <g:relativeDate elapsed="${receipt?.date}" agoClass="ago ended" untilClass="until ended"/>
                                        </td>
                                        <td width="40">
                                            ${receipt?.outcome}
                                        </td>
                                    </tr>
                                </tbody>
                            </g:each>
                        </table>
                    </td>
                </tr>
            </g:if>
        </g:each>
    </tbody>
</table>