<span class="menuButton"><g:link class="create" action="create">Add Individual</g:link></span>

<g:set var="groups" value="${Usergroup.list()}"/>
<g:if test="${groups}">
<table class="list" style="margin-top: 10px;">
    <tr>
        <td style="background-color: azure;">
            <span style="color:#808080;font-weight: bold;font-size:10pt;padding-right:10px;">Teams</span>
            <g:link controller="usergroup" action="list"><span class="controllink">Edit</span></g:link>
        </td>
    </tr>

    <tr>
        <td><g:link action="list" >All teams</g:link></td>
    </tr>
    <g:each var="group" in="${groups}">
        <tr>
            <td>
                <g:link action="search" params="[group: group.id]"> ${group.name}</g:link>
            </td>
        </tr>
    </g:each>
</table>
</g:if>
<g:else>
<table class="list" style="margin-top: 10px;">
    <tr>
        <td style="background-color: azure;">
            <span style="color:#808080;font-weight: bold;font-size:10pt;padding-right:10px;">Teams</span>
        </td>
    </tr>
    <tr>
        <td>
            <p></p><i>No teams defined</i>.</p>
            <p><g:link controller="usergroup" action="create"><span class="controllink">Add a team</span></g:link></p>
        </td>
    </tr>
</table>
</g:else>