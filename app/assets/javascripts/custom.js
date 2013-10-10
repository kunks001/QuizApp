$(function() {
  $('.remove_answer').click(function() {
	  $(this).prev("input[type=hidden]").val("1");
	  $(this).closest(".answer").hide();
  });
});

$(function() {
  $('.remove_question').click(function() {
	  $(this).prev("input[type=hidden]").val("1");
	  $(this).closest(".question").hide();
  });
});