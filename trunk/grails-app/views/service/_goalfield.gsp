<tr class="prop">
<td valign="top" class="bname" style="width:100px">
    <label for="goals.${metric}" title="${message(code:"metric."+metric+".info").encodeAsHTML()}"><g:message code="metric.${metric}"/>:</label>
</td>

<td valign="top" class=" ${hasErrors(bean:service,field:'goals.'+metric,'errors')}" style="width:20px">
    <input type="text" id="goals.${metric}" name="goals.${metric}" value="${fieldValue(bean:service,field:'goals.'+metric)}" size="5"/>
</td>
<td class="info note" style="text-align:left;width:auto;">
    <g:if test="${metricsTypes[metric]}">
        in <g:message code="metric.measurement.${metricsTypes[metric]}"/>
    </g:if>
</td>
</tr>