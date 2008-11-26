<html>
<head>
    <title><g:layoutTitle default="${message(code:'scorecard.app.name')}"/></title>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'main.css')}"/>
    <link rel="shortcut icon" href="${createLinkTo(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
    <g:layoutHead/>
    <g:javascript library="application"/>
    <g:javascript library="prototype"/>
</head>
<body>
<div id="spinner" class="spinner" style="display:none;">
    <img src="${createLinkTo(dir: 'images', file: 'spinner.gif')}" alt="Spinner"/>
</div>

<div class="topbar">
    <div class="logo">
        <a href="/scorecard">
            <img align="middle" src="${createLinkTo(dir: 'images', file: 'logo.png')}" alt="Scorecard"/><g:message code="scorecard.app.name"/>
        </a>
    </div>
   <span class="headright">
       <g:if test="${session?.user}">
           <span class="logininfo"><span class="user"
                   title="User ${session.user} is currently logged in."
           ><g:link action="show" controller="user" params="[login:session.user]">${session.user}</g:link></span> &raquo;
               <g:link action="logout" controller="user" title="Logout user: ${session.user}">logout</g:link></span>
       </g:if>
       <g:else>
           Not logged in.
       </g:else>
    </span>    
</div>

<div class="pageContent">
    <g:layoutBody/>
</div>

</body>
</html>