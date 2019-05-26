// ========================================================================= //
//  Typed Js
// ========================================================================= //

$(document).on('turbolinks:load', () => {
  const options = {
    strings: ['Innovation.', 'Discovery.'],
    typeSpeed: 100,
    backSpeed: 100,
    showCursor: true,
    cursorChar: '|',
    loop: true
  };
  const typed = new Typed('.typed', options);
});
