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
        <%--
        <tr>
            <td width="120">
                <img align="center" src="${createLinkTo(dir: 'images', file: 'text-large-audit.png')}" height="40px" alt="Audit"/>
            </td>
            <td width="120">
                <img align="center" src="${createLinkTo(dir: 'images', file: 'text-large-inventory.png')}" height="40px" alt="Inventory"/>
            </td>
            <td width="120">
                <img align="center" src="${createLinkTo(dir: 'images', file: 'text-large-people.png')}" height="40px" alt="People"/>
            </td>
            <td width="120">
                <img align="center" src="${createLinkTo(dir: 'images', file: 'text-large-receipts.png')}" height="40px" alt="Receipts"/>
            </td>
        </tr>
        --%>
        <tr>
            <td class="toollink" width="120">
                <a class="maintool" href="audit/">
                    <img src="${createLinkTo(dir: 'images', file: 'icon-med-audit.png')}" height="65px" alt="Audit"/>
                    <span class="title">Audit</span>
                </a>
            </td>
            <td class="toollink" width="120">
                <a class="maintool" href="inventory/">
                  <img src="${createLinkTo(dir: 'images', file: 'icon-med-inventory.png')}" height="65px" alt="Inventory"/>
                    <span class="title">Inventory</span>                    
                </a>
            </td>
            <td class="toollink" width="120">
                <a class="maintool" href="people/">
                    <img src="${createLinkTo(dir: 'images', file: 'icon-med-people.png')}" height="65px" alt="People"/>
                    <span class="title">People</span>
                </a>
            </td>
            <td class="toollink" width="120">
                <a class="maintool" href="receipts/">
                    <img src="${createLinkTo(dir: 'images', file: 'icon-med-receipts.png')}" height="65px" alt="Receipts"/>
                    <span class="title">Receipts</span>

                </a>
            </td>
        </tr>
    </table>
</div>
</body>
</html>