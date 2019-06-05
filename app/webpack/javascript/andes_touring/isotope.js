// ========================================================================= //
//  Isotope
// ===
$(document).on('turbolinks:load', () => {
  const portfolioIsotope = $('#portfolio-container').imagesLoaded(function() {
    portfolioIsotope.isotope({
      itemSelector: '.portfolio-thumbnail',
      layoutMode: 'fitRows',
      sortBy: 'random'
    });
    $('#portfolio-flters li').on('click', function() {
      $('#portfolio-flters li').removeClass('filter-active');
      $(this).addClass('filter-active');

      portfolioIsotope.isotope({
        filter: $(this).data('filter')
      });
    });
  });
});


$(document).on('turbolinks:before-cache', function() {
  const portfolioIsotope = $('#portfolio-container');
});
