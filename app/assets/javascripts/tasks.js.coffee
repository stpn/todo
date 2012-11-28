# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$("complete_task_1").click ->
  $.ajax
    url: $(this).data("href")
    type: "PUT"
    dataType: "html"
    success: (data, textStatus, jqXHR) ->
      console.log("task updated")
