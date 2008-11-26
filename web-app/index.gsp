<html>
<head>
    <title>Welcome to Scorecard</title>
    <meta name="layout" content="index"/>
</head>
<body>

<div class="body">
    <p style="margin-top:10px;margin-bottom:10px;">
   Choose from one of the tools below:
    </p>
    <table>
      
        <tr>
             <td class="toollink" width="120">
                <a class="maintool" href="score/">
                    <img src="${createLinkTo(dir: 'images', file: 'scorecard-medium.png')}" height="65px" alt="Scores"/>
                    <span class="title">Scores</span>
                </a>
            </td>
            <td class="toollink" width="120">
                <g:link class="maintool" controller="capabilityAudit">
                    <img src="${createLinkTo(dir: 'images', file: 'icon-med-audit.png')}" height="65px" alt="Audit"/>
                    <span class="title">Audit</span>
                </g:link>
            </td>
            <td class="toollink" width="120">
                <a class="maintool" href="inventory/">
                  <img src="${createLinkTo(dir: 'images', file: 'icon-med-inventory.png')}" height="65px" alt="Inventory"/>
                    <span class="title">Inventory</span>                    
                </a>
            </td>
            <td class="toollink" width="120">
                <g:link class="maintool" controller="user">
                    <img src="${createLinkTo(dir: 'images', file: 'icon-med-people.png')}" height="65px" alt="People"/>
                    <span class="title">People</span>
                </g:link>
            </td>
            <td class="toollink" width="120">
                <g:link class="maintool" controller="changeReceipt">
                    <img src="${createLinkTo(dir: 'images', file: 'icon-med-receipts.png')}" height="65px" alt="Receipts"/>
                    <span class="title">Receipts</span>

                </g:link>
            </td>
        </tr>
    </table>
</div>
</body>
</html>