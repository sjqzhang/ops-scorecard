

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
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
            <h1>Service Scores</h1>
            <h2>
                <g:formatDate date="${startCal.getTime()}" format="yyyy/MM/dd"/>
                to
                <g:formatDate date="${endCal.getTime()}" format="yyyy/MM/dd"/>
            </h2>
            <g:link action="table" params="${[datetime:prevDate.getTime()]}">&laquo; previous</g:link>
            <g:if test="${null!=nextDate}">
                <g:link action="table" params="${[datetime:nextDate.getTime()]}">next &raquo;</g:link>
            </g:if>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
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
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td style="width:100px">
                                <g:link controller="serviceScorecard" action="show" id="${serviceScorecardInstance.id}">
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
                                    ${fieldValue(bean:service, field:'name')}
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
            <div class="paginateButtons">
                <g:paginate total="${ServiceScorecard.count()}" />
            </div>
        </div>
    
    </body>
</html>
