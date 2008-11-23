<table>
    <tbody>
        <tr>
            <th>Control</th>
            <th>Process</th>
            <th>Repeatability</th>
            <th>Cumulative</th>
        </tr>
        <tr>
            <td><g:prettyScore format="numeric" score="${scores['control']}"/></td>
            <td><g:prettyScore format="numeric" score="${scores['process']}"/></td>
            <td><g:prettyScore format="numeric" score="${scores['repeatability']}"/></td>
            <td><g:prettyScore format="numeric" score="${scores['cumulative']}"/></td>            
        </tr>
    </tbody>
</table>