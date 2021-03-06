/* global $, jQuery, alert*/
$(document).on('turbolinks:load', function() {
  'use strict';
  // ========================================================================= //
  //  //SMOOTH SCROLL
  // ========================================================================= //

  $(document).on('scroll', onScroll);

  $('a[href^="#"]').on('click', function(e) {
    e.preventDefault();
    $(document).off('scroll');

    if ($('.home').length) {
      $('a').each(function() {
        $(this).removeClass('active');
      });

      $(this).addClass('active');

      let target = this.hash;
      const menu = target;

      target = $(target);
      $('html, body').stop().animate({
        scrollTop: target.offset().top - 80
      }, 500, 'swing', function() {
        window.location.hash = target.selector;
        $(document).on('scroll', onScroll);
      });
    }
  });


  function onScroll(event) {
    if ($('.home').length) {
      const scrollPos = $(document).scrollTop();
      $('nav ul li a').each(function() {
        const currLink = $(this);
        const refElement = $(currLink.attr('href'));
      });
    }
  }

  // ========================================================================= //
  //  //NAVBAR SHOW - HIDE
  // ========================================================================= //


  $(window).scroll(function() {
    const scroll = $(window).scrollTop();
    if (scroll > 200) {
      $('#main-nav, #main-nav-subpage').slideDown(700);
      $('#main-nav-subpage').removeClass('subpage-nav');
    } else {
      $('#main-nav').slideUp(700);
      $('#main-nav-subpage').hide();
      $('#main-nav-subpage').addClass('subpage-nav');
    }
  });

  // ========================================================================= //
  //  // RESPONSIVE MENU
  // ========================================================================= //

  $('.responsive').on('click', function(e) {
    $('.nav-menu').slideToggle();
  });
});
