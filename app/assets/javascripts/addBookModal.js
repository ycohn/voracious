$( document ).ready(function(){
  var bookModal = $('.modal')
  $('#bookModal').on("click", function(){
    $('.modal').addClass('modal-backdrop in');
    $('.modal').show("slow");
  });
  $('.close').on("click", function(){
    bookModal.slideUp().removeClass('modal-backdrop in');
  });
});