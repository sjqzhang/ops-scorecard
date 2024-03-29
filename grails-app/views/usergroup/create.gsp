

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
    <meta name="guideitem" content="team"/>
        <title>People: Add Team</title>
    </head>
    <body>
       
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${usergroup}">
            <div class="errors">
                <g:renderErrors bean="${usergroup}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <div class="formtitle">Create Team</div>
                    <table>
                        <tbody>

                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usergroup,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:usergroup,field:'name')}"/>
                                </td>
                            </tr> 

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:usergroup,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:usergroup,field:'description')}"/>
                                </td>
                            </tr>
                                                
                        </tbody>
                    </table>
                    <div class="buttons">
                        <span class="button"><input  type="submit" value="Save" /></span>
                        <span class="button"><g:actionSubmit  action="list" value="Cancel" /></span>
                    </div>
                </div>

            </g:form>
        </div>
         
    </body>
</html>
