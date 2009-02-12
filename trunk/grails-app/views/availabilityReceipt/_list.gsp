<%--
  Created by IntelliJ IDEA.
  User: greg
  Date: Dec 16, 2008
  Time: 12:39:34 PM
  To change this template use File | Settings | File Templates.
--%>
<div id="listcontent">
<g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${availabilityReceipt}">
            <div class="errors">
                <g:renderErrors bean="${availabilityReceipt}" as="list"/>
            </div>
        </g:hasErrors>
 <g:if test="${availabilityReceiptList}">

            <table>
                <thead>
                    <tr>

                        <th >&nbsp;</th>

                        <g:sortableColumn property="startDate" title="Start" action="list"/>
                        <g:sortableColumn property="endDate" title="Duration"  action="list"/>
                        <g:sortableColumn property="level" title="Availability" action="list"/>
                        <g:sortableColumn property="service" title="Service" action="list"/>
                        <g:sortableColumn property="process" title="Cause" action="list"/>
                        <g:sortableColumn property="reporter" title="Reporter" action="list"/>

                        <th>Comment</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${availabilityReceiptList}" status="i" var="availabilityReceipt">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'} ${selected&& selected==availabilityReceipt.id?'hilite':''}"
                                onmouseover="$('controls.${availabilityReceipt.id}').show();"
                                onmouseout="$('controls.${availabilityReceipt.id}').hide();">
                            <td width="16px">
                                <div id="controls.${availabilityReceipt.id}" style="display:none">
                                    <span class="link action" onclick="loadEdit('${availabilityReceipt.id}');">
                                        <img src="${createLinkTo(dir: 'images/skin', file: 'pencil.png')}" alt="edit" width="16px" height="16px"/>
                                    </span>
                                </div>
                            </td>
                            <td>
                                <g:link action="show" id="${fieldValue(bean:availabilityReceipt, field:'id')}">
                                    <g:relativeDate atDate="${availabilityReceipt.startDate}"/>
                                </g:link>
                            </td>
                            <td><g:relativeDate start="${availabilityReceipt.startDate}" end="${availabilityReceipt.endDate}" duration="true"/> </td>
                            <td>${fieldValue(bean: availabilityReceipt, field: 'level')}%</td>


                            <td>
                                <g:if test="${availabilityReceipt.service?.name}">
                                    <g:link controller="service" action="show" id="${availabilityReceipt.service.id}">
                                        ${availabilityReceipt.service.name}
                                    </g:link>
                                </g:if>
                            </td>
                            <td>
                                <g:if test="${availabilityReceipt.process?.name}">
                                    <g:link controller="serviceManagementProcess" action="show" id="${availabilityReceipt.process.id}">
                                        ${availabilityReceipt.process}
                                    </g:link>
                                </g:if>
                            </td>
                            <td>
                                <g:link controller="user" action="show" id="${availabilityReceipt.reporter.id}">
                                    ${fieldValue(bean: availabilityReceipt, field: 'reporter')}
                                </g:link>
                            </td>

                            <td>
                                ${fieldValue(bean: availabilityReceipt, field: 'comment')}
                            </td>

                        </tr>
                    </g:each>
                </tbody>
            </table>
                </g:if>
            <g:else>
                <div class="section info note">
                    None
                </div>
            </g:else>
</div>