<span class="resourceName"><g:link action="show" controller="service" id="${service.id}">${service.name}</g:link> ${service.type.name}</span>
<span class="resourceDescription">${service?.description}</span>
<table>
    <tbody>
        <tr>
            <th>URL</th>
            <td>
                 <g:if test="${service?.serviceURL}">
                    <g:link url="${service.serviceURL}">${service.serviceURL}</g:link>
                </g:if>
                <g:else>
                    <i>Not defined</i>
                </g:else>
            </td>
            <th>Status</th>
            <td>${service.status}</td>
        </tr>
        <tr>
            <th>Customer</th>
            <td>
                <g:if test="${service?.customer}">
                    <g:link action="show" controller="user" id="${service.customer.id}">${service.customer}</g:link>
                </g:if>
                <g:else>
                    <i>Not defined</i>
                </g:else>
            </td>
            <th>Owner</th>
            <td>
                <g:if test="${service?.ownerResponsible}">
                    <g:link action="show" controller="user" id="${service.ownerResponsible.id}">${service.ownerResponsible}</g:link>
                </g:if>
                <g:else>
                    <i>Not defined</i>
                </g:else>
            </td>
        </tr>
        <tr>
            <th>Next Maint.</th><td>${service?.nextMaintenanceWindow}</td>
            <th>Flags</th>
            <td>
                <g:if test="${service.isFragile}">
                    <img src="${createLinkTo(dir: 'images', file: 'icon-tiny-fragile.png')}" alt="" title="is fragile"/>
                </g:if>
                <g:if test="${service.isMonitored}">
                    <img src="${createLinkTo(dir: 'images', file: 'icon-tiny-monitored.png')}" alt="" title="is monitored"/>
                </g:if>
                <g:if test="${service.isMissionCritical}">
                    <img src="${createLinkTo(dir: 'images', file: 'icon-tiny-missioncritical.png')}" alt="" title="is mission critical"/>
                </g:if>
            </td>
        </tr>
    </tbody>
</table>
