<%--
  Created by IntelliJ IDEA.
  User: greg
  Date: Dec 16, 2008
  Time: 12:37:47 PM
  To change this template use File | Settings | File Templates.
--%>
<g:form action="save" id="saveform" onSubmit="return checkForm(this);">


<div id="formdiv">
    <g:if test="${availabilityReceipt?.id}">
        <g:hiddenField name="id" value="${availabilityReceipt?.id}"/>
        <div class="formtitle">
            Edit Receipt
        </div>
    </g:if>
    <table >
    <thead>
        <tr>
            <th>Service</th>
            <th>Cause</th>
            <th>Availability</th>
        </tr>
    </thead>
    <tr>

        <td class="${hasErrors(bean:availabilityReceipt,field:'service','errors')}">
            <g:select name="service.id"  optionValue="name" optionKey="id" noSelection="['null':'-Select a Service-']"
                from="${Service.list()}" onChange="selectedService(this);" value="${availabilityReceipt?.service?.id}"
            />
        </td>
        <td id="causeSelect"  class="${hasErrors(bean:availabilityReceipt,field:'process','errors')}">
            <g:if test="${availabilityReceipt?.service}">
                <g:render template="/service/processSelect" model="[service:availabilityReceipt.service,selected:availabilityReceipt?.process?.id,selectName:'process.id',noselection:'-Unknown-']"/>
            </g:if>
            <g:else>
            <span class="note info">-unknown-</span>
            </g:else>
        </td>

        <td  class="${hasErrors(bean:availabilityReceipt,field:'level','errors')}">
            <g:set value="${0..10}" var="ranges"/>
            <g:set value="[]" var="rangesPct"/>
            <g:each in="${ranges}" var="k">
                <%
                    rangesPct<<[value:k*10,label:(k*10)+"%"]
                %>
            </g:each>
            <g:select name="level" from="${rangesPct}" optionKey="value" optionValue="label" value="${availabilityReceipt?availabilityReceipt?.level:'100'}"/>
            %{--<g:textField name="level" value="${availabilityReceipt?availabilityReceipt?.level:'100'}" size="3"/>%--}%
        </td>
    </tr>
    <tr>
        <th>Start</th>
        <th>End</th>
        <th>Reporter</th>
    </tr>
    <tr>

        <td  class="${hasErrors(bean:availabilityReceipt,field:'startDate','errors')}">
            <g:datePicker name="startDate" value="${availabilityReceipt?availabilityReceipt?.startDate:new Date()}"/>
        </td>
        <td  class="${hasErrors(bean:availabilityReceipt,field:'endDate','errors')}">
            <g:datePicker name="endDate" value="${availabilityReceipt?availabilityReceipt?.endDate:new Date()}"/>
        </td>
        <td><g:hiddenField name="reporter.id" value="${availabilityReceipt?availabilityReceipt?.reporter?.id:session.user.id}"/> ${availabilityReceipt?availabilityReceipt?.reporter?.login:session.user.login}</td>


    </tr>
        <tr>
            <th colspan="3">Comment</th>
        </tr>
    <tr>
        <td colspan="3">
            <g:hiddenField name="sort" value="${params.sort}"/>
            <g:hiddenField name="order" value="${params.order}"/>
            <g:hiddenField name="offset" value="${params.offset}"/>
            <g:hiddenField name="max" value="${params.max}"/>
            <g:hiddenField name="showpage" value="${params.showpage}"/>
            <g:textArea name="comment" value="${availabilityReceipt?.comment}" cols="60" rows="5"/>
            
            <g:submitToRemote  update="listcontent" value="Save" action="save_remote" onSuccess="postSavedReceipt(${availabilityReceipt?.id});" before="if(!checkForm()){return false;}"/>

            <span class="action link close" onclick="closeButton();">Cancel</span>
        </td>
    </tr>
        </table>
</div>
</g:form>