<%--
  Created by IntelliJ IDEA.
  User: greg
  Date: Nov 14, 2008
  Time: 10:48:41 AM
  To change this template use File | Settings | File Templates.
--%>


<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'menus.css')}"/>
<style lang="text/css">
.menuitem{
    background: #eee url(<g:createLinkTo dir="images/menus" file="bggrad1.png"/>) repeat-x 0px 0px;
}
.menuitem.select{
    background: #eee url(<g:createLinkTo dir="images/menus" file="bggrad1.png"/>) repeat-x 0px -30px;
}
.menuitem:hover{
    background: #eee url(<g:createLinkTo dir="images/menus" file="bggrad1.png"/>) repeat-x 0px -20px;
}
span.menuitem:hover{
    background: #eee url(<g:createLinkTo dir="images/menus" file="bggrad1.png"/>) repeat-x 0px -20px;
}
</style>
<g:javascript library="prototype"/>
<g:javascript library="menus"/>
<script type="text/javascript">
//<!--
    //compatibility with menu javascript:
    var MenuImages = {
        disclosure: "${createLinkTo(dir:'images/menus',file:'icon-tiny-disclosure.png')}",
        disclosureOpen: "${createLinkTo(dir:'images/menus',file:'icon-tiny-disclosure-open.png')}",
        disclosureWait: "${createLinkTo(dir:'images/menus',file:'icon-tiny-disclosure-waiting.gif')}",
    };

    var menus = new MenuController();
//-->
</script>



