$(document).ready(function() {
  addEventListeners()
});


function addEventListeners() {
  $(".js-more").click(() => showMoreLogs())
}


function showMoreLogs() {
  var babyId = $('#baby-id').attr('data-baby-id')
  if (babyId) {
    $.get("/babies/" + babyId + "/logs", function(data) {
      const logs = data
      var logsList = ""
      logs.forEach(function(log) {
        logsList +=
        '<button class="js-next"' + "data-id=" + `${log["id"]}` + '>' + log["date_format_for_time_in"] + '</button>' + '<br>' +
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

      $('div#babyLogs').empty();
      $("div#babyLogs").append(logsList)
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

      $("div.logs").empty();
      $("div.logs").append(logsList)
    })
  }
}
