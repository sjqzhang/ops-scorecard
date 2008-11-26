<div class="barchart">
    <% if (!position) def position = 0 %>

    <table>
        <tr>
            <th class="label" title="${title? title: ''}">
                <g:if test="${url}">
                    <g:link url="${url}">${label}:</g:link>
                </g:if>
                <g:else>
                    ${label}:
                </g:else>

            </th>

            <th class="pct">${position.intValue()}%</th>
            <% def i = 0 %>
            <g:while test="${i <100}">
                <g:if test="${i < position}">
                    <td class='fill' nowrap='nowrap'>&nbsp;</td>
                </g:if>
                <g:else>                    
                    <td class='area' nowrap='nowrap'>&nbsp;</td>
                </g:else>
                <% i += 5 %>
            </g:while>
        </tr>
    </table>
</div>