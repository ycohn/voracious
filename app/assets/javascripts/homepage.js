$( document ).ready(function(){
  var signup = $('.homepage-signup');
  var signin = $('.homepage-signin');
  signup.hide();
  signin.hide();
  $('.home-btn-signup').on('click', function(){
    showForm(signup, signin);
  });
  $('.home-btn-signin').on('click', function(){
    showForm(signin, signup);
  });
  function showForm(toShow, toHide) {
    toShow.show();
    toHide.hide();
     $('html,body').animate({
        scrollTop: toShow.parent().offset().top},
        'slow');
  }
});