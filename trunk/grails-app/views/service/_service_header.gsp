
<span class="name">
<g:link controller="service" action="show" id="${service?.id}">
    <g:if test="${showicon}">
        <img src="${createLinkTo(dir:'images',file:'skin/package.png')}" width="16px" height="16px"/>
    </g:if>
    ${service?.name} [${service?.type?.encodeAsHTML()}]
</g:link>
</span>
<span class="desc">${service?.description}</span>