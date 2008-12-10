<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Inventory: ReleaseArtifact List</title>
</head>
<body>

<div class="body">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:if test="${releaseArtifactList}">
        <div class="dialog">
            <table>
                <thead>
                    <tr>

                        <th>&nbsp;</th>


                        <g:sortableColumn property="name" title="Name"/>
                        <g:sortableColumn property="description" title="Description"/>
                        <g:sortableColumn property="type" title="Resource Type"/>
                        <g:sortableColumn property="status" title="Status"/>
                        <g:sortableColumn property="repositoryURL" title="URL"/>

                    </tr>
                </thead>
                <tbody>
                    <g:each in="${releaseArtifactList}" status="i" var="releaseArtifact">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}"
                                onmouseover="$('controls.${releaseArtifact.id}').show();"
                                onmouseout="$('controls.${releaseArtifact.id}').hide();">
                            <td width="16px">
                                <div id="controls.${releaseArtifact.id}" style="display:none">
                                    <g:link action="edit" params="[id:releaseArtifact.id]">
                                        <img src="${createLinkTo(dir: 'images/skin', file: 'pencil.png')}" alt="edit"/>
                                    </g:link>
                                </div>
                            </td>


                            <td>
                                <g:link action="show" id="${fieldValue(bean: releaseArtifact, field: 'id')}"
                                >${fieldValue(bean: releaseArtifact, field: 'name')}</g:link>
                            </td>

                            <td>${fieldValue(bean: releaseArtifact, field: 'description')}</td>

                            <td>
                                <g:link action="show" controller="resourceType" params="[id:releaseArtifact.type.id]">
                                    ${fieldValue(bean: releaseArtifact, field: 'type')}
                                </g:link>
                            </td>

                            <td>${fieldValue(bean: releaseArtifact, field: 'status')}</td>
                            <td>
                                <g:if test="${releaseArtifact?.repositoryURL}">
                                    <a href="${fieldValue(bean: releaseArtifact, field: 'repositoryURL')}">
                                    &rarr;
                                    </a>
                                </g:if>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
        <div class="paginateButtons">
            <g:paginate total="${ReleaseArtifact.count()}"/>
        </div>
    </g:if>
    <g:else>
        <h3>There are no artifacts defined yet.</h3>
        <div class="info">Press the &quot;Add Artifact&quot; button to the right to create a new one.</div>
    </g:else>
</div>
<div class="sidebar">
    <g:render template="sidebar"/>
</div>
</body>
</html>
