/*--------------------------------------------------
Project:        App-Landing
Version:        1.0
Author:         Company Name
-----------------------------------------------------

    JS INDEX
    ================================================
    * preloader js
    * One Page Scroll
    * slick Menu js 
    * slick Nav
    * testimonial slider
    * Counter
    * bottom to top
    ================================================*/

(function ($) {
    "use strict";
    var $main_window = $(window);
    /*====================================
        preloader js
      ======================================*/
    $main_window.on('load', function () {
        $('#preloader').fadeOut('slow');
    });


    /*====================================
        sticky menu js
      ======================================*/
    var windows = $(window);
    var sticky = $('.header-fixed');
    windows.on('scroll', function () {
        var scroll = windows.scrollTop();
        if (scroll < 50) {
            sticky.removeClass('stick');
        } else {
            sticky.addClass('stick');
        }
    });
    /*====================================
           One Page Scroll
======================================*/

    // Select all »a« elements with a parent class »links« and add a function that is executed on click
    $('.navbar-nav .nav-item a').on('click', function (e) {

        // Define variable of the clicked »a« element (»this«) and get its href value.
        var href = $(this).attr('href');

        // Run a scroll animation to the position of the element which has the same id like the href value.
        $('html, body').animate({
            scrollTop: $(href).offset().top
        }, '300');

        // Prevent the browser from showing the attribute name of the clicked link in the address bar
        e.preventDefault();

    });

    /*====================================
        slick nav
    ======================================*/
    var logo_path = $('.mobile-menu').data('logo');
    $('.navbar-nav').slicknav({
        appendTo: '.mobile-menu',
        removeClasses: true,
        label: '',
        closedSymbol: '<i class="fa fa-angle-right"><i/>',
        openedSymbol: '<i class="fa fa-angle-down"><i/>',
        brand: '<img src="' + logo_path + '" class="img-fluid" alt="logo">'
    });


    /*====================================
            Testimonial slider
        ======================================*/

    $('.slider-for').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: false,
        asNavFor: '.slider-nav'
    });
    $('.slider-nav').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        asNavFor: '.slider-for',
        dots: false,
        arrows: true,
        centerMode: true,
        variableWidth: true,
        infinite: true,
        focusOnSelect: true,
        cssEase: 'linear',
        touchMove: true,
        responsive: [{
            breakpoint: 600,
            settings: {
                arrows: true,
                slidesToShow: 2
            }
        }, {
            breakpoint: 400,
            settings: {
                arrows: true,
                slidesToShow: 1
            }
        }]
    });

    /*====================================
        counter
    ======================================*/
    $('.counter').counterUp({
        delay: 10,
        time: 1000
    });

    /*====================================
     bottom to top
 ======================================*/

    var btn = $('#btn-to-top');
    $(window).on('scroll', function () {
        if ($(window).scrollTop() > 300) {
            btn.addClass('show');
        } else {
            btn.removeClass('show');
        }
    });
    btn.on('click', function (e) {
        e.preventDefault();
        $('html, body').animate({
            scrollTop: 0
        }, '300');
    });

})(jQuery);
