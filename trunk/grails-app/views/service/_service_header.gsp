
<span class="name"><g:link controller="service" action="show" id="${service?.id}">${service?.name}</g:link></span>
<span class="type">[<g:link controller="resourceType" action="show" id="${service?.type?.id}">${service?.type?.encodeAsHTML()}</g:link>]</span>
<span class="desc">${service?.description}</span>