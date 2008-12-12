<div class=" community">

        <g:if test="${pageProperty(name:'meta.guideitem')}">
            <div class="contexthelp">
                <span class="info ">Guides for this page</span>
                <g:menuitemlink key="project" item="concept-${pageProperty(name:'meta.guideitem')}" />
                <g:menuitemlink key="project" item="use-${pageProperty(name:'meta.guideitem')}" />
            </div>
        </g:if>

        <g:menulink key="project" submenu="community" class="headright external" selected="community" />
        <g:menulink key="project" submenu="guides" class="headright external" selected="guides" />


        <h4>Community</h4>
        <ul>
            <li>
                <form action="http://groups.google.com/group/opsscorecard/search" method="GET" style="margin:0;padding:0;">
                    <input type="hidden" name="group" value="opsscorecard"/>
                    <input type="text" name="q" size="15" maxlength="2048"/>
                    <input type="submit" value="Search Discussion"/>
                </form>
            </li>
            <li>
                <form action="http://code.google.com/p/ops-scorecard/w/list" method="GET" style="margin:0;padding:0;">
                    <input type="hidden" name="can" value="2"/>
                    <input type="text" name="q" size="15" maxlength="2048"/>
                    <input type="submit" value="Search Docs"/>
                </form>
            </li>
          
        </ul>
</div>