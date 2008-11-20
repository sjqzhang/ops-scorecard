<g:if test="${CapabilityAudit.count() > 0 }">
    <span class="menuButton"><g:link class="create" action="createScorecard">Create Scorecard</g:link></span>
</g:if>
<g:else>
    <span class="menuButton"><g:link class="create" action="create">Create an Audit</g:link></span>
</g:else>
