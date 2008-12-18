<div class="header availabilityreceipt">


            <span class="service">${availabilityReceipt?.service.name}</span>
            <span class="impact">
            <span class="level">${availabilityReceipt?.level}%</span> availability for
            <span class="duration"><g:relativeDate start="${availabilityReceipt?.startDate}" end="${availabilityReceipt?.endDate}" duration="true"/></span>
            </span>

            <span class="date">
                <g:relativeDate atDate="${availabilityReceipt?.startDate}" agoClass="ago audit" untilClass="until audit"/>
                to
                <g:relativeDate atDate="${availabilityReceipt?.endDate}" agoClass="ago audit" untilClass="until audit"/>
            </span>

        </div>

        <table>
            <tbody>

                <tr class="prop">
                    <td valign="top" class="name ${!availabilityReceipt?.process?'empty':''}">Cause:</td>

                    <td valign="top" style="text-align:left;" class="value">
                        <g:if test="${availabilityReceipt.process?.name}">
                            <g:link controller="service" action="show" id="${availabilityReceipt.process.id}">
                                ${availabilityReceipt.process.name}
                            </g:link>
                        </g:if>
                    </td>

                </tr>

                <tr class="prop">
                    <td valign="top" class="name ${!availabilityReceipt?.comment?'empty':''}">Comment:</td>

                    <td valign="top" style="text-align:left;" class="value">
                                ${availabilityReceipt.comment.encodeAsHTML()}
                    </td>

                </tr>
                <tr class="prop">
                    <td valign="top" class="name ${!availabilityReceipt?.reporter?'empty':''}">Reporter:</td>

                    <td valign="top" style="text-align:left;" class="value">
                        <span class="author"><g:link controller="user" action="show" id="${availabilityReceipt?.reporter?.id}">${availabilityReceipt?.reporter?.encodeAsHTML()}</g:link></span>
                    </td>

                </tr>
                <tr class="prop">
                    <td valign="top" class="name">Time Reported:</td>

                    <td valign="top" style="text-align:left;" class="value">
                        <g:relativeDate atDate="${availabilityReceipt?.dateCreated}" />
                    </td>

                </tr>
            </tbody>
        </table>

