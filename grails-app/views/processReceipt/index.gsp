<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="receipt"/>
    <title>Receipts</title>
</head>
<body>
<div class="body view">
    <table>
        <tr>
            <td class="toollink" width="120">

                <g:link class="maintool" controller="processReceipt" action="list">
                    <img align="center" src="${createLinkTo(dir: 'images', file: 'icon-med-receipts.png')}" height="65px" alt="Services"/>
                    <span class="title">Process Receipts</span>

                </g:link>

            </td>
            <td class="toollink" width="120">

                <g:link class="maintool" controller="availabilityReceipt">
                    <img src="${createLinkTo(dir: 'images', file: 'icon-med-receipts.png')}" height="65px" alt="Processes"/>
                    <span class="title">Availability Receipts</span>

                </g:link>

            </td>
        </tr>

    </table>
</div>
</body>
</html>