<span class="menuButton"><g:link class="create" action="create">Add Process</g:link></span>


<table class="list" style="margin-top: 10px;">
    <tr>
        <td style="background-color: azure;">
            <span style="color:#808080;font-weight: bold;font-size:10pt;padding-right:10px;">Categories</span>
        </td>
    </tr>
    <tr>
        <td><g:link controller="serviceManagementProcess" action="list">All</g:link></td>
    </tr>
    <g:each var="category" in="${ServiceManagementProcess.constraints.category.inList}">
        <tr>
            <td><g:link controller="serviceManagementProcess" action="search" params="[category:category]">${category}</g:link></td>
        </tr>
    </g:each>
</table>

