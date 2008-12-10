

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="index" />
        <title>People: Register New Individual</title>         
    </head>
    <body>  
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${user}">
            <div class="errors">
                <g:renderErrors bean="${user}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="saveRegistration" method="post" >
                <div class="dialog">
                    <div class="formtitle">
                        User Registration
                    </div>
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="login">Login:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:user,field:'login','errors')}">
                                    <input type="text" id="login" name="login" value="${fieldValue(bean:user,field:'login')}"/>
                                </td>
                            </tr> 

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password">Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:user,field:'password','errors')}">
                                    <input class="password" type="password" id="password" name="password" value="${fieldValue(bean:user,field:'password')}"/>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="confirm">Confirm password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:user,field:'confirm','errors')}">
                                    <input class="password" type="password" id="confirm" name="confirm" value="${fieldValue(bean:user,field:'confirm')}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="firstName">First Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:user,field:'firstName','errors')}">
                                    <input type="text" id="firstName" name="firstName" value="${fieldValue(bean:user,field:'firstName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastName">Last Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:user,field:'lastName','errors')}">
                                    <input type="text" id="lastName" name="lastName" value="${fieldValue(bean:user,field:'lastName')}"/>
                                </td>
                            </tr> 
                                          
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="userGroup">User Group:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:user,field:'userGroup','errors')}">
                                    <g:select optionKey="id" from="${Usergroup.list()}" name="userGroup.id" value="${user?.userGroup?.id}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email">Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:user,field:'email','errors')}">
                                    <input type="text" id="email" name="email" value="${fieldValue(bean:user,field:'email')}"/>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                    <div class="buttons" style="text-align:right">
                        <input type="submit" value="Register" />
                    </div>
                </div>

            </g:form>
        </div>
    
    </body>
</html>
