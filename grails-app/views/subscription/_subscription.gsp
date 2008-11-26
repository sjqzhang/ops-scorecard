<li onmouseover="$(butt${subscription.id}).show();" onmouseout="$(butt${subscription.id}).hide();">${subscription}
    <g:remoteLink action="delete" controller="subscription"
            id="${subscription.id}"
            update="subscriptions" title="Delete this subscription">
        <img id="butt${subscription.id}"
                src="${createLinkTo(dir: 'images/skin', file: 'database_delete.png')}"
                alt="del" style="display:none;"/>
    </g:remoteLink>
</li>