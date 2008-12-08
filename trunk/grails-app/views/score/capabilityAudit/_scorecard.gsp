<!-- control -->
<tr>
    <td>

    <g:render template="/common/barchart" model="[label:'Control', position:scorecard?.scores?.control]"/>

</td>
</tr>
<!-- process -->
<tr>
    <td>
        <g:render template="/common/barchart" model="[label:'Process', position:scorecard?.scores?.process]"/>

    </td>
</tr>
<tr>
    <!-- cumulative -->
    <td>
        <g:set var="avg" value="${scorecard?.scores?.cumulative}"/>
        <g:render template="/common/barchart" model="[label:'Average', position:avg]"/>

    </td>
</tr>
       