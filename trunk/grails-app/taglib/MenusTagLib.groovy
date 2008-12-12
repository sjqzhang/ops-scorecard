/*
 * Copyright 2003-2008 ControlTier Software, Inc. (http://www.controltier.com)
 * All Rights Reserved.
 *
 * Licensed under the Open Software License, Version 2.1 (the "License"); you may
 * not use this file except in compliance with the License. You may obtain
 * a copy of the License at:
 *
 * http://www.controltier.com/OSL21.html
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES, either express or implied.
 * See the License for the specific language governing
 * permissions and limitations under the License.
 *
 * More information on this software can be found at: http://open.controltier.com
 *
 */
 
/*
 * MenusTaglib.java
 * 
 * User: greg
 * Created: Nov 14, 2008 10:43:14 AM
 * $Id$
 */
class MenusTagLib {
    def menulink ={attrs, body ->
        def key='default'
        if(attrs.key){
            key=attrs.key
        }
        def item = attrs.selected
        def submenu=attrs.submenu

        //load messages
        def menukey=key
        def menuliststrtop = g.message(code:"menus.${key}.list")
        def menulisttop=menuliststrtop.split(/,/)
        def menulist
        if(null!=submenu){
            if('0'==submenu){
                submenu=menulisttop[0]
            }
            def String menuliststr = g.message(code:"menus.${key}.content.${submenu}")
            menukey=key+"_"+submenu
            menulist=menuliststr.split(/,/)
        }else{
            menulist=menulisttop
        }
        if(!item || '0'==item){
            item=menulist[0]   
        }



        String tcode = "menus.${key}.title.${item}"
        def title=g.message(code:tcode)
        if(tcode==title || title==null){
            title=item
        }
        String icode = "menus.${key}.image.${item}"
        def image=g.message(code:icode)
        if(image==icode){
            image=null
        }
        def mkp = new groovy.xml.MarkupBuilder(out) //this line will be unnecessary in versions of Grails after version 1.2
        mkp {
            span('class':"menulink  ${attrs.class?attrs.class:''}",onmousedown:"menus.doMenuToggle(this,\"${menukey}_gmenu\");return false;",'style':"padding: 4px 2px;display:inline;"){
                if(image){
                    img('src':g.createLinkTo(dir:'images',file:image), 'class':"menuicon")
                }
                span(title)
                img('src':g.createLinkTo(dir:'images/menus',file:'icon-tiny-disclosure.png'), 'class':"disclosureicon",'width':"12px",'height':'12px')
            }
        }
    }

