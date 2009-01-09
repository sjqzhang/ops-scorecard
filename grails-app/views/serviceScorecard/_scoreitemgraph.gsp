 <script type="text/javascript">
        allgraphs.set('${metric}',new Hash({
            type:'${metricsTypes?metricsTypes[metric]:''}',
            goalsmet:${goalsmet?'true':'false'}
        }));
        alldata.set('${metric}',[
        "${serviceScorecardInstance.endDate},${serviceScorecardInstance[metric]},${serviceScorecardInstance.goals?serviceScorecardInstance.goals[metric]:0.0}",
        <g:if test="${previousscores}">
            <g:each in="${previousscores}" var="prevscore">
                "${prevscore.endDate},${prevscore[metric]},${prevscore.goals?prevscore.goals[metric]:0.0}",
            </g:each>
        </g:if>
        ]);
    </script>
<div id="tp_${metric}" style="width:125px;height:50px"></div>