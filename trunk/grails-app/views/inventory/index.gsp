<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Inventory</title>
</head>
<body>
<div class="body">
    <table>
        <tr>
            <td class="toollink" width="120">

                <g:link class="maintool" controller="service">
                    <img align="center" src="${createLinkTo(dir: 'images', file: 'icon-huge-ServiceManager.png')}" height="65px" alt="Services"/>
                    <span class="title">Services</span>

                </g:link>

            </td>
            <td class="toollink" width="120">

                <g:link class="maintool" controller="physicalAsset">
                    <img src="${createLinkTo(dir: 'images', file: 'icon-huge-NodeManager.png')}" height="65px" alt="Physical Assets"/>
                    <span class="title">Assets</span>

                </g:link>

            </td>
        </tr>
        <tr>
            <td class="toollink" width="120">

                <g:link class="maintool" controller="releaseArtifact">
                    <img align="center" src="${createLinkTo(dir: 'images', file: 'icon-huge-PackageManager.png')}" height="65px" alt="Release Artifacts"/>
                    <span class="title">Artifacts</span>

                </g:link>

            </td>
            <td class="toollink" width="120">

                <g:link class="maintool" controller="serviceManagementProcess">
                    <img src="${createLinkTo(dir: 'images', file: 'icon-huge-ProcessManager.png')}" height="65px" alt="Processes"/>
                    <span class="title">Processes</span>

                </g:link>

            </td>
        </tr>
    </table>
</div>
</body>
</html>