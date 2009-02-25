<g:if test="${type}">
    <g:if test="${type=='$'}">
        <g:formatNumber number="${new Float(value)}" formatName="\$###,##0"/>
    </g:if>
    <g:elseif test="${type=='%'}">
        <g:formatNumber number="${new Float(value)}" formatName="###.#"/>${type}
    </g:elseif>
    <g:elseif test="${type=='/%'}">
        <g:formatNumber number="${new Float(value * 100)}" formatName="###.#"/>%
    </g:elseif>
    <g:elseif test="${type=='h'}">
        <g:formatNumber number="${new Float(value)}" formatName="###.#"/>${type}
    </g:elseif>
    <g:else>
        ${value}${type}
    </g:else>
</g:if>
<g:else>
${value}
</g:else>