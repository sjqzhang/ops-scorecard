<span class="menuButton"><g:link class="create" action="create">Add Artifact</g:link></span>

<g:set var="resourceTypes" value="${ResourceType?.list()}"/>

<g:if test="${resourceTypes}">
<table class="list" style="margin-top: 10px;">
    <tr>
        <td style="background-color: azure;">
            <span style="color:#808080;font-weight: bold;font-size:10pt;padding-right:10px;">Types</span>
            <g:link controller="resourceType" action="list"><span class="controllink">Edit</span></g:link>
        </td>
    </tr>
    <tr>
        <td><g:link action="list" >All types</g:link></td>
    </tr>
    <g:each var="type" in="${ResourceType?.list()}">
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
        <td style="background-color: azure;">
            <span style="color:#808080;font-weight: bold;font-size:10pt;padding-right:10px;">Types</span>
        </td>
    </tr>
    <tr>
        <td>
            <p></p><i>No types defined</i>.</p>
            <p><g:link controller="resourceType" action="create"><span class="controllink">Add a type</span></g:link></p>
        </td>
    </tr>
</table>
</g:else>