    def menu={ attrs, body ->
        def key='default'
        
        //
        if(attrs.key){
            key=attrs.key
        }

        //load messages
        def submenu=attrs.submenu
        def menukey=key
        def menuliststrtop = g.message(code:"menus.${key}.list")
        def menulisttop=menuliststrtop.split(/,/)
        def menulist
        if(null!=submenu){
            if('0'==submenu){
                submenu=menulisttop[0]
            }
            def String menuliststr = g.message(code:"menus.${key}.content.${submenu}")
            menukey=key+"_"+submenu
            menulist=menuliststr.split(/,/)
        }else{
            menulist=menulisttop
        }


        def mkp = new groovy.xml.MarkupBuilder(out) //this line will be unnecessary in versions of Grails after version 1.2
        mkp {
            div('id': menukey+'_gmenu','class':"gmenu ${attrs.class?attrs.class:''}",'style':"display:none;") {
                div('class':'menuSection'){
                    if(submenu && !attrs.noheader){
                        div(style:'padding:5px'){
                            String icode = "menus.${key}.image.${submenu}"
                            def image=g.message(code:icode)
                            if(image==icode){
                                image=null
                            }
                            if(image){
                                img('src':g.createLinkTo(dir:'images',file:image), 'class':"menuicon")
                            }
                            span(g.message(code:"menus.${key}.title.${submenu}"))
                        }
                    }
                    ul{
                        menulist.each{k->
                            if(k=='-'){
                                hr()
                            }else{
                                String tcode = "menus.${key}.title.${k}"
                                def title=g.message(code:tcode)
                                if(title==tcode || null==title){
                                    title=k
                                }
                                String icode = "menus.${key}.image.${k}"
                                def image=g.message(code:icode)
                                if(image==icode){
                                    image=null
                                }
                                String lcode = "menus.${key}.link.${k}"
                                def link=g.message(code:lcode)
                                if(link==lcode){
                                    link=null
                                }
                                def parms=[:]

                                def ctrl=null
                                def href=null
                                def external=false
                                if(link && (link.startsWith("http:") || link.startsWith("https:") || link.startsWith("javascript:"))){
                                    href=link
                                    external=true
                                }else {
                                    if(link && link.indexOf("?")>0){

                                        def pstr = link.substring(link.indexOf("?")+1)
                                        link = link.substring(0,link.indexOf("?"))
                                        pstr.split("&").each{ pair->
                                            if(pair.indexOf("=")>0){
                                                parms[pair.substring(0,pair.indexOf("="))] = pair.substring(pair.indexOf("=")+1)
                                            }else{
                                                parms[pair]=pair
                                            }
                                        }
                                    }
                                    if(link && (link.indexOf(":")>0) ){
                                        ctrl=link.substring(0,link.indexOf(":"))
                                        link=link.substring(link.indexOf(":")+1)
                                    }else if(params.controller){
                                        ctrl=params.controller
                                    }
                                }
                                if(attrs.params && attrs.params instanceof java.util.Map){
                                    parms.putAll(attrs.params)
                                }
                                if(null==href && null!=link){
                                    href=g.createLink('action':link,'controller':ctrl,params:parms)
                                }

                                li{
                                    if(href){
                                        a('href':href, 'class':'menuitem '+(submenu?'sub':''),'style':"padding:5px",'target':(external && 'false'!=attrs.newwindow)?'_new':''){
                                            if(image){
                                                img('src':g.createLinkTo(dir:'images',file:image), 'class':"menuicon")
                                            }
                                            span(title)
                                        }
                                    }else{
                                        span('class':'menuitemtitle '+(submenu?'sub':'')){
                                            if(image){
                                                img('src':g.createLinkTo(dir:'images',file:image), 'class':"menuicon")
                                            }
                                            span(title)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

        }
        out<<"""
            <script type="text/javascript">
//<!--
if(typeof(menus)=='undefined'){
    menus = new MenuController();
}
Event.observe(window,'load', function(e){
    Event.observe(\$('${menukey}_gmenu'),'mouseout',function(e){menus._mouseoutMenuHide(e,'${menukey}_gmenu');});
});
//-->
</script>
"""

    }

    def menuitemlink={attrs,body ->
        def key='default'
        //
        if(attrs.key){
            key=attrs.key
        }

        def item = attrs.item


        String tcode = "menus.${key}.title.${item}"
        def title=g.message(code:tcode)
        if(tcode==title || title==null){
            title=item
        }
        String icode = "menus.${key}.image.${item}"
        def image=g.message(code:icode)
        if(image==icode){
            image=null
        }
        String lcode = "menus.${key}.link.${item}"
        def link=g.message(code:lcode)
        if(link==lcode){
            link=null
        }
        def parms=[:]

        def ctrl=null
        def href=null
        def external=false
        if(link && (link.startsWith("http:") || link.startsWith("https:") || link.startsWith("javascript:"))){
            href=link
            external=true
        }else{
            if(link && link.indexOf("?")>0){

                def pstr = link.substring(link.indexOf("?")+1)
                link = link.substring(0,link.indexOf("?"))
                pstr.split("&").each{ pair->
                    if(pair.indexOf("=")>0){
                        parms[pair.substring(0,pair.indexOf("="))] = pair.substring(pair.indexOf("=")+1)
                    }else{
                        parms[pair]=pair
                    }
                }
            }
            if(link && (link.indexOf(":")>0) ){
                ctrl=link.substring(0,link.indexOf(":"))
                link=link.substring(link.indexOf(":")+1)
            }else if(params.controller){
                ctrl=params.controller
            }
        }
        if(attrs.params && attrs.params instanceof java.util.Map){
            parms.putAll(attrs.params)
        }
        if(null==href && null!=link){
            href=g.createLink('action':link,'controller':ctrl,params:parms)
        }


        if(href){
            def mkp = new groovy.xml.MarkupBuilder(out) //this line will be unnecessary in versions of Grails after version 1.2
            mkp {
                a('href':href, 'class':(attrs.class?attrs.class:''),'style':"padding:5px",'target':(external && 'false'!=attrs.newwindow)?'_new':''){
                    if(image){
                        img('src':g.createLinkTo(dir:'images',file:image), 'class':"menuicon")
                    }
                    span(title)
                }
            }
        }else{
            def mkp = new groovy.xml.MarkupBuilder(out) //this line will be unnecessary in versions of Grails after version 1.2
            mkp{
                span{
                    if(image){
                        img('src':g.createLinkTo(dir:'images',file:image), 'class':"menuicon")
                    }
                    span(title)
                }
            }
        }
    }


}