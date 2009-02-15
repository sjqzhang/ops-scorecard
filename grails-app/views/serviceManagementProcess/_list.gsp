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
        </g:each>
    </tbody>
</table>