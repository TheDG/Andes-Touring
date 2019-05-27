// ========================================================================= //
//  Owl Carousel Services
// ========================================================================= //
$(document).on('turbolinks:load', () => {
  $('.services-carousel').owlCarousel({
    autoplay: true,
    loop: true,
    margin: 20,
    dots: true,
    nav: false,
    responsiveClass: true,
    responsive: {
      0: {
        items: 1
      },
      768: {
        items: 2
      },
      900: {
        items: 4
      }
    }
  });
});
$(document).on('turbolinks:load', () => {
  $('.img-carousel').owlCarousel({
    autoplay: true,
    loop: true,
    margin: 20,
    singleItem: true
  });
});

$(document).on('turbolinks:before-cache', function() {
  const carousel = $('.services-carousel');
  const img = $('.img-carousel');

  carousel.owlCarousel('destroy');
  img.owlCarousel('destroy');
});
