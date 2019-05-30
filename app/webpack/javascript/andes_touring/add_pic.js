const SkiRoute = {};

SkiRoute.addPic = function(e) {
  const container = $('#extra_pic-container');
  const checkCount = container.find('.extra_pic').length;
  if (checkCount < 10) {
    if (checkCount === 9) {
      $(this).remove();
    }

    const lastPic = container.find('.extra_pic:last');

    const clone = lastPic.clone();

    const id = parseInt(clone.attr('data-id')) + 1;
    clone.attr('data-id', id);

    // change modal button
    const modalBtn = clone.find('.modal_btn');
    modalBtn.attr('data-target', `#pic_modal-${id}`);

    // change actual modal content
    const modal = clone.find('.modal');
    modal.attr('id', `pic_modal-${id}`);
    const modalHeader = clone.find('#header-counter');
    modalHeader.text(id);

    // change modal data fields
    const description = clone.find('.pic_description');
    description.attr('name', `ski_route[pictures_attributes][${id}][description]`);
    description.attr('id', `ski_route[pictures_attributes][${id}][description]`);
    description.val('');

    // change image data fields
    const image = clone.find('.custom-file-input');
    image.attr('name', `ski_route[pictures_attributes][${id}][image]`);
    image.attr('id', `ski_route[pictures_attributes][${id}][image]`);
    image.attr('value', ``);

    clone.find('.bootstrap-filestyle').remove();
    clone.find(':file').filestyle({
    });
    clone.insertAfter(lastPic);
  }
};

$(document).on('turbolinks:load', function() {
  $('#ski_route-add_pic').on('click', SkiRoute.addPic);
});
