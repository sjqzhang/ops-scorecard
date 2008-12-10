<%--
  Created by IntelliJ IDEA.
  User: alexh
  Date: Nov 16, 2008
  Time: 12:16:31 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="index"/>
    <title>Login Page</title>
</head>
<body>
<div>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <h3>Welcome to Scorecard.</h3>
    <div class="info">Login below or
    <g:link action="register">register here</g:link>.
    </div>
    <form action="handleLogin">
        <div class="dialog login">
            <div class="formtitle">
                Login
            </div>

            <table>
                <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="login">Login:</label>
                        </td>
                        <td class="value">
                            <input type="text" name="login"/>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="password">Password:</label>
                        </td>
                        <td class="value">
                            <input class="password" type="password" name="password"/>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="buttons" style="text-align:right">
                <input type="submit" value="Login"/>
            </div>
        </div>
    </form>
</div>
</body>
</html>