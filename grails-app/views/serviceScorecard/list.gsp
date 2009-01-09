

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>ServiceScorecard List</title>
    </head>
    <body>
        <div class="body">
            <h1>ServiceScorecard List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Goals</th>
                   	    
                   	        <th>Service</th>
                   	    
                   	        <g:sortableColumn property="MTBFTime" title="MTBFT ime" />
                        
                   	        <g:sortableColumn property="MTTRTime" title="MTTRT ime" />
                        
                   	        <g:sortableColumn property="adHocActivityCount" title="Ad Hoc Activity Count" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${serviceScorecardInstanceList}" status="i" var="serviceScorecardInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${serviceScorecardInstance.id}">${fieldValue(bean:serviceScorecardInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:serviceScorecardInstance, field:'goals')}</td>
                        
                            <td>${fieldValue(bean:serviceScorecardInstance, field:'service')}</td>
                        
                            <td>${fieldValue(bean:serviceScorecardInstance, field:'MTBFTime')}</td>
                        
                            <td>${fieldValue(bean:serviceScorecardInstance, field:'MTTRTime')}</td>
                        
                            <td>${fieldValue(bean:serviceScorecardInstance, field:'adHocActivityCount')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ServiceScorecard.count()}" />
            </div>
        </div>
    </body>
</html>
