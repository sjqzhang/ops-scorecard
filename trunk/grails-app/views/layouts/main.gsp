<html>
<head>
    <title><g:layoutTitle default="Scorecard"/></title>
    <link rel="stylesheet" href="${createLinkTo(dir: 'css', file: 'main.css')}"/>
    <link rel="shortcut icon" href="${createLinkTo(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
    <g:layoutHead/>
    <g:javascript library="application"/>
    <g:javascript library="prototype"/>
    <g:render template="/common/menus"/>
</head>
<body>
<div id="spinner" class="spinner" style="display:none;">
    <img src="${createLinkTo(dir: 'images', file: 'spinner.gif')}" alt="Spinner"/>
</div>

<div class="topbar">
    <div class="logo">
        <a href="/scorecard">

            <img src="${createLinkTo(dir: 'images', file: 'logo.png')}" height="65px" alt="Scorecard"/>
        </a>
    </div>
   <span class="headright">
       <g:if test="${session?.user}">
           <span class="logininfo"><span class="user" title="User ${session.user} is currently logged in.">${session.user}</span> &raquo;
               <g:link action="logout" controller="user" title="Logout user: ${session.user}">logout</g:link></span>
       </g:if>
       <g:else>
           Not logged in.
       </g:else>
    </span>    
</div>

<g:render template="menu"/>

<div class="pageContent">
    <g:layoutBody/>
</div>

  <g:render template="/common/footer"/>

</body>
</html>