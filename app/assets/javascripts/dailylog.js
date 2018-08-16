$(document).ready(function() {
  addEventListeners()
});

function addEventListeners() {
  $(".js-more").click(() => showMoreLogs())
  $(".js-next").click(() => showNextLog())
}


function showMoreLogs() {

  var babyId = $("h4.logs-js").data("id")
  if (babyId) {
    $.get("/babies/" + babyId + "/logs", function(data) {
      const logs = data
      var logsList = ""

      logs.forEach(function(log) {
        logsList +=
        '<button class="js-next"' + "data-id=" + `${log["id"]}` + '>' + log["date_format_for_time_in"] + '</button>' + '<br>' +
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

      $("div.logs").empty();
      $("div.logs").append(logsList)
    })
  }
}

function showNextLog() {
  var nextId = parseInt($(".js-next").attr("data-id")) + 1
  $.get("/dailylogs/" + nextId + "/log", function(data) {
    const log = data
    $(".logBaby").text("Baby: " + log["baby"]["name"])
    $(".logDay").text(log["date_format_for_time_in"])
    $(".logTimeIn").text("Time In: " + log["time_in_format"])
    $(".logNap").text("Napped " + log["nap"] + " times")
    $(".logMeal").text("Ate " + log["meal"] + " times")
    $(".logPlay").text("Played for " + log["play_time"] + " hours")
    $(".logDiaper").text("Changed diapers " + log["diaper"] + " times")
    $(".logComments").text("General Comments for Today: " + log["summary"])
    $(".logTimeOut").text("Time Out: " + log["time_out_format"])
    $(".js-next").attr("data-id", data["id"]);
    })
  }


/*
if babyID exists on the logs index show page with jquery
else if (parseInt($(".logs a").attr("href").slice(-1))){
  var babyIdFromLogs = parseInt($(".logs a").attr("href").slice(-1))
  $.get("/babies/" + babyIdFromLogs + "/logs", function(data) {
    const logs = data
    var logsList = ""

    logs.forEach(function(log) {
      logsList +=
      '<button class="js-next"' + "data-id=" + `${log["id"]}` + '>' + log["date_format_for_time_in"] + '</button>' + '<br>' +
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

    $("div.logs").empty();
    $("div.logs").append(logsList)
  })

}
*/
