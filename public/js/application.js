$(document).ready(function() {
  $(".answer_buttons").find("a").on('click', answer_buttons)
  $(".submit_answer").on('submit', submit_answer)
  $(".question_upvote").on('submit', question_upvote)
  $(".question_downvote").on('submit', question_downvote)
  $(".answer_upvote").on('submit', answer_upvote)
  $(".answer_downvote").on('submit', answer_downvote)
});


var answer_buttons = function(e){
    e.preventDefault()
    $("div[class='answer']").slideToggle()
  }

var submit_answer = function(e) {
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
  }

var question_upvote = function(e){
    e.preventDefault()
    var $this = $(this)
    var url = $this.closest("form").attr('action')
    $.ajax({
      url: url,
      method: 'POST'
    }).done(function(response){
      $(".question_vote_count").text("question score: " + response)
    })
  }

var question_downvote = function(e){
    e.preventDefault()
    var $this = $(this)
    var url = $this.closest("form").attr('action')
    $.ajax({
      url: url,
      method: 'POST'
    }).done(function(response){
      $(".question_vote_count").text("question score: " + response)
    })
  }

var answer_upvote = function(e){
    e.preventDefault()
    var $this = $(this)
    var url = $this.closest("form").attr('action')
    $.ajax({
      url: url,
      method: 'POST'
    }).done(function(response){
      $($this).siblings(".answer_vote_count").text("answer score: " + response)
    })
  }

var answer_downvote = function(e){
    e.preventDefault()
    var $this = $(this)
    var url = $this.closest("form").attr('action')
    $.ajax({
      url: url,
      method: 'POST'
    }).done(function(response){
      $($this).siblings(".answer_vote_count").text("answer score: " + response)
    })
  }



