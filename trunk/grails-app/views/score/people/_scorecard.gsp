
<h2>Staffing</h2>
<g:set var="processes" value="${ServiceManagementProcess.findAllByService(service)}"/>
<g:render template="/service/peopleCoverageSummary" model="[processes:processes]"/>