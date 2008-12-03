<span style="font-size:12pt;font-weight:bold;">New Inventory Items</span>

<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Type</th>
            <th>Description</th>
            <th>Created</th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${inventoryScorecardList}" status="i" var="scorecard">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <!-- name -->
                <td>
                    <g:link controller="${scorecard.resource.type.metatype}" action="show" id="${scorecard.resource.id}">
                        ${scorecard.resource.name}
                    </g:link>

                </td>
                <td>
                    ${scorecard.resource.class.name}
                </td>
                <!-- description -->
                <td>
                    ${scorecard.resource.description}
                </td>
                <!--create date-->
                <td>
                ${fieldValue(bean:scorecard.resource, field:'createDate')}
                </td>


            </tr>
        </g:each>
    </tbody>
</table>



