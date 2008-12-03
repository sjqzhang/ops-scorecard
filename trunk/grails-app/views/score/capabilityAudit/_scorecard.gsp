
<!-- control -->
<td width="10">
    <g:prettyScore format="numeric" score="${scorecard?.scores?.control}"/>%

</td>
<!-- process -->
<td width="10">
    <g:prettyScore format="numeric" score="${scorecard?.scores?.process}"/>%

</td>
<!-- repeatability -->
<td width="10">
    <g:prettyScore format="numeric" score="${scorecard?.scores?.repeatability}"/>%
</td>
<!-- cumulative -->
<td width="10">
    <g:set var="score" value="${scorecard?.scores?.cumulative}"/>
    <g:prettyScore format="numeric" score="${score}"/>%
</td>
       