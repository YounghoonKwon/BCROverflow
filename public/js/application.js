$(document).ready(function() {
  $(".answer_buttons").find("a").on('click', function(e){
    e.preventDefault()
    $("div[class='answer']").slideToggle()
  })
  $(".submit_answer").on('submit', function(e) {
    e.preventDefault()
    var $this = $(this)
    var url =$this.closest("form").attr('action')
    $.ajax({
      url: url,
      method: 'POST',
      data: $this.serialize()
    }).done(function(response){
      $('.answer_list').append(response)
    })
  })
  $(".question_upvote").on('submit', function(e){
    e.preventDefault()
    var $this = $(this)
    var url = $this.closest("form").attr('action')
    $.ajax({
      url: url,
      method: 'POST'
    }).done(function(response){
      $(".question_vote_count").text(response)
    })
  })
  $(".question_downvote").on('submit', function(e){
    e.preventDefault()
    var $this = $(this)
    var url = $this.closest("form").attr('action')
    $.ajax({
      url: url,
      method: 'POST'
    }).done(function(response){
      $(".question_vote_count").text(response)
    })
  })
  $(".answer_upvote").on('submit', function(e){
    e.preventDefault()
    var $this = $(this)
    var url = $this.closest("form").attr('action')
    $.ajax({
      url: url,
      method: 'POST'
    }).done(function(response){
      $($this).siblings(".answer_vote_count").text(response)
    })
  })
  $(".answer_downvote").on('submit', function(e){
    e.preventDefault()
    var $this = $(this)
    var url = $this.closest("form").attr('action')
    $.ajax({
      url: url,
      method: 'POST'
    }).done(function(response){
      $($this).siblings(".answer_vote_count").text(response)
    })
  })
});
