// $(document).ready(function() {
//   $(".remove_answer .remove_question").attr('data-no-turbolink', true);
// });

$(function() {
  $('.remove_answer').click(function(event) {
  	event.preventDefault();
  	alert("you sure?");
	  $(this).prev("input[type=hidden]").val("1");
	  $(this).parent().hide();
  });
});

$(function() {
  $('.remove_question').click(function(event) {
  	event.preventDefault();
  	alert("you sure?");
	  $(this).prev("input[type=hidden]").val("1");
	  $(this).parent().hide();
  });
});


$('.hide_question').click(function(event) { 
  event.preventDefault();        
  $(this).next(".question").hide();
});


// $(".add_question").click(function(event){
//   event.preventDefault(); 
//   var q = (document).getElementsByClassName("question:first").first(); 
//   $('#form').appendChild(q);
// }); 

$(".add_question").click(function(event){
  event.preventDefault(); 
  var Target = $('.question:first');
  var CloneTarget = $(Target).clone();
  CloneTarget.insertAfter('.question:last');
});