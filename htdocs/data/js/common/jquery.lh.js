/*	jquery.lh.js
    http://www.lhsalon.jp/sample/jquery/
    Version : 1.0.14
    Copyright LionHeart Co.,Ltd.
-------------------------------------------------------------------------- */
;(function($) {
    $.extend({
        lh: {
            _me: 'mouseenter',
            _ml: 'mouseleave',
            _isMobileParam: null,
            getScrollPosition: function() {
                return (document.documentElement.scrollTop||document.body.scrollTop);
            },
            getInnerHeight: function() {
                return (window.innerHeight||document.documentElement.clientHeight||document.body.clientHeight);
            },
            isMobile: function() {
                if( $.lh._isMobileParam !== null ) {
                    return $.lh._isMobileParam;
                }

                var ua = navigator.userAgent;
                if(ua.indexOf('iPhone') > 0 || ua.indexOf('iPod') > 0 || ua.indexOf('Android') > 0 && ua.indexOf('Mobile') > 0){
                    $.lh._isMobileParam = 'sp';
                }else if(ua.indexOf('iPad') > 0 || ua.indexOf('Android') > 0){
                    $.lh._isMobileParam = 'tab';
                }else{
                    $.lh._isMobileParam = 'other';
                }

                if( $.lh._isMobileParam !== 'other' ) {
                    $.lh._me = 'touchstart';
                    $.lh._ml = 'touchend';
                }

                return $.lh._isMobileParam;
            }
        }
    });
    $.fn.extend({
        /*	RollOver
        -------------------------------------------------------------------------- */
        rollOver:function(f) {
            var tgt=$(this);
            if(f && !tgt.find(f).length)
                return tgt;
            tgt.bind( $.lh._me, rOver ).bind( $.lh._ml, rOut ).each(preLoad);
            function rOver() {
                var tgt=changeTgt($(this));
                tgt.each(function() {
                    if($(this).attr("src"))
                        $(this).attr("src",$(this).attr("src").replace("_off.","_on."));
                });
            }
            function rOut() {
                var tgt=changeTgt($(this));
                tgt.each(function() {
                    if($(this).attr("src"))
                        $(this).attr("src",$(this).attr("src").replace("_on.","_off."));
                });
            }
            function changeTgt(tgt) {
                return (f)?tgt.find(f):tgt;
            }
            function preLoad() {
                var tgt=changeTgt($(this));
                tgt.each(function() {
                    if($(this).attr("src"))
                        $("<img>").attr("src",$(this).attr("src").replace("_off.","_on."));
                });
            }
            return tgt;
        },
        /*	Alpha RollOver
        -------------------------------------------------------------------------- */
        alphaRo:function(opt) {
            var _set={
                from:1,
                to:0.8,
                fade:false,
                speed:700,
                group:true
            };
            if(opt) $.extend(_set,opt);

            $(this).css({"opacity":_set.from}).bind( $.lh._me, {toNum:_set.to}, toOpacity ).bind( $.lh._ml, {toNum:_set.from}, toOpacity );
            if($(this).css("display")=="inline") $(this).css({display:"inline-block"});
            function toOpacity(e) {
                var tgt=$(this);
                var rel=tgt.attr('rel');
                if(rel && _set.group) {
                    tgt=$("*[rel='"+rel+"']");
                }
                (_set.fade)?tgt.stop(true,false).animate({"opacity":e.data.toNum},{duration:_set.speed}):tgt.css("opacity",e.data.toNum);
            }
            return $(this);
        },
        /*	Smooth Scroll
        -------------------------------------------------------------------------- */
        smScroll:function(opt) {
            var _set={
                speed:700,
                easing:'',
                hash:true
            };
            if(opt) $.extend(_set,opt);

            var _hash,_h,_inH,_flag=true;
            var strUA=navigator.userAgent.toLowerCase();
            var _scrTgt=$('html,body');

            $(this).click(function() {
                var tgt=$(this).attr('href').substr(1);
                _h=Math.max(document.body.clientHeight ,document.body.scrollHeight);
                _h=Math.max(_h ,document.documentElement.scrollHeight);
                _h=Math.max(_h ,document.documentElement.clientHeight);
                _inH=$.lh.getInnerHeight();
                toPos(tgt);
                return false;
            });
            if(_set.hash) {
                setInterval(function() {
                    var sHash=getHash();
                    toPosBrowse(sHash);
                },200);
            }
            function toPos(gHash) {
                if(_flag) {
                    _hash=gHash;
                    _flag=false;
                    _scrTgt.animate({scrollTop:toGetPoint()},_set.speed,_set.easing,setHash);
                }
            }
            function toPosBrowse(gHash) {
                if(_hash && _hash !==gHash && _flag) {
                    _hash=gHash;
                    _scrTgt.stop(true,false).scrollTop(toGetPoint());
                    _flag=true;
                }
            }
            function toGetPoint() {
                var result=0;
                if(_hash !='') {
                    var tgt = $("#"+_hash);
                    if(! tgt.length ) tgt = $("*[name='"+_hash+"']").eq(0);
                    if( tgt.length ) {
                        result = tgt.offset().top;
                        if(result+_inH>_h) result=_h-_inH;
                    }
                }
                return result;
            }
            function getHash() {
                if (typeof window.location.hash !=='undefined') {
                    return window.location.hash.substr(1);
                } else {
                    return location.hash.substr(1);
                }
            }
            function setHash() {
                if(_set.hash) {
                    if (typeof window.location.hash !=='undefined') {
                        if (window.location.hash !==_hash) {
                            window.location.hash=_hash;
                        }
                    } else if(location.hash !==_hash) {
                        location.hash=_hash;
                    }
                }
                _flag=true;
            }
            return $(this);
        },
        /*	Popup Window
        -------------------------------------------------------------------------- */
        anotherWin:function(opt) {
            var _set={
                width:500,
                height:false,
                name:'subWindow',
                scrollbars:'yes',
                resizable:'yes',
                menubar:'yes',
                attr:false
            };
            if(opt) $.extend(_set,opt);

            $(this).click(function() {
                var url=$(this).attr('href');
                if( _set.attr ) checkAttrSize( this );
                var h=(_set.height)?_set.height:$.lh.getInnerHeight();
                var rule='width='+_set.width+',height='+h+',scrollbars='+_set.scrollbars+',resizable='+_set.resizable+',menubar='+_set.menubar;
                window.open(url,_set.name,rule);
                return false;
            });

            function checkAttrSize( tgt ) {
                var size = $(tgt).data("size").split(",");
                if( ~~size[0] > 0 )
                    _set.width = ~~size[0];
                if( ~~size[1] > 0 )
                    _set.height = ~~size[1];
            }
            return $(this);
        },
        /*	Set Same Height
        -------------------------------------------------------------------------- */
        setHeight:function(child,opt) {
            var _set={
                outer: false,
                step : 0
            };
            if(opt) $.extend(_set,opt);

            $(this).each(function() {
                var sHeight=0;
                if( _set.step === 0 ) {
                    $(this).find(child).each(function() {
                        $(this).css('height','auto');
                        var gH=_set.outer?$(this).outerHeight():$(this).height();
                        if(sHeight<gH)
                            sHeight=gH;
                    });
                    $(this).find(child).each(function() {
                        var lHeight=_set.outer?sHeight-$(this).outerHeight()+$(this).height():sHeight;
                        $(this).height(lHeight);
                    });
                } else {
                    var target = $(this).find( child );
                    var length = target.length;
                    for( var i=0; i<length; i+=_set.step ) {
                        sHeight = 0;
                        target.slice( i, i+_set.step ).each(function() {
                            $(this).css('height','auto');
                            var gH=_set.outer?$(this).outerHeight():$(this).height();
                            if(sHeight<gH)
                                sHeight=gH;
                        });
                        target.slice( i, i+_set.step ).each(function() {
                            var lHeight=_set.outer?sHeight-$(this).outerHeight()+$(this).height():sHeight;
                            $(this).height(lHeight);
                        });
                    }
                }
            });
            return $(this);
        },
        /*	Set Division Anchor
        -------------------------------------------------------------------------- */
        setDivAnchor:function(opt) {
            var _set={
                not:false,
                force:true,
                aclass:"act",
                over:null,
                out:null
            };
            if(opt) $.extend(_set,opt);

            var _tgt=$(this).filter(getTarget);
            _tgt.each(function() {
                var _tgt	= $(this),
                    _a		= _tgt.find('a').eq(0);
                if(! _a.length > 0 )
                    return;
                _tgt.css("cursor","pointer").bind( $.lh._me, function() {
                    _tgt.addClass(_set.aclass);
                    var img=_tgt.find("img[src*='_off.']");
                    if(img.length>0) {
                        img.each( function() {
                            $(this).attr("src",$(this).attr("src").replace("_off.","_on."));
                        } );
                    }
                    if( $.isFunction( _set.over ) )
                        _set.over( _tgt );
                } ).bind( $.lh._ml, function() {
                    _tgt.removeClass(_set.aclass);
                    var img=_tgt.find("img[src*='_on.']");
                    if(img.length>0) {
                        img.each( function() {
                            $(this).attr("src",$(this).attr("src").replace("_on.","_off."));
                        } );
                    }
                    if( $.isFunction( _set.out ) )
                        _set.out( _tgt );
                } );
                _tgt.click(function(evt) {
                    if(_set.force) {
                        if(_a.attr("target")=="_blank") {
                            window.open(_a.attr("href"));
                        } else {
                            window.location.href=_a.attr("href");
                        }
                    }
                    _a.trigger("click");
                });
            }).find("a").click(function(e) {
                e.stopPropagation();
            }).find("img[src*='_off.']").unbind($.lh._me).unbind($.lh._ml);
            function getTarget(result) {
                if(_set.not && $(this).filter(_set.not).length>0) {
                    return false;
                } else {
                    return true;
                }
            }
            return $(this);
        },
        /*	Default Inputarea
        -------------------------------------------------------------------------- */
        inputDefault:function(opt) {
            var _set={
                form:"form",
                toColor:"#999999",
                fromColor:"#333333"
            };
            if(opt) $.extend(_set,opt);

            var exList=$(this);
            $(this).each(function() {
                if($(this).val()=="") {
                    $(this).data("flag","false").val($(this).attr("title")).css("color",_set.toColor).focus(inpFocus).blur(inpBlur);
                }
            });
            $(_set.form).submit(function() {
                exList.each(function() {
                    if($(this).val()==$(this).attr("title") && $(this).data("flag")=="false" ) {
                        $(this).val("");
                    }
                });
            });
            function inpFocus() {
                $(this).css("color",_set.fromColor).val("").data("flag","true");
            }
            function inpBlur() {
                if($(this).val()=="") {
                    $(this).val($(this).attr("title")).css("color",_set.toColor);
                    $(this).bind("focus",inpFocus).data("flag","false");
                } else {
                    $(this).unbind("focus");
                }
            }
            return $(this);
        },
        /*	Stoker Menu
        -------------------------------------------------------------------------- */
        stokerMenu:function(opt) {
            var _set={
                child:".stokerMenu",
                toPos:20,
                delay:700,
                speed:5
            };
            if(opt) $.extend(_set,opt);

            var cBox=$(this);
            var lBox=$(this).find(_set.child);
            lBox.show();
            var nowP=0;
            var scrInterval,chkInterval;

            cBox.css({"position":"relative","zoom":1});
            lBox.css({"position":"absolute","top":0});

            switch(_set.toPos) {
                case "bottom":
                    $(window).bind("resize",function() {
                        _set.toPos=$.lh.getInnerHeight()-lBox.outerHeight(true);
                    }).trigger("resize");
                    var h=$.lh.getInnerHeight();
                    var lHeight=lBox.outerHeight(true);
                    var cHeight=cBox.outerHeight(true);

                    if(h>=cHeight)
                        nowP=h-lHeight;
                    else
                        nowP=cHeight-lHeight;

                    lBox.css({"top":nowP});
                break;
            }
            goMoving();

            function chkMoving() {
                chkInterval=setInterval(function() {
                    var sabun=getTargetPos()-nowP;
                    if(Math.abs(sabun)>5) {
                        clearInterval(chkInterval);
                        goMoving();
                    }
                },_set.delay);
            }
            function goMoving() {
                scrInterval=setInterval(function() {
                    var sabun=(getTargetPos()-nowP)/_set.speed;
                    nowP=nowP+sabun;

                    if(Math.abs(sabun)<0.5) {
                        clearInterval(scrInterval);
                        nowP=getTargetPos();
                        lBox.css('top',nowP);
                        chkMoving();
                    } else {
                        lBox.css('top',nowP);
                    }
                },10);
            }
            function getTargetPos() {
                var nHeight=lBox.outerHeight(true);
                var cHeight=cBox.outerHeight(true);
                var scr=$.lh.getScrollPosition()+_set.toPos;
                var tgt = scr;
                tgt=tgt<0?0:tgt;
                if(tgt+nHeight>cHeight)
                    tgt=cHeight-nHeight;
                return tgt;
            }
            return $(this);
        },
        /*	Set ID or Class
        -------------------------------------------------------------------------- */
        setIdClass:function(str) {
            if( str.match("/\./") ) {
                $(this).addClass( str.replace(".", "") );
            } else {
                $(this).attr( "id", tmp.replace("#", "") );
            }
            return $(this);
        }
    });
})(jQuery);

// 初期化
$.lh.isMobile();