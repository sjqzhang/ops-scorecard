<%@ page contentType="text/plain;charset=UTF-8" %># text audit data
# for process id ${serviceManagementProcess.id}
<g:set var="audits" value="${CapabilityAudit.findAllByService(serviceManagementProcess.service)}"/>
# date,control,process,cumulative
<g:if test="${audits}">
<g:each in="${audits}" var="audit">
<%="\n"%>
${formatDate(format:'yyyy-MM-dd HH:mm:ssZ',date:audit.auditDate)},${audit.calculateScores().control},${audit.calculateScores().process},${audit.calculateScores().cumulative}
</g:each>
</g:if>
