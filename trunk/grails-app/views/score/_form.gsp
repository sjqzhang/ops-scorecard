<div id="createform">
    <g:form action="scoreServices" method="post">
        <div class="buttons">
            <span class="button"><input class="save" type="submit" value="Score"/></span>
        </div>
        <div>
            <table>
                <tbody>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="startDate">Start Date:</label>
                        </td>
                        </tr>
                    <tr>
                        <td valign="top" class="value ${hasErrors(bean: scorecard, field: 'startDate', 'errors')}">
                            <g:datePicker name="startDate" value="${new Date()-6}" precision="day"></g:datePicker>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="endDate">End Date:</label>
                        </td>
                        </tr>
                    <tr>
                        <td valign="top" class="value ${hasErrors(bean: scorecard, field: 'endDate', 'errors')}">
                            <g:datePicker name="endDate" value="${new Date()+1}" precision="day"></g:datePicker>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="service">Services:</label>
                        </td>
                        </tr>
                    <tr>
                        <td valign="top" class="value ${hasErrors(bean: scorecard, field: 'service', 'errors')}">
                            <ul>
                                <g:each in="${services}" var="s">
                                    <li style="margin-left:10px;text-align: left;float: left;list-style: none;">
                                        <g:checkBox name="service.id" value="${s.id}"/> ${s?.name}
                                    </li>
                                </g:each>
                            </ul>

                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="cards">Scorecards:</label>
                        </td>
                        </tr>
                    <tr>
                        <td valign="top">
                            <ul>
                                <g:each in="['audit','process','activity','inventory']" var="i">
                                    <li style="margin-left:10px;text-align: left;float: left;list-style: none;">
                                        <g:checkBox name="cards" value="${i}"/> ${i}
                                    </li>
                                </g:each>
                            </ul>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </g:form>
</div>