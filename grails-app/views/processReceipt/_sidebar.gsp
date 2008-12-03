<span class="menuButton"><g:link class="create" action="create">Create Receipt</g:link></span>

<g:set var="services" value="${Service?.list()}"/>

<g:if test="${services}">
<table class="list" style="margin-top: 10px;">
    <tr>
        <td style="background-color: azure;">
            <span style="color:#808080;font-weight: bold;font-size:10pt;padding-right:10px;">Services</span>
        </td>
    </tr>
    <tr>
        <td><g:link action="list" >All services</g:link></td>
    </tr>
    <g:each var="service" in="${services}">
        <tr>
            <td>
                <g:link action="search" params="['service': service.id]"> ${service.name}</g:link>
            </td>
        </tr>
    </g:each>
</table>
</g:if>
<g:else>
<table class="list" style="margin-top: 10px;">
    <tr>
        <td style="background-color: azure;">
            <span style="color:#808080;font-weight: bold;font-size:10pt;padding-right:10px;">Services</span>
        </td>
    </tr>
    <tr>
        <td>
            <p></p><i>No services defined</i>.</p>
            <p><g:link controller="service" action="create"><span class="controllink">Add a service</span></g:link></p>
        </td>
    </tr>
</table>
</g:else>