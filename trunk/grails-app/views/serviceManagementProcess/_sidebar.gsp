<span class="menuButton"><g:link class="create" action="create">Add Process</g:link></span>

<div style="margin-top:10px;">
<span class="menuButton"><g:link class="create" action="createScorecard">Create Scorecard</g:link></span>
</div>

<table class="list" style="margin-top: 10px;">
    <tr>
        <td style="background-color: azure;">
            <span style="color:#808080;font-weight: bold;font-size:10pt;padding-right:10px;">Categories</span>
        </td>
    </tr>
    <tr>
        <td><g:link controller="serviceManagementProcess" action="list">All</g:link></td>
    </tr>
    <tr>
        <td><g:link controller="serviceManagementProcess" action="search" params="[category:'acceptance']">Acceptance</g:link></td>
    </tr>
    <tr>
        <td><g:link controller="serviceManagementProcess" action="search" params="[category:'build']">Build</g:link></td>
    </tr>
    <tr>
        <td><g:link controller="serviceManagementProcess" action="search" params="[category:'detective']">Detective control</g:link></td>
    </tr>
    <tr>
        <td><g:link controller="serviceManagementProcess" action="search" params="[category:'escalation']">Escalation</g:link></td>
    </tr>
    <tr>
        <td><g:link controller="serviceManagementProcess" action="search" params="[category:'implementation']">Implementation</g:link></td>
    </tr>
    <tr>
        <td><g:link controller="serviceManagementProcess" action="search" params="[category:'release']">Release</g:link></td>
    </tr>
    <tr>
        <td><g:link controller="serviceManagementProcess" action="search" params="[category:'verification']">Verification</g:link></td>
    </tr>

</table>

