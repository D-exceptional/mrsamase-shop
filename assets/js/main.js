/*  ---------------------------------------------------
    Template Name: Male Fashion
    Description: Male Fashion - ecommerce teplate
    Author: Colorib
    Author URI: https://www.colorib.com/
    Version: 1.0
    Created: Colorib
---------------------------------------------------------  */

'use strict';

(function ($) {

    /*------------------
        Preloader
    --------------------*/
    $(window).on('load', function () {
        $(".loader").fadeOut();
        $("#preloder").delay(200).fadeOut("slow");

        /*------------------
            Gallery filter
        --------------------*/
        $('.filter__controls li').on('click', function () {
            $('.filter__controls li').removeClass('active');
            $(this).addClass('active');
        });

        if ($('.product__filter').length > 0) {
            var containerEl = document.querySelector('.product__filter');
            var mixer = mixitup(containerEl, {
                callbacks: {
                    onMixEnd: function(state) {
                        updateButtons();
                    }
                }
            });
    
            // Initial call after MixItUp initialized
            updateButtons();
        }
    });

    function updateButtons() {
        const $visibleItems = $('.product__filter').children(':visible');
        const $prevBtn = $('.product__filter.btn-left'); // update selector to your actual prev button
        const $nextBtn = $('.product__filter.btn-right'); // update selector to your actual next button
      
        if ($visibleItems.length <= 1) {
          $prevBtn.hide();
          $nextBtn.hide();
        } else {
          $prevBtn.show();
          $nextBtn.show();
        }
    }

    /*------------------
        Background Set
    --------------------*/
    $('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });

    /*------------------
		Navigation
	--------------------*/
    $(".mobile-menu").slicknav({
        prependTo: '#mobile-menu-wrap',
        allowParentLinks: true
    });

    /*------------------
        Accordin Active
    --------------------*/
    $('.collapse').on('shown.bs.collapse', function () {
        $(this).prev().addClass('active');
    });

    $('.collapse').on('hidden.bs.collapse', function () {
        $(this).prev().removeClass('active');
    });

    function toggleNav(action) {
        const isOpen = action === "Open";
        $(".offcanvas-menu-overlay")
        .css({
            display: isOpen ? "block" : "none",
            zIndex: isOpen ? 10000 : 99
        });
        $(".offcanvas-menu-wrapper")
        .css({
            display: isOpen ? "block" : "none",
            zIndex: isOpen ? 100000 : 98
        });
    }

    //Canvas Menu
    $(".canvas__open").on('click', function () {
        toggleNav("Open");
        $(this).hide();
    });

    $(".offcanvas-menu-overlay, .offcanvas-menu-wrapper ul li").on('click', function () {
        toggleNav("Close");
        $(".canvas__open").show();
    });

    /*-----------------------
        Hero Slider
    ------------------------*/
    $(".hero__slider").owlCarousel({
        loop: true,
        margin: 0,
        items: 1,
        dots: true,
        nav: false,
        navText: ["<span class='arrow_left'><span/>", "<span class='arrow_right'><span/>"],
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        smartSpeed: 1000,
        autoHeight: false,
        autoplay: true
    });

    /*--------------------------
        Select
    ----------------------------*/
    $("select").niceSelect();

    /*-------------------
		Radio Btn
	--------------------- */
    $(".product__color__select label, .shop__sidebar__size label, .product__details__option__size label").on('click', function () {
        $(".product__color__select label, .shop__sidebar__size label, .product__details__option__size label").removeClass('active');
        $(this).addClass('active');
    });

    /*-------------------
		Scroll
	--------------------- */
    $(".nice-scroll").niceScroll({
        cursorcolor: "#0d0d0d",
        cursorwidth: "5px",
        background: "#e5e5e5",
        cursorborder: "",
        autohidemode: true,
        horizrailenabled: false
    });

    /*------------------
        CountDown
    --------------------*/
    // For demo preview start
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();

    if(mm == 12) {
        mm = '01';
        yyyy = yyyy + 1;
    } else {
        mm = parseInt(mm) + 1;
        mm = String(mm).padStart(2, '0');
    }
    var timerdate = mm + '/' + dd + '/' + yyyy;
    // For demo preview end


    // Uncomment below and use your date //

    /* var timerdate = "2020/12/30" */

    $("#countdown").countdown(timerdate, function (event) {
        $(this).html(event.strftime("<div class='cd-item'><span>%D</span> <p>Days</p> </div>" + "<div class='cd-item'><span>%H</span> <p>Hours</p> </div>" + "<div class='cd-item'><span>%M</span> <p>Minutes</p> </div>" + "<div class='cd-item'><span>%S</span> <p>Seconds</p> </div>"));
    });

    /*------------------
		Magnific
	--------------------*/
    $('.video-popup').magnificPopup({
        type: 'iframe'
    });

    /*-------------------
		Quantity change
	--------------------- */
    var proQty = $('.pro-qty');
    proQty.prepend('<span class="fa fa-angle-up dec qtybtn"></span>');
    proQty.append('<span class="fa fa-angle-down inc qtybtn"></span>');
    proQty.on('click', '.qtybtn', function () {
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        if ($button.hasClass('inc')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        $button.parent().find('input').val(newVal);
    });

    var proQty = $('.pro-qty-2');
    proQty.prepend('<span class="fa fa-angle-left dec qtybtn"></span>');
    proQty.append('<span class="fa fa-angle-right inc qtybtn"></span>');
    proQty.on('click', '.qtybtn', function () {
        var $button = $(this);
        var oldValue = $button.parent().find('input').val();
        if ($button.hasClass('inc')) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldValue > 0) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 0;
            }
        }
        $button.parent().find('input').val(newVal);
    });

    /*------------------
        Achieve Counter
    --------------------*/
    $('.cn_num').each(function () {
        $(this).prop('Counter', 0).animate({
            Counter: $(this).text()
        }, {
            duration: 4000,
            easing: 'swing',
            step: function (now) {
                $(this).text(Math.ceil(now));
            }
        });
    });

    /*------------------
    Sticky Nav
    --------------------*/
    $(window).on('scroll', function() {
        if ($(this).scrollTop() > 100) {
            $('.header').addClass('fixed-header');
        } else {
            $('.header').removeClass('fixed-header');
        }
    });

    /*------------------
    Prev / Next Buttons
    --------------------*/
    const indexes = new Map();

    $(document).on('click', '.view-scroll.btn-right', function() {
        const $container = $(this).parent().find('.row-block');
        const container = $container[0];
        const cards = $container.find('.item-box');
        
        let currentIndex = indexes.get(container) || 0;
        
        if (currentIndex < cards.length - 1) currentIndex++;
        
        indexes.set(container, currentIndex);
        scrollToCenter(container, cards.eq(currentIndex)[0]);
    });

    $(document).on('click', '.view-scroll.btn-left', function() {
        const $container = $(this).parent().find('.row-block');
        const container = $container[0];
        const cards = $container.find('.item-box');
        
        let currentIndex = indexes.get(container) || 0;
        
        if (currentIndex > 0) currentIndex--;
        
        indexes.set(container, currentIndex);
        scrollToCenter(container, cards.eq(currentIndex)[0]);
    });

    function scrollToCenter(container, item) {
        const offset = item.offsetLeft - (container.clientWidth / 2) + (item.clientWidth / 2);
        
        container.scrollTo({
            left: offset,
            behavior: 'smooth'
        });
    }

    /*------------------
    Activate Main Navbar
    --------------------*/
    $(document).on('click', '.header__nav__option a', function(e) {
        e.preventDefault();

        const iconElement = $(this).find('i');
        const iconClass = iconElement.attr("class");

        switch (iconClass) {
            case "fa fa-bell":
                // Navigate to notifications page (later)
                break;
            case "fa fa-shopping-cart":
                // Navigate to cart page (later)
                break;
            case "fa fa-user":
                // Navigate to profile page (later)
                break;
            case "fa fa-bars":
                // Open side nav
                if($(".offcanvas-menu-wrapper").hasClass("active")){
                    toggleNav("Close");
                }
                else{
                    toggleNav("Open");
                }
                break;
        }
    });

})(jQuery);