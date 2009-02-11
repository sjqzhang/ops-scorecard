<g:set var="options" value="${session.sscorecard_options?session.sscorecard_options:[goalsMetPct:true,processCoveragePct:true,processQualityPct:true,
            serviceAvailabilityPct:true,estimatedOutageCost:true,MTBFTime:true,MTTRTime:true,serviceFailuresCount:true,smActivitiesCount:true,highImpactActivityPct:true,
            smSuccessPct:true,smActivitiesImpactedAvailabilityCount:true,smActivitiesUnplannedCount:true]}"/>
<g:set var="serviceoptions" value="${session.sscorecard_services?session.sscorecard_services:[:]}"/>
<g:set var="metricsList" value="${ServiceScorecardBase.metricsList}"/>

    <span class="link action floatr" onclick="['customizer','customizer-toggle'].each(Element.toggle);" id="customizer-toggle"  style="">
        Customize Report
        <img src="${createLinkTo(dir:'images/menus',file:'icon-tiny-disclosure.png')}" width="12px" height="12px"/>
    </span>
<g:form action="table">
    <g:if test="${params?.max}">
        <g:hiddenField name="max" value="${params.max}"/>
    </g:if>
    <g:if test="${params?.offset}">
        <g:hiddenField name="offset" value="${params.offset}"/>
    </g:if>
    <g:if test="${params?.sort}">
        <g:hiddenField name="sort" value="${params.sort}"/>
    </g:if>
    <g:if test="${params?.order}">
        <g:hiddenField name="order" value="${params.order}"/>
    </g:if>
    <div style="text-align:left;vertical-align:top;width:200px; display:none" id="customizer" >
                <span class="link action " onclick="['customizer','customizer-toggle'].each(Element.toggle);">
                    Customize Report
                    <img src="${createLinkTo(dir:'images/menus',file:'icon-tiny-disclosure-open.png')}" width="12px" height="12px"/>
                </span>
                <div class="presentation">

                    <table>
                        <tr>
                            <th colspan="2">Week</th>
                        </tr>
                        <tr>
                            <td colspan="2">

                                <select name="datetime">
                                    <g:set var="lastscoresarr" value="${ServiceScorecard.listOrderByEndDate(order:'asc',offset:0,max:1)}"/>
                                    <g:set var="weekms" value="${7*24*60*60*1000}"/>
                                    <g:set var="nowms" value="${System.currentTimeMillis()}"/>
                                    <g:set var="nowdates" value="${ServiceScorecardService.determinePreviousWeekForDatetime(params.datetime?params.datetime.toLong():nowms)}"/>
                                    <g:if test="${lastscoresarr}">
                                        <g:set var="lastscore" value="${lastscoresarr[0]}"/>
                                        <g:set var="lasttimems" value="${lastscore.endDate.getTime()}"/>
                                        <g:set var="weekcount" value="${Math.floor((nowms-lasttimems)/weekms).toInteger()}"/>
                                        <g:set var="weekrange" value="${0..(weekcount)}"/>
                                        <!-- weekrange: ${weekrange}
                                            nowdates.start=${nowdates.start.getTime()}
                                        -->
                                    </g:if>
                                    <g:else>
                                        <g:set var="weekrange" value="${0..1}"/>
                                    </g:else>
                                        <g:each in="${weekrange}" var="weekback">
                                            <g:set var="weektimems" value="${nowms-(weekms*weekback)}"/>
                                            <g:set var="weekdates" value="${ServiceScorecardService.determinePreviousWeekForDatetime(weektimems)}"/>

                                            <!-- weekback: ${weekback}
                                                weekdates.start=${weekdates.start.getTime()}
                                            -->
                                            <option value="${weektimems}" ${nowdates.start==weekdates.start?'selected="selected"':''}>
                                                <g:formatDate date="${weekdates.start.getTime()}" format="yyyy/MM/dd"/>
                                                -
                                                <g:formatDate date="${weekdates.end.getTime()}" format="yyyy/MM/dd"/>
                                            </option>
                                        </g:each>

                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th colspan="2">Services</th>
                        </tr>
                        <g:each in="${Service.list()}" var="service">

                            <tr>
                                <td><g:checkBox name="service.${service.id}" value="true" checked="${serviceoptions?serviceoptions[service.id.toString()]:true}" id="service.${service.id}"/></td>
                                <td><label for="service.${service.id}">${service.name}</label></td>
                            </tr>

                        </g:each>
                        <tr>
                            <th colspan="2">Metrics</th>
                        </tr>
                        <g:each in="${metricsList}" var="metric">
                            <tr>
                                <td><g:checkBox name="show.${metric}" value="true" checked="${options[metric]?true:false}" id="show.${metric}"/></td>
                                <td><label for="show.${metric}"><g:message code="metric.${metric}"/></label></td>
                            </tr>

                        </g:each>
                       
                        <tr>
                            <td colspan="2">
                                <g:hiddenField name="customView" value="" id="customViewField"/>
                                <g:submitButton name="Filter" value="Update" onclick="\$('customViewField').value='true';return true;"/>
                            </td>
                        </tr>
                    </table>
                </div>
    </div>
</g:form>