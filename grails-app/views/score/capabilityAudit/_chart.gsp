<%
    def data = []
    scorecards.each {
        data << it.scores.cumulative
    }
%>

<div id="timeplot${id}" style=" height: 125px;"></div>


<script type="text/javascript">
    var timeplot${id};

    function onLoad${id}() {
        var eventSource = new Timeplot.DefaultEventSource();
        var valueGeometry = new Timeplot.DefaultValueGeometry({
            gridColor: "#000000",
            axisLabelsPlacement: "left",
            min: 0,
            max: 100
        });
        var timeGeometry = new Timeplot.DefaultTimeGeometry({
            gridColor: "#000000",
            axisLabelsPlacement: "top"
        });
        var plotInfo = [
            Timeplot.createPlotInfo({
                id: "plot_cum${id}",
                dataSource: new Timeplot.ColumnSource(eventSource, 3),
                valueGeometry:valueGeometry,
                timeGeometry:timeGeometry,
                lineColor: "#C4AA93",
                fillColor: "#C4AA93",
                showValues: true
            })
        ];

        timeplot${id} = Timeplot.create(document.getElementById("timeplot${id}"), plotInfo);
        timeplot${id}.loadText("${createLink(controller:'score',action:'txtAuditData',id:id,params:params.subMap(['startDate','endDate','startDate_month','endDate_month','startDate_day','endDate_day','startDate_year','endDate_year']))}", ",", eventSource);
    }

    var resizeTimerID${id} = null;
    function onResize${id}() {
        if (resizeTimerID${id} == null) {
            resizeTimerID${id} = window.setTimeout(function() {
                resizeTimerID${id} = null;
                timeplot${id}.repaint();
            }, 100);
        }
    }

    Event.observe(window, 'load', function(e) {
        onLoad${id}();
    });
    Event.observe(window, 'resize', function(e) {
        onResize${id}();
    });
</script>