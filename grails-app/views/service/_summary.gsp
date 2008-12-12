<h1>Service Summary</h1>
<div class="header service">
    <span class="name"><g:link action="show" controller="service" id="${service.id}">${service.name}</g:link> ${service.type.name}</span>
    <span class="desc">${service?.description}</span>    
</div>
<table class="summary" cellpadding="0" cellspacing="0">
    <tbody>
        <tr>
            <th>URL</th>
            <td class="${!service?.serviceURL?'empty':''}">
                 <g:if test="${service?.serviceURL}">
                    <g:link url="${service.serviceURL}">${service.serviceURL}</g:link>
                </g:if>
                <g:else>
                    Not defined
                </g:else>
            </td>
            <th>Status</th>

            <td class="${!service?.status?'empty':''}">${service.status}</td>
        </tr>
        <tr>
            <th>Customer</th>
            <td class="${!service?.customer?'empty':''}">
                <g:if test="${service?.customer}">
                    <g:link action="show" controller="user" id="${service.customer.id}">${service.customer}</g:link>
                </g:if>
                <g:else>
                    Not defined
                </g:else>
            </td>
            <th>Owner</th>
            <td class="${!service?.ownerResponsible?'empty':''}">
                <g:if test="${service?.ownerResponsible}">
                    <g:link action="show" controller="user" id="${service.ownerResponsible.id}">${service.ownerResponsible}</g:link>
                </g:if>
                <g:else>
                    Not defined
                </g:else>
            </td>
        </tr>
        <tr>
            <th>Next Maint.</th><td>
            <g:relativeDate atDate="${service?.nextMaintenanceWindow}"/>
            </td>
        </tr>
        <tr>
            <th>Flags:</th>
            <td colspan="3">
                <g:render template="/service/service_flags" model="[service:service]"/>
            </td>
        </tr>
    </tbody>
</table>
