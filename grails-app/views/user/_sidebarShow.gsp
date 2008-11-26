<span class="menuButton"><g:link class="create" action="create">Add Individual</g:link></span>
<g:if test="${session.user && session.user.login.matches(user.login)}">
    <table style="margin-top: 10px;">
        <tr>
            <td style="background-color: azure;">
                <span style="color:#808080;font-weight: bold;font-size:10pt;padding-right:5px;">Subscriptions</span>
                <span id="edit" class="controllink" onclick="$(addSubscription).show();$(edit).hide();">Edit</span>
                  <div id="addSubscription" style="display:none;">
                    <g:formRemote name="save" method="post"
                            action="save" url="${[controller:'subscription', action:'save']}"
                            update="subscriptions">
                        <g:hiddenField name="user" value="${session.user}"/>
                        Add Service: <g:select name="service.id" from="${Service.list()}" optionKey="id"/>
                        <span class="button"><input class="save" type="submit" value="Add"/></span>
                        <span class="controllink" onclick="$(addSubscription).hide();$(edit).show();">done</span>
                    </g:formRemote>
                </div>
            </td>
        </tr>

        <tr>
            <td>
                <ul style="margin:0;list-style:none;" id="subscriptions">
                    <g:render template="/subscription/subscription" var="subscription"
                            collection="${Subscription.findAllByUser(session.user)}"/>
                </ul>
            </td>
        </tr>

    </table>
</g:if>
