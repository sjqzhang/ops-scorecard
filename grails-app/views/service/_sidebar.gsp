<span class="menuButton"><g:link class="create" action="create">Add Service</g:link></span>


<table class="list" style="margin-top: 10px;">
    <tr>
        <td  class="title">
            Service types
            <div style="display:none;" id="newTypeForm">
                <g:formRemote name="addType" method="post" update="servicetypes"
                        url="${[controller:'resourceType', action:'addType']}">
                    <g:hiddenField name="metatype" value="service"/>
                    <g:hiddenField name="description" value="none"/>
                    Name: <input name="name" type="text"/>
                    <span class="button"><input class="save" type="submit" value="Add"
                            onclick="$(newTypeForm).hide()"/></span>
                </g:formRemote>
                <span class="controllink"
                        onclick="$(newTypeForm).hide();$(addlink).show();">done</span>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <table style="border:0;" id="servicetypes">
                    <g:render template='/resourceType/resourceType'
                            var='resourceType'
                            collection="${ResourceType.findAllByMetatype('service')}"/>
            </table>
        </td>
    </tr>
</table>
