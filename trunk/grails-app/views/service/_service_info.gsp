<style type="text/css">
    span.label{
        font-weight:bold;
        text-align:right;
    }
    span.label,span.infoitem{
        float:left;
        width:22%;
        padding:3px;
    }
</style>
<div>
<span class="label">Status: </span>
<span class="infoitem">${service?.status}</span>
<span class="label">Customer: </span>
<span class="infoitem"><g:link controller="user" action="show" id="${service?.customer?.id}">${service?.customer?.encodeAsHTML()}</g:link></span>
    <div class="clear"></div>
</div>
<div>
<span class="label">Fragile: </span>
<span class="infoitem">${service?.isFragile?'Yes':'No'}</span>
<span class="label">Owner: </span>
<span class="infoitem"><g:link controller="user" action="show" id="${service?.ownerResponsible?.id}">${service?.ownerResponsible?.encodeAsHTML()}</g:link></span>
    <div class="clear"></div>
</div>
<div>
<span class="label">Mission Critical: </span>
<span class="infoitem">${service?.isMissionCritical?'Yes':'No'}</span>
<span class="label">Reprovisioning Duration: </span>
<span class="infoitem">${service?.reprovisioningDuration}</span>
    <div class="clear"></div>
</div>
<div>
<span class="label">Monitored: </span>
<span class="infoitem">${service?.isMonitored?'Yes':'No'}</span>
<span class="label">Hourly Outage Cost: </span>
<span class="infoitem"><g:if test="${service?.outageCost}">
                            <g:formatNumber number="${new Integer(service?.outageCost)}" formatName="\$###,##0"/>
                        </g:if></span>
    <div class="clear"></div>
</div>