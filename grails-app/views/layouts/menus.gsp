<html>
    <head>
        <title><g:layoutTitle default="Grails" />: ${request['controllerName']}</title>
        <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
        <g:render template="/common/menus"/>
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${createLinkTo(dir:'images',file:'spinner.gif')}" alt="Spinner" />
        </div>	
        <div class="logo"><img src="${createLinkTo(dir:'images',file:'grails_logo.jpg')}" alt="Grails" /></div>

        <!-- include Menus in layout -->
        <g:render template="/common/menulinks" model="${[selected:params.name?params.name:'0',subselected:params.subitem]}"/>
        <!-- end include Menus in layout -->
        <g:layoutBody />		
    </body>	
</html>