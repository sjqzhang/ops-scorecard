<%
    def data = []
    scorecards.each {
        data << it.scores.cumulative
    }
%>

<script type="text/javascript">
dojo.require("dojox.charting.Chart2D");
dojo.require("dojox.charting.themes.PlotKit.orange");

var makeObjects = function(){
var chart = new dojox.charting.Chart2D("auditChart${id}");
chart.addPlot("default", {type: "Lines", areas: true});
chart.setTheme(dojox.charting.themes.PlotKit.orange);
chart.addAxis("y", {vertical: true});
chart.addSeries("Chart", ${data.toString()});
chart.render();
};
dojo.addOnLoad(makeObjects);
</script>
<div id="auditChart${id}" style="width: 500px; height: 75px;"></div>

