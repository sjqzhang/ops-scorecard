var MenuController = Class.create({
    menuStart : new Hash(),
    doMenuToggle: function(item, menuname) {
        if (Element.visible(menuname)) {
            this.doMenuHide(menuname);
        } else {
            this.doMenuShow(item, menuname);
        }
    },
    doMenuShow: function(item, menuname) {
        this.doMenuHideAll();
        var menu = $(menuname);
        var menuLink = $(item);
        Element.hide(menu);
        Element.absolutize(menu);
        menu.setStyle({'zIndex':100});
        var h = menuLink.offsetHeight;
        var cw = menuLink.offsetWidth;
        var pos = menuLink.viewportOffset();

        var page = document.viewport.getWidth();
        var pt = document.viewport.getScrollOffsets();
        var w = menu.getWidth();
        var t = page - (pos.left + (w + 16));
        if (t > 0) {
            t = 0;
        }
        if (t < 0 && w > cw) {
            t = cw - w;
        }
//      alert("t: "+t+", pos.left: "+pos.left+", w: "+w+", cw: "+cw+", page: "+page+", pt: "+pt);

        Element.clonePosition(menu, menuLink, { setWidth:   false, setHeight:  false,offsetTop:h,offsetLeft:t});

        menuLink.addClassName('menuSelected');
        menuLink.addClassName('menuopen');
        menuLink.addClassName('menu_click_' + menu.identify());
        Element.show(menu);
        this.menuStart.set(menuname, true);
        menuLink.down("img.disclosureicon").addClassName("menu_discl_" + menu.identify());
        menuLink.down("img.disclosureicon").src = MenuImages.disclosureOpen;

    },
    doMenuHide: function(menu, time) {
        if (time) {
            setTimeout(this.doMenuHide.bind(this,menu), time);
        } else {
            var id = Element.identify(menu);
            if (this.menuStart.get(id)) {
                Element.hide(menu);
                this.menuStart.unset(id);
                var cls = 'menu_click_' + id;
                var cls2 = 'menu_discl_' + id;
                $$("." + cls).each(function(i) {$(i).removeClassName("menuSelected", "menuopen", cls)});
                $$("img." + cls2).each(function(i) {
                    $(i).removeClassName(cls2);
                    $(i).src = MenuImages.disclosure;
                });
            }
        }
    },
    doMenuHideAll: function() {
        var did = false;
        var menus=this;
        this.menuStart.each(function(m) {
            menus.doMenuHide(m.key);
            did = true;
        });
        return did;
    },
    _menukeyDownHandler: function(e) {
        var code;
        if (e.keyCode) code = e.keyCode;
        else if (e.which) code = e.which;
        if (code == Event.KEY_ESC) {
            if (Try.these(this.doMenuHideAll.bind(this))) {
                return false;
            }
        }
    },
    _mouseoutMenuHide: function(e, menuname) {
        var target = Event.element(e);
        var reltarget = Event.relatedTarget(e);
        if (e.relatedTarget) {
            reltarget = $(e.relatedTarget);
        }
        if (!reltarget.descendantOf(menuname)) {
            this.doMenuHide(menuname);
        }
    }
});