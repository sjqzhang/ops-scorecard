<span class="menuButton"><g:link class="create" action="create">Create Audit</g:link></span>

<g:set var="types" value="${ResourceType.findAllByMetatype('service')}"/>
<g:if test="${types}">
<table class="list" style="margin-top: 10px;">
    <tr>
        <td style="background-color: azure;">
            <span style="color:#808080;font-weight: bold;font-size:10pt;padding-right:10px;">Service types</span>
        </td>
    </tr>

    <tr>
        <td><g:link action="list" >All types</g:link></td>
    </tr>
    <g:each var="type" in="${types}">
        <tr>
            <td>
                <g:link action="search" params="[serviceType: type.name]"> ${type.name}</g:link>
            </td>
        </tr>
    </g:each>
</table>
</g:if>

