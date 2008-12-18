<%--
  Created by IntelliJ IDEA.
  User: greg
  Date: Dec 16, 2008
  Time: 3:24:27 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="availabilityreceipt"/>
    <title>Availability Receipt: View: ${availabilityReceipt?.id}</title>
    <script type="text/javascript">

        function loadEdit(id){
            new Ajax.Updater('listcontent','${createLink(controller:'availabilityReceipt',action:'ajaxEdit',params:params.subMap(['sort','max','order','offset']))}&showpage=true&id='+id,{});
        }
        function loadShow(id){
            new Ajax.Updater('listcontent','${createLink(controller:'availabilityReceipt',action:'ajaxShow')}?id='+id,{});
        }
        function closeButton(){
            loadShow('${availabilityReceipt.id}');
        }
        function loadForm(){
            document.location='${createLink(controller:'availabilityReceipt',action:'list',params:[createshow:true])}';
        }
        function postSavedReceipt(id){
        }
        function checkForm(form){
            if($F('service.id')=='null'){
                $('service.id').parentNode.addClassName('errors');
                return false;
            }
            return true;
        }
    </script>
</head>
<body>


    <div class="body">
        <div class="buttons">
        <g:form>
            <input type="hidden" name="id" value="${availabilityReceipt?.id}"/>
            <span class="edit action link" onclick="loadEdit('${availabilityReceipt?.id}')">Edit</span>
            <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete"/></span>
            <span class="button"><g:actionSubmit class="list" value="List"/></span>
        </g:form>
    </div>
    <div class="view" id="listcontent">
        <g:render template="show" model="${model}"/>
    </div>
    </div>

</body>
</html>
