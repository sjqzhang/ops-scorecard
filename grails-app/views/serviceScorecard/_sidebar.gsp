<g:set var="options" value="${session.sscorecard_options?session.sscorecard_options:[goalsMetPct:true,MTBFTime:true,MTTRTime:true]}"/>
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