<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Audit</title>
</head>
<body>
<div class="body">
    <table>
        <tr>

            <td class="toollink" width="120">
                <g:link class="maintool" controller="capabilityAudit">
                    <img src="${createLinkTo(dir: 'images', file: 'score-medium.png')}" height="65px" alt="Score"/>
                    <span class="title">Capability</span>

                </g:link>
            </td>
           <td class="toollink" width="120">
                <g:link class="maintool" controller="capabilityAudit" action="summaryScorecard">
                    <img src="${createLinkTo(dir: 'images', file: 'scorecard-medium.png')}" height="65px" alt="ScoreCard"/>
                    <span class="title">Scorecards</span>
                </g:link>
            </td>            
        </tr>
    </table>

</div>
</body>
</html>
