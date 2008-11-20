<%--
  Created by IntelliJ IDEA.
  User: greg
  Date: Nov 17, 2008
  Time: 2:41:48 PM
  To change this template use File | Settings | File Templates.
--%>

<!-- include Menus in layout -->
<div class="menus">
    
    
    <!-- renders top level menu for key 'default'.-->
    <g:menu />
    <!-- renders link for top level menu, default key -->
    <!-- item attribute specifies the selected menu item to show from the top level menu. -->
    <g:menulink selected="${selected}"/>
    <!-- renders submenu based on params.name, or the first item in the top-level menu, default key -->
    <g:menu submenu="${selected}" />
    <!-- renders link to submenu based on params.name, or the first item in the top-level menu, default key -->
    <g:menulink submenu="${selected}" selected="${subselected}"/>
</div>