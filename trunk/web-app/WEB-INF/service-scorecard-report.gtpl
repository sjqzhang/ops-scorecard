<span class="resourceName"><g:link action="show" controller="service" id="${service.id}">${service.name}</g:link></span>
<span class="resourceDescription">${service?.description}</span>
<table>
    <tbody>
        <tr>
            <th>URL</th>
            <td>
                ${service?.serviceURL}"
            </td>
            <th>Status</th>
            <td>${service.status}</td>
        </tr>
        <tr>
            <th>Customer</th>
            <td>
                ${service?.customer}"
            </td>
            <th>Owner</th>
            <td>
                ${service?.ownerResponsible}
            </td>
        </tr>
        <tr>
            <th>Next Maint.</th><td>${service?.nextMaintenanceWindow}</td>
            <th>Flags</th>
            <td>
                <% if (service.isFragile) { %>
                <i>fragile</i>
                <% } %>
            </td>
        </tr>
    </tbody>
</table>

<span style="font-size:12pt;font-weight:bold;">Capability</span>
