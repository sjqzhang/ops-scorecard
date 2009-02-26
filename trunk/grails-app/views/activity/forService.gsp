<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="activity"/>
    <title>Service Activities: ${service.name} </title>

    <g:javascript>
        var Timeplot_urlPrefix="${createLinkTo(dir:'js',file:'/timeplot/api/1.0/')}";
    </g:javascript>
    <g:javascript src="ajax/api-2.0/simile-ajax-api.js"/>
    <g:javascript src="timeline/api-2.0/timeline-api.js"/>
    <g:javascript src="timeplot/api/1.0/timeplot-api.js"/>
    <script type="text/javascript">
        SimileAjax.History.enabled = false;
        var tl;
        var hideARData=false;
        var hidePRData=false;
        var arData=[];
        var prData=[]
        var dataset={events:[]};
        var viewmode=${params.week?-1:1};

        function addARData(evt){
            arData.push(evt);
        }
        function addPRData(evt){
            prData.push(evt);
        }
        function addData(evt){
            dataset.events.push(evt);
        }
        function setShowARData(elem){
            hideARData=!elem.checked;
        }
        function setShowPRData(elem){
            hidePRData=!elem.checked;
        }

        function onLoad() {
           var eventSource = new Timeline.DefaultEventSource();
           var eventSource2 = new Timeline.DefaultEventSource();
          var bandInfos = [
            Timeline.createBandInfo({
                eventSource:    eventSource,
                timeZone:${g.timeZoneOffset()},
                trackHeight:1.5,
                trackGap:0.2,
                width:          "70%",
                intervalUnit:   viewmode==1?Timeline.DateTime.HOUR:Timeline.DateTime.DAY,
                intervalPixels: viewmode==1?50:86,
                date:new Date(${startDate.getTime()+ 1000L*60*60*12*(params.week?7L:1L)})
            })
              ,
            Timeline.createBandInfo({
                eventSource:    eventSource2,
                timeZone:${g.timeZoneOffset()},
                trackHeight:1.5,
                trackGap:0.2,
                showEventText:  false,
                width:          "30%",
                intervalUnit:   viewmode==1?Timeline.DateTime.HOUR:Timeline.DateTime.DAY,
                intervalPixels: viewmode==1?50:86,
                date:new Date(${startDate.getTime()+ 1000L*60*60*12*(params.week?7L:1L)})
            })
          ];
          bandInfos[1].syncWith = 0;
//          bandInfos[1].highlight = true;
          tl = Timeline.create(document.getElementById("my-timeline"), bandInfos);
            dataset.events=[];
            
            if(!hidePRData){
                eventSource.loadJSON({events:prData}, "${createLink(controller:'activity',action:'forService',id:service.id)}");
            }
            if(!hideARData){
                eventSource2.loadJSON({events:arData}, "${createLink(controller:'activity',action:'forService',id:service.id)}");
            }

        }

        function toggleDate(elem){
            viewmode*=-1;
            onLoad();
            if(viewmode==1){
                elem.innerHTML="Week View";
            }else{
                elem.innerHTML="Day View";
            }
        }
        var resizeTimerID = null;
        function onResize() {
            if (resizeTimerID == null) {
                resizeTimerID = window.setTimeout(function() {
                    resizeTimerID = null;
                    t1.repaint();
                }, 100);
            }
        }
    </script>
</head>
<body>
<script type="text/javascript">
        Event.observe(window,'load', function(e){ onLoad(); });
        Event.observe(window,'resize', function(e){ onResize(); });
