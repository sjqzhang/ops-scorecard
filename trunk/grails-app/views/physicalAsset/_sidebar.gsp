<g:set var="resourceTypes" value="${ResourceType.findAllByMetatype('asset')}"/>

<g:if test="${resourceTypes}">
    <span class="menuButton"><g:link class="create" action="create">Add Asset</g:link></span>
<table class="list" style="margin-top: 10px;">
    <tr>
        <td class="title">
            Types
            <g:link controller="resourceType" action="list" style="display:inline"><span class="controllink">Edit</span></g:link>
        </td>
    </tr>
    <tr>
        <td><g:link action="list" >All types</g:link></td>
    </tr>
    <g:each var="type" in="${resourceTypes}">
        <tr>
            <td>
                <g:link action="list" params="[resourceType: type.name]"> ${type.name}</g:link>
            </td>
        </tr>
    </g:each>
</table>
</g:if>
<g:else>
<table class="list" style="margin-top: 10px;">
    <tr>
        <td class="title">
            Types
        </td>
    </tr>
    <tr>
        <td>
            <p><g:link controller="resourceType" action="create" params="[metatype:'asset']"><span class="controllink">Add an asset type</span></g:link></p>
        </td>
    </tr>
</table>
</g:else>