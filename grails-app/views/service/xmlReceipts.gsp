<%@ page contentType="text/xml;charset=UTF-8" %>
<g:set var="outagecolors" value="${[0:'red',10:'red',20:'red',30:'red',40:'red',50:'orange',60:'orange',70:'yellow',80:'yellow',90:'blue',100:'green']}"/>
<data>
    <g:set var="processes" value="${ServiceManagementProcess.findAllByService(service)}"/>
    <g:if test="${processes}">
    <g:each in="${processes}" var="process">
        <g:set var="receipts" value="${ProcessReceipt.findAllByProcess(process)}"/>
        <g:if test="${receipts}">
            <g:each in="${receipts}" var="receipt">
                <event start="${formatDate(format:'MMM dd yyyy HH:mm:ss z',date:receipt.actualStart)}"
                            end="${formatDate(format:'MMM dd yyyy HH:mm:ss z',date:receipt.actualEnd)}"
                            durationEvent="false"
                            isDuration="false"
                            title="${process.name}: ${receipt.title?receipt.title:'Untitled'}"
                            color="${receipt.outcome=='successful'?'green':receipt.outcome=='withdrawn'?'gray':'red'}"
                            image="${createLinkTo(dir:'images/skin',file:'script_edit.png')}"
                            link="${createLink(action:'show',controller:'processReceipt',id:receipt.id)}"
                            caption="${process.name} was ${receipt.outcome}"
                            textColor="black"
                            classname="process_receipt"
                            >
                            ${process.name} was ${receipt.outcome}
                            </event>
                            
            </g:each>
        </g:if>
    </g:each>
    </g:if>
    <g:set var="avails" value="${AvailabilityReceipt.findAllByService(service)}"/>
        <g:if test="${avails}">
            <g:each in="${avails}" var="receipt">
                <event start="${formatDate(format:'MMM dd yyyy HH:mm:ss z',date:receipt.startDate)}"
                            end="${formatDate(format:'MMM dd yyyy HH:mm:ss z',date:receipt.endDate)}"
                            durationEvent="${receipt.startDate.compareTo(receipt.endDate)<0}"
                            isDuration="${receipt.startDate.compareTo(receipt.endDate)<0}"
                            title="${receipt.level}%${receipt.process?' ('+receipt.process.name+')':''}"
                            color="${outagecolors[receipt.level]}"
                            image="${createLinkTo(dir:'images/skin',file:'script_edit.png')}"
                            link="${createLink(action:'show',controller:'availabilityReceipt',id:receipt.id)}"
                            caption="${service.name} at ${receipt.level}% availability${receipt.process?', Caused by:'+ receipt.process.name:'' }, "
                            textColor="black"
                            classname="avail_receipt"
                            >
                            ${service.name} at ${receipt.level}% availability.
                            &lt;br&gt;
                            <g:if test="${receipt.process}">
                                Caused by: ${receipt.process.name}
                                &lt;br&gt;
                            </g:if>
                            &amp;ldquo;${receipt.comment}&amp;rdquo;
                            </event>

            </g:each>
        </g:if>
</data>