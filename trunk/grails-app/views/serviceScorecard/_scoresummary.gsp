<td class="scoresummary">
<g:if test="${score && metric}">
    <g:set var="metricsTypes" value="${ServiceScorecardBase.metricsTypes}"/>
    <g:set var="metricsPositivity" value="${ServiceScorecardBase.metricsPositivity}"/>
    <g:set var="value" value="${score[metric]}"/>
    <g:set var="valueLabel" value="${metricsTypes[metric]}"/>
    <g:set var="titleKey" value="metric.${metric}"/>
    <g:set var="titleInfoKey" value="metric.${metric}.info"/>

    <g:if test="${null!= score.goals && metric!='goalsMetPct'}">
        <g:if test="${metricsPositivity[metric]!=0f}">
            <g:set var="goalValue" value="${score.goals[metric]}"/>
        </g:if>
        <g:if test="${metricsPositivity[metric]>0 && score[metric] >= score.goals[metric]}">
            <g:set var="className" value="good"/>
        </g:if>
        <g:elseif test="${(metricsPositivity[metric]==null||metricsPositivity[metric]<0) && score[metric] <= score.goals[metric]}">
            <g:set var="className" value="good"/>
        </g:elseif>
        <g:elseif test="${metricsPositivity[metric]>0 && score[metric] < score.goals[metric]}">
            <g:set var="className" value="bad"/>
        </g:elseif>
        <g:elseif test="${(metricsPositivity[metric]==null||metricsPositivity[metric]<0) && score[metric] > score.goals[metric]}">
            <g:set var="className" value="bad"/>
        </g:elseif>
    </g:if>
    <g:elseif test="${metric=='goalsMetPct'}">
                <g:set var="className" value="good"/>
    </g:elseif>
</g:if>

<span class="value ${className?className:''}" ${titleInfoKey?'title="'+message(code:titleInfoKey).encodeAsHTML()+'"':''}>
    <g:render template="metricvalue" model="[value:value,type:valueLabel]"/>
</span>
<span class="title"  ${titleInfoKey?'title="'+message(code:titleInfoKey).encodeAsHTML()+'"':''}>
    ${title?title:''}
    ${titleKey?message(code:titleKey):''}
</span>
<g:if test="${goalValue!=null && metric!='goalsMetPct'}">
    <span class="goal">
        Goal: 
        <g:render template="metricvalue" model="[value:goalValue,type:valueLabel]"/>
    </span>
</g:if>
</td>
<td class="graph">
    <g:render template="scoreitemgraph" model="[serviceScorecardInstance:score,previousscores:previousscores,metricsTypes:metricsTypes,metric:metric,goalsmet:className=='good']"/>
</td>
