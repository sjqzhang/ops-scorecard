<div class="topbar">
    <div class="logo">
        <a href="/scorecard">
            <img align="middle" src="${createLinkTo(dir: 'images', file: 'logo.png')}" alt="Ops Scorecard"/>Ops Scorecard
        </a>
    </div>
    <span class="links">
    
    <g:menulink key="project" submenu="help" class="headright external" selected="help" />
    
   <span class="headright">
       <g:if test="${session?.user}">
           <span class="logininfo"><span class="user"
                   title="User ${session.user} is currently logged in."
           ><g:link action="show" controller="user" params="[login:session.user]">${session.user}</g:link></span> &raquo;
               <g:link action="logout" controller="user" title="Logout user: ${session.user}" class="loginlink">logout</g:link></span>
       </g:if>
       <g:else>
           <g:link controller="user" action="login" class="loginlink">log in</g:link>
       </g:else>
    </span>
        </span>

    <div class="clear"></div>
</div>

<g:menu key="project" submenu="help" noheader="true"/>
<g:menu key="project" submenu="community" noheader="true"/>
<g:menu key="project" submenu="guides" noheader="true"/>