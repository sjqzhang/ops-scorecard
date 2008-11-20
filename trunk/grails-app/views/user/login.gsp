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
    <title>Login Page</title>
    <style type="text/css" type="text/css" media="screen">
    form { width: 300px; }
    input {
    position: absolute;
    left: 130px;
    }
    p { margin-left: 30px; }
    .button { margin-top: 30px; }
    </style>
</head>
<body>
<div class="message">
    ${flash.message}
</div>
<p>Welcome to Scorecard. Login below or
 <g:link action="register">register here</g:link>.
</p>
<form action="handleLogin">
    <p>
        <label for="login">Login:</label>
        <input type="text" name="login"/>
    </p>
    <p>
        <label for="password">Password</label>
        <input type="password" name="password"/>
    </p>
    <input type="submit" value="Login"/>
</form>
</body>
</html>