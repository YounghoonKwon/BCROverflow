$(document).ready(function() {
  $(".answer_buttons").find("a").on('click', function(e){
    e.preventDefault()
    $("div[class='answer']").slideToggle();
  })
});
