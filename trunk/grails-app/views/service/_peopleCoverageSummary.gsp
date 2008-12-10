
<%
    def usrCnt = 0
    def teams = []
    processes.each {
        if (it.implementor?.id && !teams.contains(it.implementor.id)) {
            teams << it.implementor.id
        }
        if (it.implementor?.users) usrCnt += it.implementor.users.size()
    }
    def indvPerProcAvg = 0
    if (processes.size()>0) {
       indvPerProcAvg = usrCnt / processes.size()
    }
%>
<h5>Individuals</h5>
<div class="section">
    <p>For this service: ${usrCnt}</p>
    <p>Average per process: ${indvPerProcAvg}</p>
</div>
<h5>Teams</h5>
<div class="section">
<p>Supporting this service: ${teams.size()}</p>
</div>