<%--
  Created by IntelliJ IDEA.
  User: greg
  Date: Dec 16, 2008
  Time: 10:30:38 AM
  To change this template use File | Settings | File Templates.
--%>
<g:if test="${service}">
    <g:set var="processes" value="${ServiceManagementProcess.findAllByService(service)}"/>
    <g:if test="${processes}">
        <g:select name="${selectName?selectName:params.selectName?params.selectName:'process'}" from="${processes?processes:[]}" optionKey="id" optionValue="name" noSelection="['null':noselection?noselection:params.noselection?params.noselection:'-Select a Process-']" value="${selected?selected:params.selected}"/>
    </g:if>
    <g:else>
        <span class="note info">${noselection?noselection:params.noselection?params.noselection:'-Select a Process-'}</span>
    </g:else>
</g:if>
<g:else>
    <span class="note info">${noselection?noselection:params.noselection?params.noselection:'-Select a Process-'}</span>
</g:else>