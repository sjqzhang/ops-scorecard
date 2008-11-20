# Menus

To use the menus, unzip this zip file overtop your grails project directory.

Modify your grails-app/views/layout/main.gsp (or whichever location will contain the menus) to 
contain the code shown in the provided grails-app/views/layouts/menus.gsp

like so:

        <div>
            <g:render template="/common/menus"/>
            Menu:
            <!-- renders top level menu for key 'default'.-->
            <g:menu />
            <!-- renders link for top level menu, default key -->
            <g:menulink selected="${params.name}"/>
            <!-- renders submenu based on params.name, or the first item in the top-level menu, default key -->
            <g:menu submenu="${params.name?params.name:'0'}" />
            <!-- renders link to submenu based on params.name, or the first item in the top-level menu, default key -->
            <g:menulink submenu="${params.name?params.name:'0'}" selected="${params.subitem}"/>
        </div>

The included "_menulinks.gsp" template provides a parameterized template for rendering this content:


   <g:render template="/common/menulinks" model="${[selected:params.name?params.name:'0',subselected:params.subitem]}"/>

Basically, just render the template /common/menus in the page header somewhere.  Then you can use the two
tags <g:menu/> and <g:menulink/>

# Tags.

The <g:menu /> tag generates the content of a single menu.  the <g:menulink /> tag creates the link used to 
access a particular menu, so you can put multiple links for the same menu.


You can specify these parameters for both of the tags:

    submenu: name of a submenu to render if it is not the top-level menu (optional)
    key: key for a particular set of menus to use.  defaults to 'default' (optional)
    class: additional CSS class to use for either the menu link, or menu itself (optional)

in the <g:menu/> tag you can also specify:

    params: map of parameters to add to each link in the menu (optional)

in <g:menulink/> tag, you can also specify:

    selected: name of the selected menu item to display in the link. defaults to first item in the chosen menu (optional)


To configure the menus, modify your messages.properties file.

The default menu hierarchy is called 'default'. (If you create others, be sure to specify the 'key' attribute in the 
tags listed above).

For each menu item, named ITEM, specify these properties:

    menus.default.title.ITEM=Item Title
    menus.default.image.ITEM=path/for/image.png
    menus.default.link.ITEM=controller:action?param=a&param2=b

For the link definition, the "controller:" part is required.

For the top-level menu, list the menu item names:

    menus.default.list=ITEM,ITEM_B,ITEM_C

For any submenus, create another entry for the content list:

    menus.default.content.ITEM_B=ITEM_D,ITEM_E

