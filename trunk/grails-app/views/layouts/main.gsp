<html>
<head>
    <title><g:layoutTitle default="Ops Scorecard"/></title>
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

<g:render template="/common/header"/>

<g:render template="menu"/>

<div class="pageContent">
    <g:layoutBody/>
    <g:render template="/common/community_sidebar"/>
</div>


  <g:render template="/common/footer"/>

</body>
</html>
