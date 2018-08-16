$(document).ready(function() {
  addEventListeners()
});

function addEventListeners() {
  $(".js-more").click(() => showMoreLogs())

  /* $("h4.logs-js").click(function(event) {
    event.preventDefault();
    var id = $(this).data("id");
    $.get("/dailylogs", function(data) {
      var logs = data
      var log = ""
      logs.forEach(function(log) {
        log += '<li class="js-logs" data-id="' + log["id"] + '">'  + log["time_in"] +   log["summary"] + '</li>';
      });

      $("div").html(log)
    })
  }) */
}

function showMoreLogs() {
  var babyId = $("h4.logs-js").data("id")
  if (babyId) {
    $.get("/babies/" + babyId + "/logs", function(data) {
      const logs = data
      var logsList = ""

      logs.forEach(function(log) {
        logsList +=
        '<li>' + '<strong>' + log["date_format_for_time_in"] + '</strong>'+ '<br>' +
        '<strong>Time In: </strong>' +  log["time_in_format"] + '<br>' +
        '<strong>Naps: </strong>' + log["nap"] + ' times' + '<br>' +
        '<strong>Meal: </strong>' + log["meal"] + ' times' +  '<br>' +
        '<strong>Diaper Changes: </strong>' + log["diaper"] + ' times' + '<br>' +
        '<strong>Meds: </strong>' + log["meds"] + '<br>' +
        '<strong>Playtime: </strong>' + log["play_time"] + ' times' +  '<br>' +
        '<strong>Summary: </strong>' + log["summary"] + '<br>' +
        '<strong>Time Out: </strong>' + log["time_out_format"] + '<br>'
        '</li>'
      })

      $('ul.baby-logs').empty();
      $("ul.baby-logs").append(logsList)
    })
  } else {
    $.get("/logs", function(data) {

      const logs = data
      var logsList = ""

      logs.forEach(function(log) {
        logsList +=

        '<h2>' + '<strong>' + log["baby"]["name"] + '</strong>' + '</h2>'+ '<br>' +
        '<li>' + '<strong>' + log["date_format_for_time_in"] + '</strong>'+ '<br>' +

        '<strong>Time In: </strong>' +  log["time_in_format"] + '<br>' +
        '<strong>Naps: </strong>' + log["nap"] + ' times' + '<br>' +
        '<strong>Meal: </strong>' + log["meal"] + ' times' +  '<br>' +
        '<strong>Diaper Changes: </strong>' + log["diaper"] + ' times' + '<br>' +
        '<strong>Meds: </strong>' + log["meds"] + '<br>' +
        '<strong>Playtime: </strong>' + log["play_time"] + ' times' +  '<br>' +
        '<strong>Summary: </strong>' + log["summary"] + '<br>' +
        '<strong>Time Out: </strong>' + log["time_out_format"] + '<br>' +
        '</li>'
      })

      $('div.logs').empty();
      $("div.logs").append(logsList)

    })
  }

}
