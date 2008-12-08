
<h3>Process staffing</h3>
<table>

    <thead>
        <tr>
            <g:sortableColumn property="category" title="Category"/>
            <g:sortableColumn property="name" title="Name"/>
            <g:sortableColumn property="description" title="Description"/>
            <g:sortableColumn property="implementor?.name" title="Team"/>
            <th>Team Size</th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${processes}" var="process">
            <tr>
                <td>
                    ${fieldValue(bean: process, field: 'category')}
                </td>
                <td>
                    <g:link action="show" controller="serviceManagementProcess"
                            title="${process.category}"
                            id="${process.id}">${fieldValue(bean: process, field: 'name')}</g:link>
                </td>
                <td>
                    ${fieldValue(bean: process, field: 'description')}
                </td>
                <td>
                    <g:link action="show" controller="usergroup" title="team"
                            id="${process.implementor?.id}">${process.implementor?.name}</g:link>
                </td>

                <td>
                    ${process.implementor?.users ? process.implementor.users.size() : 0}
                </td>
            </tr>
        </g:each>
    </tbody>
</table>
 