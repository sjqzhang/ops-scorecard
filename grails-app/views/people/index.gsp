<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>People</title>
</head>
<body>
<div class="body">
    <table>
        <tr>
            <td class="toollink" width="120">
                <g:link class="maintool" controller="user">
                    <img align="center" src="${createLinkTo(dir: 'images', file: 'individual.png')}" height="65px" alt="Individual"/>
                    <span class="title">Individuals</span>

                </g:link>
            </td>
            <td class="toollink" width="120">
                <g:link class="maintool" controller="usergroup">
                    <img src="${createLinkTo(dir: 'images', file: 'team.png')}" height="65px" alt="Teams"/>
                    <span class="title">Teams</span>
                </g:link>
            </td>
        </tr>
    </table>

</div>
</body>
</html>
