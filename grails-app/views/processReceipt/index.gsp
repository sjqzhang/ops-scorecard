<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="receipt"/>
    <title>Receipts</title>

    <g:javascript>
        var Timeplot_urlPrefix="${createLinkTo(dir:'js',file:'/timeplot/api/1.0/')}";
    </g:javascript>
    <g:javascript src="ajax/api-2.0/simile-ajax-api.js"/>
    <g:javascript src="timeline/api-2.0/timeline-api.js"/>
    <g:javascript src="timeplot/api/1.0/timeplot-api.js"/>
    <script type="text/javascript">
        var tl;
        var dataset={events:[]};
        var viewmode=-1;

        function addData(evt){
            dataset.events.push(evt);
        }

        function onLoad() {
           var eventSource = new Timeline.DefaultEventSource();
          var bandInfos = [
            Timeline.createBandInfo({
                eventSource:    eventSource,
                timeZone:${g.timeZoneOffset()},
                width:          "70%",
                intervalUnit:   viewmode==1?Timeline.DateTime.HOUR:Timeline.DateTime.DAY,
                intervalPixels: 80
            }),
            Timeline.createBandInfo({
                eventSource:    eventSource,
                timeZone:${g.timeZoneOffset()},
                showEventText:  false,
                trackHeight:    0.5,
                trackGap:       0.2,
                width:          "30%",
                intervalUnit:   viewmode==1?Timeline.DateTime.DAY:Timeline.DateTime.WEEK,
                intervalPixels: 200
            })
          ];
          bandInfos[1].syncWith = 0;
          bandInfos[1].highlight = true;
          tl = Timeline.create(document.getElementById("my-timeline"), bandInfos);
          eventSource.loadJSON(dataset, "${createLink(controller:'processReceipt',action:'index')}");
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
    <table>
        <tr>
            <td class="toollink" width="50%">

                <g:link class="maintool" controller="processReceipt" action="list">
                    <img align="center" src="${createLinkTo(dir: 'images', file: 'icon-med-receipts.png')}" height="65px" alt="Services"/>
                    <span class="title">Process Receipts</span>

                </g:link>

            </td>
            <td class="toollink" width="50%">

                <g:link class="maintool" controller="availabilityReceipt">
                    <img src="${createLinkTo(dir: 'images', file: 'icon-med-receipts.png')}" height="65px" alt="Processes"/>
                    <span class="title">Availability Receipts</span>

                </g:link>

            </td>
        </tr>
        <tr>
            <td style="padding:0">
                <g:if test="${processReceiptList}">
                    <script type="text/javascript">
                    <g:each in="${processReceiptList}" var="receipt">
                        <g:set var="jdata" value="${[ start:receipt.actualStart, end:receipt.actualEnd,
                         title:receipt.process.name + ' : ' + (receipt.title?receipt.title:'Untitled'),
                        image: createLinkTo(dir:'images/skin',file:'script_edit.png'),
                        link: createLink(action:'show',controller:'processReceipt',id:receipt.id),
                        textColor:'black',
                        color:receipt.outcome=='successful'?'green':receipt.outcome=='withdrawn'?'gray':'red',
                        description:receipt.process.toString()+' was '+receipt.outcome ]}"/>
                        addData(${jdata.encodeAsJSON()});
                    </g:each>
                    </script>
                    <table>
                        <tr>
                            <th >
                                Most Recent
                            </th>
                        </tr>
                        <g:each in="${processReceiptList}" var="receipt">
                            <tbody>
                                <tr>
                                    <td class="cardlink processreceipt ${receipt?.outcome}">
                                        <g:link action="show" controller="processReceipt" title="View Receipt" id="${receipt.id}">
                                            ${receipt?.title}
                                            <div class="subtitle">
                                                <g:relativeDate elapsed="${receipt?.date}" agoClass="ago ended" untilClass="until ended"/>
                                                by
                                                ${receipt?.coordinator}
                                            </div>
                                        </g:link>

                                    </td>

                                </tr>
                            </tbody>
                        </g:each>

                        
                    </table>
                </g:if>
            </td>
            <td style="padding:0">

                <g:if test="${availabilityReceiptList}">
                    <g:render template="/availabilityReceipt/listsimple" model="[availabilityReceiptList:availabilityReceiptList]"/>

                    <g:set var="outagecolors" value="${[0:'red',10:'red',20:'red',30:'red',40:'red',50:'orange',60:'orange',70:'yellow',80:'yellow',90:'blue',100:'green']}"/>
                    <script type="text/javascript">
                    <g:each in="${availabilityReceiptList}" var="receipt">
                        <g:set var="jdata" value="${[
                        start:receipt.startDate,
                        end:receipt.endDate,
                        isDuration:receipt.startDate.compareTo(receipt.endDate)>0,
                        title:receipt.service.toString()+' at '+receipt.level+'%'+(receipt.process?' ('+receipt?.process?.toString()+')':''),
                        image: createLinkTo(dir:'images/skin',file:'script_edit.png'),
                        link: createLink(action:'show',controller:'availabilityReceipt',id:receipt.id),
                        textColor:'black',
                        color:outagecolors[receipt.level],
                        description:receipt.service.toString()+' service at '+receipt.level+'% availability'+(receipt.process?', Caused by: '+ receipt?.process.toString() + ' process':'') ]}"/>
                        addData(${jdata.encodeAsJSON()});
                    </g:each>
                    </script>
                </g:if>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="padding:0;" >
                <div class="section">
                    <span class="link action" onclick="toggleDate(this)">Day View</span>
                </div>
                <div id="my-timeline" style="height: 200px;"></div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>