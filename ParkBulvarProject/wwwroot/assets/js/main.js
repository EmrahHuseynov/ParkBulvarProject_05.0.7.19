$(document).ready(function () {

    //   navbar active line start
    var line = $("ul.navbar-nav span.line ");
    var li = $("ul.navbar-nav li.nav-item");
    var active_li = $("ul.navbar-nav li.active_li");

    var left = active_li.data("left");
    line.css("left", left);

    li.hover(function () {
        left = $(this).data("left");
        line.css("left", left);


    }, function () {

        left = active_li.data("left");

        line.css("left", left);
    }
    );

    //   navbar active line end


    // MAIN SLIDER START

    var owl_main = $(' #mainSlider .owl-carousel');
    owl_main.owlCarousel({
        autoplay: false,
        autoplayTimeout: 3000,
        smartSpeed: 1500,
        loop: true,
        items: 1,
        nav: false,


    });

    $('#mainSlider .next_btn ').click(function () {
        owl_main.trigger('next.owl.carousel');
    })
    $('#mainSlider .prev_btn').click(function () {
        owl_main.trigger('prev.owl.carousel');
    });


    // MAIN SLIDER END


    // Icon SLIDER start

    var owl_icon = $(' #iconSlider .owl-carousel');
    owl_icon.owlCarousel({
        autoplay: false,
        autoplayTimeout: 3000,
        smartSpeed: 1500,
        loop: true,
        items: 1,
        nav: false,
        responsive: {
            0: {
                items: 1
            },
            375: {
                items: 2
            },
            600: {
                items: 4
            },
            1000: {
                items: 6
            },

            1390: {
                items: 7
            }
        }


    });

    $('#iconSlider .next_btn ').click(function () {
        owl_icon.trigger('next.owl.carousel');
    })
    $('#iconSlider .prev_btn').click(function () {
        owl_icon.trigger('prev.owl.carousel');
    });



    // Icon SLIDER END




    //   event headers active line start
    $('ul.headers').on('click', 'li', function () {
        $('ul.headers li.active_li').removeClass('active_li');
        $(this).addClass('active_li');

    });

    //   event headers active line end


    // davam eden aksiya SLIDER start

    var owl_davamAksiya = $('#modelAksiyalar  #eventSlider .aksiyaSlider .owl-carousel');
    owl_davamAksiya.owlCarousel({
        autoplay: false,
        autoplayTimeout: 3000,
        smartSpeed: 1500,
        loop: true,
        nav: false,
        margin: 60,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 2
            },
            1000: {
                items: 3
            }

            ,
            1390: {
                items: 4
            }
        }


    });

    $('#modelAksiyalar  #eventSlider .aksiyaSlider .next_btn ').click(function () {
        owl_davamAksiya.trigger('next.owl.carousel');
    })
    $('#modelAksiyalar  #eventSlider .aksiyaSlider .prev_btn').click(function () {
        owl_davamAksiya.trigger('prev.owl.carousel');
    });



    //  davam eden aksiya SLIDER END








    // aksiya SLIDER start
    var owl_aksiya = $(' #eventSlider .aksiyaSlider .owl-carousel');
    owl_aksiya.owlCarousel({
        autoplay: false,
        autoplayTimeout: 3000,
        smartSpeed: 1500,
        loop: true,
        nav: false,
        margin: 60,
        responsive: {
            0: {
                items: 1
            },
            500: {
                items: 2
            },

            991: {
                items: 3
            },

            1390: {
                items: 4
            }
            ,

            1600: {
                items: 6
            }
        }


    });

    $('#eventSlider .aksiyaSlider .next_btn ').click(function () {
        owl_aksiya.trigger('next.owl.carousel');
    })
    $('#eventSlider .aksiyaSlider .prev_btn').click(function () {
        owl_aksiya.trigger('prev.owl.carousel');
    });

    // aksiya SLIDER END




    // tedbir SLIDER start
    var owl_tedbir = $(' #eventSlider .tedbirSlider .owl-carousel');
    owl_tedbir.owlCarousel({
        autoplay: false,
        autoplayTimeout: 3000,
        smartSpeed: 1500,
        loop: true,
        nav: false,
        margin: 60,
        responsive: {
            0: {
                items: 1
            },
            500: {
                items: 2
            },
            990: {
                items: 3
            },

            1391: {
                items: 4
            }
        }


    });

    $('#eventSlider .tedbirSlider .next_btn ').click(function () {
        owl_tedbir.trigger('next.owl.carousel');
    })
    $('#eventSlider .tedbirSlider .prev_btn').click(function () {
        owl_tedbir.trigger('prev.owl.carousel');
    });

    // tedbir SLIDER END



    //  tedbir aksiya header start

    $("#eventSlider .headers li.aksiya").click(function () {
        $("#eventSlider   .aksiyaSlider").css("display", "block");
        $("#eventSlider   .tedbirSlider").css("display", "none");
        $("#eventSlider   .aksiyaSlider.bitmis").css("display", "none");


    })

    $("#eventSlider .headers li.tedbir").click(function () {
        $("#eventSlider   .tedbirSlider").css("display", "block");
        $("#eventSlider   .aksiyaSlider").css("display", "none");
        $("#eventSlider   .aksiyaSlider.bitmis").css("display", "block");

    })

    //  tedbir aksiya header end





    // gallery SLIDER start

    var owl_gallery = $(' #gallerySlider .gallerySlider .owl-carousel');
    owl_gallery.owlCarousel({
        autoplay: true,
        autoplayTimeout: 3000,
        smartSpeed: 1500,
        loop: true,
        nav: false,
        margin: 17,
        center: true,
        responsive: {
            0: {
                items: 1,
                center: false
            },
            500: {
                items: 2,
                center: false

            },
            991: {
                items: 3
            },

            1390: {
                items: 4
            },
            1600: {
                items: 5
            }
        }


    });

    $('#gallerySlider .gallerySlider .next_btn ').click(function () {
        owl_gallery.trigger('next.owl.carousel');
    })
    $('#gallerySlider .gallerySlider .prev_btn').click(function () {
        owl_gallery.trigger('prev.owl.carousel');
    });



    // gallery SLIDER END




    // xeber detali SLIDER start

    var owl_xeber_detal = $(' #esasXeber .xeberSlider .owl-carousel');
    owl_xeber_detal.owlCarousel({
        autoplay: false,
        autoplayTimeout: 3000,
        smartSpeed: 1500,
        loop: true,
        nav: false,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 1
            },
            1000: {
                items: 1
            }
        }


    });

    $('#esasXeber .xeberSlider .next_btn ').click(function () {
        owl_xeber_detal.trigger('next.owl.carousel');
    })
    $('#esasXeber .xeberSlider  .prev_btn').click(function () {
        owl_xeber_detal.trigger('prev.owl.carousel');
    });

    // xeber detali SLIDER end





    // diger xeber SLIDER start

    var owl_digerxeber = $(' #digerXeber .owl-carousel');
    owl_digerxeber.owlCarousel({
        autoplay: false,
        autoplayTimeout: 3000,
        smartSpeed: 1500,
        loop: true,
        nav: false,
        margin: 60,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 2
            },
            1000: {
                items: 2,
                margin: 40
            }

            ,
            1300: {
                items: 3,
                margin: 40
            }
        }


    });

    $('#digerXeber .left_side .next_btn ').click(function () {
        owl_digerxeber.trigger('next.owl.carousel');
    })
    $('#digerXeber .left_side   .prev_btn').click(function () {
        owl_digerxeber.trigger('prev.owl.carousel');
    });

    // diger xeber SLIDER end



    // bulvar model SLIDER start

    var owl_bulvarmodel = $(' #bulvarModel .owl-carousel');
    owl_bulvarmodel.owlCarousel({
        autoplay: false,
        autoplayTimeout: 3000,
        smartSpeed: 1500,
        loop: false,
        nav: false,
        mouseDrag: false,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 1
            },
            1000: {
                items: 1
            }
        }


    });
    // diger xeber SLIDER end



    // model bulvar count start
    var dots = document.querySelectorAll("#bulvarModel .owl-carousel .owl-dots .owl-dot")
    for (var i = 0; i < dots.length; i++) {
        result = i - 2 < 0 ? i - 2 : i - 1;
        dots[i].children[0].innerHTML = result;
    }


    // model bulvar count end
    $(".search.iconka").click(function () {
        $("#mainSearch").css("display", "block");
    })

    $("#mainSearch .close_s").click(function () {
        $("#mainSearch").css("display", "none");
    })


    ///Shop filter start
    $(".categories").click(function (e) {
        e.preventDefault();
        let shops = document.querySelectorAll(".magaza");
        for (var i = 0; i < shops.length; i++) {
            let idarr = $(shops[i]).attr("cat-id").split(" ");
            console.log();
            if (idarr.indexOf($(this).attr("data-id"))!=-1) {
                $(shops[i]).fadeIn();
            } else {
                $(shops[i]).fadeOut();
            }
        }
    })


    ///Shop filter end


    //followus form start
    $("#followusform").submit(function (e) {
        e.preventDefault();
        let mail = $(this).children("input").val();
        $.ajax({
            url: "/home/addmail/?Email=" + mail,
            type: "get",
            datatype: "json",
            success: function (res) {
                if (res.status == 200) {
                    swal("Təşəkkürlər", "Müraciətiniz uğurla qeydə alındı", "success")
                    $("#followusform").children("input").val("");
                }
            }
        })
    })


    

  
});