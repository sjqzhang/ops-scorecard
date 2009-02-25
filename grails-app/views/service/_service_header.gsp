<div class="content">
    <div class="detail">
<span class="name">
<g:link controller="service" action="show" id="${service?.id}" title="View Service Definition">
    <img src="${createLinkTo(dir:'images',file:'skin/package.png')}" width="16px" height="16px"/>
    ${service}
</g:link>
</span>
<span class="desc">${service?.description}</span>
</div>


    <div class="context-links">
    <g:link class="activity" action="forService" controller="activity" id="${service.id}" title="View Service Activity">
        <img src="${createLinkTo(dir: 'images', file: message(code:'menus.default.image.activity'))}" alt="Activity"/>
        Activity
    </g:link>
    <g:link class="activity" action="table" controller="serviceScorecard" params="${[('service.'+service.id.toString()):true,customView:true,datetime:params.datetime?params.datetime:null]}" title="View All Service Scorecards">
        <img src="${createLinkTo(dir: 'images', file: message(code:'menus.default.image.score'))}" alt="Scorecards"/>
        Scorecards
    </g:link>
    </div>


    <div class="clear"></div>
</div>