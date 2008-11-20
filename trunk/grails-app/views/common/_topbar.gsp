<div  class="topbar" >
    <g:link controller="menu" title="Return to menu">
        <img src="${createLinkTo(dir:'images',file:'logo.png')}" alt="Scorecard" />
    </g:link>


    <g:if test="${session?.user}">
     
        <span class="headright">

           <span class="logininfo"><span class="user" title="User ${session.user} is currently logged in.">${session.user}</span> &raquo;
                <g:link action="logout" controller="user" title="Logout user: ${session.user}">logout</g:link></span>
        </span>
    </g:if>
    <g:else>
        <span class="headright">            
           <span class="logininfo">Not logged in</span>
        </span>
    </g:else>
</div>
