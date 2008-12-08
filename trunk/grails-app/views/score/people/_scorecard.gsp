
<span style="font-size:12pt;font-weight:bold;">Staffing</span>
<g:set var="processes" value="${ServiceManagementProcess.findAllByService(service)}"/>
<g:render template="/service/peopleCoverageSummary" model="[processes:processes]"/>
<br/>