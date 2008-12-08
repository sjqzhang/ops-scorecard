
<%
    def usrCnt = 0
    def teams = []
    processes.each {
        if (it.implementor?.id && !teams.contains(it.implementor.id)) {
            teams << it.implementor.id
        }
        if (it.implementor?.users) usrCnt += it.implementor.users.size()
    }
%>
<h5>Individuals</h5>
<p>Number of individuals supporting this service: ${usrCnt}</p>
<p>Average number of individuals supporting each process: ${usrCnt / processes.size()}</p>
<h5>Teams</h5>
<p>Number of teams supporting this service: ${teams.size()}</p>