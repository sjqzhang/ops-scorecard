<span class="menuButton"><g:link class="create" action="create">Add Team</g:link></span>


<table style="margin-top: 10px;">
    <tr>
        <td style="background-color: azure;">
            <span style="color:#808080;font-weight: bold;font-size:10pt;padding-right:10px;">Functions</span>
            <g:link controller="usergroup" action="list"><span class="controllink">Edit</span></g:link>
        </td>
    </tr>
    <tr>
        <td><g:link action="list" >All functions</g:link></td>
    </tr>
    <g:each in="${Usergroup.constraints.function.inList}" var="function">
        <tr>
            <td>
                <g:link action="search" params="[function:function]" >${function}</g:link>
            </td>
        </tr>
    </g:each>
</table>
