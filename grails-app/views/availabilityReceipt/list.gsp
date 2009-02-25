<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <meta name="guideitem" content="availabilityreceipt"/>
    <title>Availability Receipts: List</title>
    <script type="text/javascript">
        function selectedService(sel){
            new Ajax.Updater(
                    'causeSelect',
                    '${createLink(controller:'service',action:'ajaxProcessSelect',params:[selectName:'process.id',noselection:'-unknown-'])}&id='+(sel.value && sel.value!='null' ?sel.value:''),
                    { });
        }
        function postLoad(e){
            $('formbody').show();
            $('addlink').hide();
        }
        function loadForm(){
            new Ajax.Updater('formbody','${createLink(controller:'availabilityReceipt',action:'ajaxForm',params:params.subMap(['sort','max','order','offset']))}',{onSuccess:postLoad});
        }
        function loadEdit(id){
            new Ajax.Updater('formbody','${createLink(controller:'availabilityReceipt',action:'ajaxEdit',params:params.subMap(['sort','max','order','offset']))}&id='+id,{onSuccess:postLoad});
        }
        function closeButton(){
            $('addlink').show();
            $('formdiv').hide();
        }
        function postSavedReceipt(id){
            if(null!=id){
                $('formbody').hide();
                $('addlink').show();
            }else{
                loadForm();
            }
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



    <g:if test="${Service.count()>0}">
        <div class="body">
        <div class="section" style="padding:5px; ${params.createshow?'display:none;':''}" id="addlink">
            <span class="create action link" onclick="loadForm();">Create Availability Receipt</span>
        </div>
        <div class="section" style="padding:5px;display:none;" id="closelink" >
            <span class="action link close" onclick="$('formbody').hide()">Close</span>
        </div>

        <g:if test="${service}">
                <h3>
                    Outages for Service
                </h3>
            <div class="view service">
                <div class="header service">

                    <g:render template="/service/service_header" model="[service:service]"/>
                </div>
            </div>
        </g:if>
        <div class="dialog" id="formbody" ${!params.createshow?'style="display:none;"':''}>
            <g:render template="form" model="${model}"/>
            <g:if test="${params.createshow&&params?.service?.id}">
                <script type="text/javascript">
                    Event.observe(window,'load', function(e){ selectedService({value:'${params.service.id}'});});
                </script>
            </g:if>
        </div>

        <div class="view">
               <g:render template="list" model="${model}"/>
        </div>
        <div class="paginateButtons">
            <g:paginate total="${AvailabilityReceipt.count()}" params="${params.id?[id:params.id]:[:]}"/>
        </div>
        </div>

    </g:if>
    <g:else>
        <div class="body">
                <h3>There are no Services defined yet.</h3>
                <div class="info">Services are required to define an Availability Receipt.</div>
                <div class="info">Press the &quot;Create Service&quot; button to create a new one.</div>
                <span class="menuButton"><g:link class="create" controller="service" action="create">Create Service</g:link></span>
        </div>
    </g:else>


</body>
</html>
