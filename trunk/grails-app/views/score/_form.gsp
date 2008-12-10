<div id="createform">
    <g:form action="scoreServices" method="post">
        <div>
            <div class="formtitle">
                Scorecard Parameters
            </div>
            <table>
                <tbody>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="startDate">Start Date:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: scoreServicesParams, field: 'startDate', 'errors')}">
                            <g:datePicker name="startDate" value="${new Date()-6}" precision="day"></g:datePicker>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="endDate">End Date:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: scoreServicesParams, field: 'endDate', 'errors')}">
                            <g:datePicker name="endDate" value="${new Date()+1}" precision="day"></g:datePicker>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name ${hasErrors(bean: scoreServicesParams, field: 'services', 'errors')}">
                            <label for="service">Services:</label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: scoreServicesParams, field: 'services', 'errors')}">
                            <g:hasErrors bean="${scoreServicesParams}" field="services">
                                <div class="errors">
                                    <g:renderErrors bean="${scoreServicesParams}" as="list" field="services"/>
                                </div>
                            </g:hasErrors>

                            <ul>
                                <g:each in="${services}" var="s" status="x">
                                    <li style="display:block;list-style:none; margin:5px;">
                                        <g:checkBox name="services" value="${s.id}" id="${'c_service_'+x}"  checked="${scoreServicesParams?scoreServicesParams.services?.contains(s.id.toString()):true}"/> 
                                        <label for="c_service_${x}">${s?.name} [${s.type.name}]</label>
                                    </li>
                                </g:each>
                            </ul>

                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="cards">Scorecards:</label>
                        </td>
                        <td valign="top">
                            <ul>
                                <g:each in="['audit','process','activity','inventory','people']" var="i" status="x">
                                    <li style="display:block;list-style:none;margin:5px;">
                                        <g:checkBox name="cards" value="${i}"  id="${'c_card_'+x}" checked="${scoreServicesParams?scoreServicesParams.cards?.contains(i):true}"/>
                                        <label for="c_card_${x}">${i}</label>
                                    </li>
                                </g:each>
                            </ul>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="buttons">
                <span class="button"><input type="submit" value="Generate"/></span>
                <g:if test="${canceljs}">
                    <span class="button"><input type="submit" value="Cancel" onclick="${canceljs}; return false;"/></span>
                </g:if>
            </div>
        </div>
    </g:form>
</div>