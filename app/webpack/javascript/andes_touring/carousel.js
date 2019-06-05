// ========================================================================= //
//  Owl Carousel Services
// ========================================================================= //
const Carousel = {};

Carousel.owlResize = function(selector) {
  const $carousel = selector;
  $carousel.data('owl.carousel')._invalidated.width = true;
  $carousel.trigger('refresh.owl.carousel');
};

$(document).on('turbolinks:load', () => {
  const owl = $('.services-carousel').owlCarousel({
    autoplay: true,
    loop: true,
    margin: 20,
    dots: false,
    nav: false,
    responsive: {
      0: {
        items: 1
      },
      600: {
        items: 2
      },
      976: {
        items: 4
      }
    }
  });
  setTimeout(function() {
    Carousel.owlResize(owl);
  }, 321);
});

$(document).on('turbolinks:load', () => {
  const owl = $('.img-carousel').owlCarousel({
    autoplay: true,
    loop: true,
    margin: 10,
    dots: true,
    nav: false,
    responsiveClass: true,
    responsive: {
      0: {
        items: 1
      },
      600: {
        items: 1
      },
      760: {
        items: 2
      },
      900: {
        items: 3
      }
    }
  });
  setTimeout(function() {
    Carousel.owlResize(owl);
  }, 321);
});

$(document).on('turbolinks:before-cache', function() {
  const carousel = $('.services-carousel');
  const img = $('.img-carousel');

  carousel.owlCarousel('destroy');
  img.owlCarousel('destroy');
});
