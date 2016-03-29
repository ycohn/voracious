$( document ).ready(function(){
  var menuDrop = $('.dropdown-menu')
  var menuToggle = $('.dropdown-toggle')
  menuToggle.on("click", function(){
    if (menuToggle.hasClass("clicked")) {
      hideMenu();
    } else {
      showMenu();
    }
  })
  function showMenu() {
    menuToggle.addClass("clicked");
    menuDrop.show();
  }
  function hideMenu() {
    menuToggle.removeClass("clicked");
    menuDrop.hide();
  }
});