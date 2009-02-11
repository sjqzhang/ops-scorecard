

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <meta name="guideitem" content="servicescorecard"/>
        <title>ServiceScorecard List</title>
        <style type="text/css">
            td.emptyAudit{
                color: #888;
            }
            td.best{
                background: #afa;
                font-weight:bold;
            }
            td.worst{
                background: #faa;
                font-weight:bold;
            }
            div.scoretable{
                float:left;
                width:900px;
            }
            div.scoretable th{
                background: #eee;
                border:1px solid #ccc;
            }
        </style>
    </head>
    <body>
        <div class="body scoretable">
            <g:set var="metricsList" value="${ServiceScorecardBase.metricsList}"/>
            <g:set var="metricsTypes" value="${ServiceScorecardBase.metricsTypes}"/>
            <g:set var="options" value="${session.sscorecard_options?session.sscorecard_options:[goalsMetPct:true,processCoveragePct:true,processQualityPct:true,
            serviceAvailabilityPct:true,estimatedOutageCost:true,MTBFTime:true,MTTRTime:true,serviceFailuresCount:true,smActivitiesCount:true,highImpactActivityPct:true,
            smSuccessPct:true,smActivitiesImpactedAvailabilityCount:true,smActivitiesUnplannedCount:true]}"/>
            <h1>Service Management Scores</h1>
            <h2>
                <g:formatDate date="${startCal.getTime()}" format="yyyy/MM/dd"/>
                to
                <g:formatDate date="${endCal.getTime()}" format="yyyy/MM/dd"/>
            </h2>
            <g:if test="${!nextDate}">
                   <h3>
                       Current Scores for Last Week
                   </h3>
            </g:if>
            <div class="datenav">
            <g:link action="table" params="${[datetime:prevDate.getTime()]}">&laquo; previous</g:link>
            <g:if test="${null!=nextDate}">
                <g:link action="table" params="${[datetime:nextDate.getTime()]}">next &raquo;</g:link>
            </g:if>
            </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="chart">
                <table style="width:auto;">
                    <thead>
                        <tr>
                        
                            <th>Service</th>

                            <g:each in="${metricsList}" var="metric">
                                <g:if test="${options[metric]}">
                                    <g:sortableColumn property="${metric}"  titleKey="${'metric.'+metric}" />
                                </g:if>
                            </g:each>


                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${serviceScorecardInstanceList}" status="i" var="serviceScorecardInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" class="cardrow">

                            
                            <td style="width:100px" class="cardlink">
                                <g:link controller="serviceScorecard" action="show" id="${serviceScorecardInstance.id}" title="View Scorecard" >
                                    <img src="${createLinkTo(dir: 'images', file: 'skin/chart_bar.png')}" alt="" width="16px" height="16px"/>
                                    ${fieldValue(bean:serviceScorecardInstance, field:'service')}
                                </g:link>
                            </td>



                                <g:each in="${metricsList}" var="metric">
                                    <g:if test="${options[metric]}">

                                            <g:if test="${ServiceScorecardBase.auditMetrics.contains(metric) && !serviceScorecardInstance.auditsExist}">
                                                <td class="emptyAudit" title="No Audits" style="width:20px">-</td>
                                            </g:if>
                                            <g:else>
                                                <td class="${bestMap && bestMap[metric]==serviceScorecardInstance[metric] ? 'best':''} ${worstMap && worstMap[metric]==serviceScorecardInstance[metric] && !(bestMap && bestMap[metric]==serviceScorecardInstance[metric])? 'worst':''}" style="width:20px">
                                                <g:render template="metricvalue" model="[value:fieldValue(bean:serviceScorecardInstance, field:metric),type:metricsTypes[metric]]"/>
                                                </td>
                                            </g:else>

                                    </g:if>
                                </g:each>




                        
                        </tr>
                    </g:each>
                        <g:each in="${services}" var="service">
                        <tr>
                            <td>
                                <g:link controller="service" action="show" id="${service.id}">
                                    ${fieldValue(bean:service, field:'name')}  [${fieldValue(bean:service, field:'type')}]
                                </g:link>
                            </td>
                            <g:each in="${metricsList}" var="metric">
                                    <g:if test="${options[metric]}">
                                        <td>-</td>
                                    </g:if>
                                </g:each>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">--}%
                %{--<g:paginate total="${ServiceScorecard.count()}" />--}%
            %{--</div>--}%
            <div class="info " style="padding:5px;">
            <span class="link action " onclick="['metricsglossary','metricsglossary-toggle'].each(Element.toggle);" id="metricsglossary-toggle"  style="">
                Metrics Glossary
                <img src="${createLinkTo(dir:'images/menus',file:'icon-tiny-disclosure.png')}" width="12px" height="12px"/>
            </span>
            <div id="metricsglossary" style="display:none; ">
                <span class="link action " onclick="['metricsglossary','metricsglossary-toggle'].each(Element.toggle);" style="">
                    Metrics Glossary
                    <img src="${createLinkTo(dir:'images/menus',file:'icon-tiny-disclosure-open.png')}" width="12px" height="12px"/>
                </span>
                <dl>
                <g:each in="${metricsList}" var="metric">
                        <dt id="def_${metric}">
                            <g:wikiLink name="ServiceScorecardGlossary" sectionkey="metric.${metric}">
                                ${message(code:"metric."+metric)}
                        </g:wikiLink></dt>
                        <dd><g:message code="metric.${metric}.info"/> (${metric})</dd>
                </g:each>
                </dl>
            </div>
            </div>

        </div>
    
    </body>
</html>
