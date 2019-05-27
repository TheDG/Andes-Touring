// ========================================================================= //
//  Typed Js
// ========================================================================= //

$(document).on('turbolinks:load', () => {
  const options = {
    strings: ['Innovation.', 'Discovery.', 'Community.', 'SKIING.'],
    typeSpeed: 100,
    backSpeed: 100,
    showCursor: true,
    cursorChar: '|',
    loop: true
  };
  const typed = $('.typed');
  if (typed.length) {
    new Typed('.typed', options);
  }
});
