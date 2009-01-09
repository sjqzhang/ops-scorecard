

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Service Goals</title>
    </head>
    <body>
<g:set var="metricsTypes" value="${ServiceScorecardBase.metricsTypes}"/>
        <div class="body">
            <h1>Edit Service Goals</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${service.goals}">
            <div class="errors">
                <g:renderErrors bean="${service.goals}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" action="update" >
                <input type="hidden" name="id" value="${service?.id}" />
                <g:if test="${service.goals}">
                    <input type="hidden" name="goals.id" value="${service?.goals?.id}" />
                </g:if>
                <g:else>
                    <input type="hidden" name="newGoals" value="true" />
                </g:else>
                <div class="dialog">
                    <div class="header service">
                        <g:render template="service_header" model="[service:service]"/>
                    </div>
                            
                    <table style="" >
                        <tbody>
                            <tr>
                                <th>Metric</th>
                                <th colspan="2">Goal</th>
                            </tr>

                            <g:render template="goalfield" model="[metric:'MTBFTime',metricsTypes:metricsTypes]"/>
                            <g:render template="goalfield" model="[metric:'MTTRTime',metricsTypes:metricsTypes]"/>
                            <g:render template="goalfield" model="[metric:'adHocActivityCount',metricsTypes:metricsTypes]"/>
                            <g:render template="goalfield" model="[metric:'estimatedOutageCost',metricsTypes:metricsTypes]"/>
                            <g:render template="goalfield" model="[metric:'highImpactActivityPct',metricsTypes:metricsTypes]"/>
                            <g:render template="goalfield" model="[metric:'processCoveragePct',metricsTypes:metricsTypes]"/>
                            <g:render template="goalfield" model="[metric:'processDeviationsCount',metricsTypes:metricsTypes]"/>
                            <g:render template="goalfield" model="[metric:'processQualityPct',metricsTypes:metricsTypes]"/>
                            <g:render template="goalfield" model="[metric:'risk',metricsTypes:metricsTypes]"/>
                            <g:render template="goalfield" model="[metric:'serviceAvailabilityPct',metricsTypes:metricsTypes]"/>
                            <g:render template="goalfield" model="[metric:'serviceFailuresCount',metricsTypes:metricsTypes]"/>
                            <g:render template="goalfield" model="[metric:'smActivitiesCount',metricsTypes:metricsTypes]"/>
                            <g:render template="goalfield" model="[metric:'smActivitiesImpactedAvailabilityCount',metricsTypes:metricsTypes]"/>
                            <g:render template="goalfield" model="[metric:'smActivitiesUnapprovedCount',metricsTypes:metricsTypes]"/>
                            <g:render template="goalfield" model="[metric:'smActivitiesUnplannedCount',metricsTypes:metricsTypes]"/>
                            <g:render template="goalfield" model="[metric:'smControlsPct',metricsTypes:metricsTypes]"/>
                            <g:render template="goalfield" model="[metric:'smSuccessPct',metricsTypes:metricsTypes]"/>

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit  value="Update" /></span>
                    <span class="button"><g:actionSubmit   value="Cancel" action="show" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