</script>
<div class="body view">
    <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
    </g:if>
    <h3>
        Service Activities
    </h3>
    <div class="view service">
        <div class="header service">
            <g:render template="/service/service_header" model="[service:service,showicon:true]"/>
        </div>
    </div>
    <table>
        
        <tr>
            <td colspan="2" style="padding:0;" >
                <div class="section">
                    %{--<span class="link action" onclick="toggleDate(this)">Day View</span>--}%
                    <g:link class="action" action="forService" controller="activity" id="${service.id}" params="${[week:params.week?null:1,datetime:params.datetime?params.datetime:null]}">
                        ${params.week?'Day View':'Week View'}
                    </g:link>
                    %{----}%
                    %{--<span class="floatr">--}%
                    %{--<input type="checkbox" ${params.tlHidePR!='true'?'checked="checked"':''} onchange="setShowPRData(this);onLoad();" id="tlHidePR"/> <label for="tlHidePR">Activities</label>--}%
                    %{--<input type="checkbox" ${params.tlHideAR!='true'?'checked="checked"':''} onchange="setShowARData(this);onLoad();" id="tlHideAR"/> <label for="tlHideAR">Outages</label>--}%
                    %{--</span>--}%
                </div>
                <div id="my-timeline" style="height: 250px;"></div>
            </td>
        </tr>
        <tr>

            <td style="padding:0">
                <g:if test="${processReceiptList}">
                    <g:if test="${params.tlHidePR!='true'}">
                    <script type="text/javascript">
                    <g:each in="${processReceiptList}" var="receipt">
                        <g:set var="jdata" value="${[ start:receipt.actualStart, end:receipt.actualEnd,
                        title:receipt.process.category,
                        image: createLinkTo(dir:'images/skin',file:receipt.outcome=='successful'?'tick.png':receipt.outcome=='withdrawn'?'error.png':'exclamation.png'),
                        link: createLink(action:'show',controller:'processReceipt',id:receipt.id),
                        icon: createLinkTo(dir:'images/skin',file:'bullet_go.png'),
                        textColor:'black',
                        color:receipt.outcome=='successful'?'#0000FF':receipt.outcome=='withdrawn'?'#888888':'#ff0000',
                        isDuration:false,
                        description:receipt.process.toString()+ ', '+(receipt.title?receipt.title:'Untitled')+ ', was '+receipt.outcome ]}"/>
                        addPRData(${jdata.encodeAsJSON()});
                    </g:each>
                    </script>
                    </g:if>
                    <table>
                        <tr>
                            <th >
                                Activities since: <g:relativeDate atDate="${startDate}"/>
                            </th>
                        </tr>
                        <g:each in="${processReceiptList[0..(processReceiptList.size()>4?4:processReceiptList.size()-1)]}" var="receipt">
                            <tbody>
                                <tr>
                                    <td class="cardlink processreceipt ${receipt?.outcome}">
                                        <g:link action="show" controller="processReceipt" title="View Receipt" id="${receipt.id}">
                                            ${receipt.process.category}
                                            <g:if test="${receipt?.title}">
                                                -
                                                "${receipt?.title}"
                                            </g:if>
                                            <g:if test="${receipt.status=='unplanned'}">
                                                <img src="${createLinkTo(dir: 'images/skin', file: 'thumb_down.png')}" alt="unplanned"/>
                                            </g:if>
                                            <g:if test="${receipt.status=='emergency'}">
                                                <img src="${createLinkTo(dir: 'images/skin', file: 'weather_lightning.png')}" alt="emergency"/>
                                            </g:if>
                                            <div class="subtitle">
                                                <g:relativeDate elapsed="${receipt?.date}" agoClass="ago ended" untilClass="until ended"/>
                                                by
                                                ${receipt?.coordinator}
                                                -
                                                <span class="impactlevel ${receipt.impactLevel}" title="Impact level: ${receipt.impactLevel}">${receipt.impactLevel}</span>,
                                                <span class="priority ${receipt.priority}" title="Priority: ${receipt.priority}">${receipt.priority}</span>

                                            <g:if test="${!receipt.changeRequestUrl || !receipt.changeReviewers || ! receipt.securityReviewers}">
                                                    <img src="${createLinkTo(dir: 'images/skin', file: 'flag_red.png')}" alt="Not Authorized"/>
                                            </g:if>
                                            </div>
                                        </g:link>
                                    </td>

                                </tr>
                            </tbody>
                        </g:each>


                    </table>

                    <div class="section" style="text-align:right;">
                        <g:link action="forService" controller="processReceipt" id="${service.id}" >
                            View All Activity&hellip;
                        </g:link>
                    </div>
                </g:if>

                <g:else>
                    <div class="empty info note section">
                        No Recent Activity
                        <g:link action="forService" controller="processReceipt" id="${service.id}">
                        View All Activity&hellip;
                        </g:link>
                    </div>
                </g:else>
            </td>
        </tr>
        <tr>

            <td style="padding:0">

                <g:if test="${availabilityReceiptList}">
                    <g:set var="shortAvailList" value="${availabilityReceiptList[0..(availabilityReceiptList.size()>4?4:availabilityReceiptList.size()-1)]}"/>
                    <g:render template="/availabilityReceipt/listsimple" model="[availabilityReceiptList:shortAvailList,title:'Outages since: '+g.relativeDate(atDate:startDate),hide_service_info:true]"/>
                    <div class="section" style="text-align:right;">
                        <g:link action="forService" controller="availabilityReceipt" id="${service.id}">
                        View All Outages&hellip;
                        </g:link>
                    </div>
                    <g:set var="outagecolors" value="${[0:'red',10:'red',20:'red',30:'red',40:'red',50:'orange',60:'orange',70:'yellow',80:'yellow',90:'blue',100:'green']}"/>
                    <g:if test="${params.tlHideAR!='true'}">
                    <script type="text/javascript">
                    <g:each in="${availabilityReceiptList}" var="receipt">
                        <g:set var="jdata" value="${[
                        start:receipt.startDate,
                        end:receipt.endDate,
                        isDuration:receipt.startDate.compareTo(receipt.endDate)>0,
                        title:receipt.level+'%'+(receipt.process?' &bull;':''),
                        image: createLinkTo(dir:'images/skin',file:'script_edit.png'),
                        link: createLink(action:'show',controller:'availabilityReceipt',id:receipt.id),
                        textColor:outagecolors[receipt.level],
                        color:outagecolors[receipt.level],
                        description:receipt.service.toString()+' service at '+receipt.level+'% availability'+(receipt.process?', Caused by: '+ receipt?.process.toString() + ' process':'') ]}"/>
                        addARData(${jdata.encodeAsJSON()});
                    </g:each>
                    </script>
                    </g:if>
                </g:if>

                <g:else>
                    <div class="empty info note section">
                        No Recent Outages

                        <g:link action="forService" controller="availabilityReceipt" id="${service.id}">
                        View All Outages&hellip;
                        </g:link>
                    </div>
                </g:else>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
