<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Audit: Create Scorecard</title>
</head>
<body>
<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${capabilityScoreCard}">
        <div class="errors">
            <g:renderErrors bean="${capabilityScoreCard}" as="list"/>
        </div>
    </g:hasErrors>
    <g:set var="services" value="${Service.list()}"/>
    <g:if test="${services}">
        <g:form action="listAuditScorecards" method="post">
            <div class="buttons">
                <span class="button"><input class="save" type="submit" value="Create"/></span>
                <span class="button"><g:actionSubmit class="list" value="List"/></span>
            </div>
            <div class="dialog">
                <table>
                    <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="startDate">Start Date:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: capabilityScoreCard, field: 'startDate', 'errors')}">
                                <g:datePicker name="startDate" value="${new Date()-10}"></g:datePicker>
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="endDate">End Date:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: capabilityScoreCard, field: 'endDate', 'errors')}">
                                <g:datePicker name="endDate" value="${new Date()}"></g:datePicker>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="service">Service:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: capabilityScoreCard, field: 'service', 'errors')}">
                                <select name="service.id" id="service.id">
                                    <option value="null"></option>
                                    <g:each in="${services}" var="s">
                                        <option value="${s.id}">${s?.name} [${s?.type?.name}]</option>
                                    </g:each>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </g:form>
    </g:if>
    <g:else>
        <div class="dialog">
            <h3>Cannot create a scorecard</h3>
            <p>No Services exist yet. Go to the Inventory manager and
            <g:link controller="service" action="create">create a Service</g:link>.</p>
        </div>
    </g:else>
</div>
</body>
</html>
