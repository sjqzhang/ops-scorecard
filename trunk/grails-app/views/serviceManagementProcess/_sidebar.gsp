<span class="menuButton"><g:link class="create" action="create">Add Process</g:link></span>


<table class="list" style="margin-top: 10px;">
    <tr>
        <td class="title">
            Categories
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

