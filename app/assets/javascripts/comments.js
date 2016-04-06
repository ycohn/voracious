$( document ).ready(function(){
  var commentBtn = $('.comment-btn');
  $('.comments-form').hide();
  commentBtn.on('click', function(e){
    if (!$(e.target).hasClass('selected')) {
    showForm($(e.target), $(e.target).next());
   } else {
    hideForm($(e.target), $(e.target).next());
   };
  });
  function showForm(button, form) {
    button.addClass('selected').text("Hide Comment Form");
    form.show();
  }
  function hideForm(button, form) {
    button.removeClass('selected').text("Comment");
    form.hide();
  }
});



  // $('.dots').on('click', function(e) {
  //   autoscroll(false);
  //   if (!$(e.target).hasClass('selected')) {
  //     selectDot($(e.target));
  //     currentIndex = $('.dots .selected').index();
  //     showSlider(currentIndex);
  //     autoscroll(true);
  //   }
  // });