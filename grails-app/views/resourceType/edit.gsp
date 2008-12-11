<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="resourcetype"/>
    <title>Edit ResourceType</title>
</head>
<body>
<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${resourceType}">
        <div class="errors">
            <g:renderErrors bean="${resourceType}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form method="post">
        <input type="hidden" name="id" value="${resourceType?.id}"/>
        <div class="buttons">
            <span class="button"><g:actionSubmit class="save" value="Update"/></span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
            <span class="button"><g:actionSubmit class="list" value="List" /></span>            
        </div>
        <div class="dialog">
            <table>
                <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="name">Name:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: resourceType, field: 'name', 'errors')}">
                            <input type="text" id="name" name="name" value="${fieldValue(bean: resourceType, field: 'name')}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="description">Description:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: resourceType, field: 'description', 'errors')}">
                            <input type="text" id="description" name="description" value="${fieldValue(bean: resourceType, field: 'description')}"/>
                        </td>
                    </tr>
                    <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="metatype">Meta Type:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:resourceType,field:'metatype','errors')}">
                                    <g:select id="metatype" name="metatype" from="${ResourceType.constraints.metatype.inList}" value="${resourceType.metatype}" ></g:select>
                                </td>
                    </tr>                  

                </tbody>
            </table>
        </div>

    </g:form>
</div>
<div class="sidebar">
    <g:render template="sidebar"/>
</div>
</body>
</html>
