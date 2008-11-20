

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Inventory: Create ResourceType</title>
    </head>
    <body>

        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${resourceType}">
            <div class="errors">
                <g:renderErrors bean="${resourceType}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                 <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:resourceType,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:resourceType,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:resourceType,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:resourceType,field:'description')}"/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>

            </g:form>
        </div>     
    </body>
</html>
