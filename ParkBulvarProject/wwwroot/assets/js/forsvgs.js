$(function () {
    //$(".owl-item").attr("draggable", "false");
    $(".owl-item").children(".item").addClass("inner");
    $(".owl-item").css("overflow", "hidden");
   
    $.fn.lc_smoothscroll = function (ratio, duration, ignoreX, ignoreY) {
        var $subj = this,
            trackX = (typeof (ignoreY) == 'undefined' || !ignoreX) ? true : false,
            trackY = (typeof (ignoreY) == 'undefined' || !ignoreX) ? true : false,

            curDown = false,
            curYPos = 0,
            curXPos = 0,

            startScrollY = 0,
            startScrollX = 0,
            scrollDif = 0;

        $subj.mousemove(function (m) {
            m.preventDefault();
            if (curDown === true) {
                $subj.stop(true);

                if (trackY) {
                    $subj.scrollTop(startScrollY + (curYPos - m.offsetY));
                }
                if (trackX) {
                    $subj.scrollLeft(startScrollX + (curXPos - m.offsetX));
                }
            }

            if (typeof (lc_sms_timeout) != 'undefined') { clearTimeout(lc_sms_timeout); }
            lc_sms_timeout = setTimeout(function () {
                curDown = false;
            }, 50);
        });

        $subj.mousedown(function (m) {
            if (typeof (lc_sms_timeout) != 'undefined') { clearTimeout(lc_sms_timeout); }
            curDown = true;

            startScrollY = $subj.scrollTop();
            startScrollX = $subj.scrollLeft();
            curYPos = m.offsetY;
            curXPos = m.offsetX;
        });

        $subj.mouseup(function (m) {
            curDown = false;

            // smooth scroll
            var currScrollY = $subj.scrollTop();
            var scrollDiffY = (startScrollY - currScrollY) * -1;
            var newScrollY = currScrollY + (scrollDiffY * ratio);

            var currScrollX = $subj.scrollLeft();
            var scrollDiffX = (startScrollX - currScrollX) * -1;
            var newScrollX = currScrollX + (scrollDiffX * ratio);

            var anim_obj = {};
            if (trackY) {
                anim_obj["scrollTop"] = newScrollY;
            }
            if (trackX) {
                anim_obj["scrollLeft"] = newScrollX;
            }

            $subj.stop(true).animate(anim_obj, duration, 'linear');
        });
    };


    // implementation
    $('.inner').lc_smoothscroll(1, 100);


    // little trick to make mobile devices compatible with this demo
    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
        $('.inner').css('overflow', 'auto');
    }
});
$(function () {
    let modelshop = document.getElementById("modelshop");
    let owlitems = document.querySelectorAll("#bulvarModel .owl-item")
    let dots = document.querySelectorAll(".owl-dot");
    //Click process start
    $("body").on("click", "*", function () {
        if ($(this).attr("data-name") != null) {
            $(".clicked").removeClass("clicked");
            $(".clickedwhitetext").removeClass("clickedwhitetext");
            let text = document.querySelectorAll("svg *");
            for (let i = 0; i < text.length; i++) {
                if ($(text[i]).attr("data-name") != null) {
                    if ($(text[i]).attr("data-name").toLowerCase() == $(this).attr("data-name").toLowerCase()) {
                        if (text[i].tagName.toLocaleLowerCase() == "text") {
                            $(text[i]).addClass("clickedwhitetext");
                            $(text[i]).children().addClass("clickedwhitetext");
                        } else {
                            $(text[i]).addClass("clicked");
                        }
                    }
                }
            }
            let name = $(this).attr("data-name");
            $.ajax({
                url: "/ajax/getshopinfo/?shopname=" + name,
                datatype: "json",
                type: "get",
                success: function (res) {
                    $(".shopinfo").html(res);
                }
            })
        }
    })
    //Click process end


    if (modelshop) {
        let shops = document.querySelectorAll("svg *");
        for (var i = 0; i < shops.length; i++) {
            if ($(shops[i]).attr("data-name")!= null) {
                if ($(shops[i]).attr("data-name") == $(modelshop).val()) {
                    for (var b = 0; b < owlitems.length; b++) {
                        let pr = shops[i].parentElement.parentElement.parentElement.parentElement.parentElement;
                        let svg = document.querySelector("body");
                        if (owlitems[b] == pr) {
                            $(dots[b]).trigger("click");
                            let span = document.createElement("span");
                            span.setAttribute("data-name", modelshop.value);
                            span.className = "mk";
                            svg.appendChild(span);
                            $("body span.mk").trigger("click");
                        }
                    }
                    break;
                }
            }
        }
    }


    ////Hover process start
    $("svg *").mouseover(function () {
        if ($(this).attr("data-name") != null) {
            let text = document.querySelectorAll("text");
            for (let i = 0; i < text.length; i++) {
                if ($(text[i]).attr("data-name") != null) {
                    if ($(text[i]).attr("data-name").toLowerCase() == $(this).attr("data-name").toLowerCase()) {
                        $(text[i]).addClass("whitetext");
                        $($(text[i]).children()).addClass("whitetext");

                    }
                }
              
            }
            $(this).addClass("hovered");
        }
    })
    $("svg *").mouseleave(function () {
        if ($(this).attr("data-name") != null) {
            let text = document.querySelectorAll("text");
            for (let i = 0; i < text.length; i++) {
                if ($(text[i]).attr("data-name") != null) {
                    if ($(text[i]).attr("data-name").toLowerCase() == $(this).attr("data-name").toLowerCase()) {
                        $(text[i]).removeClass("whitetext");
                        $($(text[i]).children()).removeClass("whitetext");
                    }
                }
               
            }
            $(this).removeClass("hovered");

        }
    })
    $("text").mouseover(function () {
        if ($(this).attr("data-name") != null) {
            let shops = document.querySelectorAll("svg *");
            for (let i = 0; i < shops.length; i++) {
                if ($(shops[i]).attr("data-name") != null) {
                    if ($(shops[i]).attr("data-name").toLowerCase() == $(this).attr("data-name").toLowerCase()) {
                        if (!$(shops[i]).hasClass("hovered")) {
                            $(shops[i]).addClass("hovered");
                            $($(this)).addClass("whitetext");
                            $($(this).children()).addClass("whitetext");
                        }
                    }
                }
            }
        }
    })
    $("text").mouseleave(function () {
        if ($(this).attr("data-name") != null) {
            let shops = document.querySelectorAll("svg *");
            for (let i = 0; i < shops.length; i++) {
                if ($(shops[i]).attr("data-name") != null && $(this).attr("data-name") != null) {
                    if ($(shops[i]).attr("data-name").toLocaleLowerCase() == $(this).attr("data-name").toLocaleLowerCase()) {
                        if ($(shops[i]).hasClass("hovered")) {
                            $(shops[i]).removeClass("hovered");
                            $($(this)).removeClass("whitetext");
                            $($(this).children()).removeClass("whitetext");
                        }
                      
                    }
                }
               
            }
        }
    })
    ////Hover process end


    //followus form end
    let normal = 1;
    let marginleft = 0;
    let margintop = 0;
    $('.btnzoomin').click(function (e) {
        e.preventDefault();
        if (normal < 2) {
            $(".zoomdiv .active").removeClass("active");
            $(this).addClass("active");
            normal += 0.1;
            $(".svg_box").css("transform", "scale(" + normal + ")")
            marginleft += 50;
            margintop += 50;
            $(".svg_box").css("margin-left", marginleft + "px")
            $(".svg_box").css("margin-top", margintop + "px")
        }
       
    });
    $('.btnzoomout').click(function (e) {
        e.preventDefault();
        if (normal != 1) {
            $(".zoomdiv .active").removeClass("active");
            $(this).addClass("active");
            normal -= 0.1;
            $(".svg_box").css("transform", "scale(" + normal + ")")
            marginleft -= 50;
            margintop -= 50;
            $(".svg_box").css("margin-left", marginleft + "px")
            $(".svg_box").css("margin-top", margintop + "px")
        }
       
    });
   

    $(".owl-dot").click(function () {
        $(".svg_box").css("transform", "scale(" + 1 + ")")
        $(".svg_box").css("margin-left", 0 + "px")
        $(".svg_box").css("margin-top", 0 + "px")

    })

})